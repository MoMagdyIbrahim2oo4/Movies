import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/wishlist/data/wishlist_repository.dart';

class WishlistState {
  const WishlistState({this.movies = const []});
  final List<MovieDetails> movies;

  bool isSaved(int? movieId) =>
      movieId != null && movies.any((m) => m.id == movieId);

  WishlistState copyWith({List<MovieDetails>? movies}) =>
      WishlistState(movies: movies ?? this.movies);
}

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._repository) : super(const WishlistState()) {
    _authSubscription = fb_auth.FirebaseAuth.instance.authStateChanges().listen(
      _onAuthChanged,
    );
    _onAuthChanged(fb_auth.FirebaseAuth.instance.currentUser);
  }

  final WishlistRepository _repository;
  late final StreamSubscription<fb_auth.User?> _authSubscription;
  StreamSubscription<List<MovieDetails>>? _wishlistSubscription;
  String? _currentUid;

  void _onAuthChanged(fb_auth.User? user) {
    if (user?.uid == _currentUid) return;
    _currentUid = user?.uid;
    _wishlistSubscription?.cancel();
    if (user == null) {
      emit(const WishlistState());
      return;
    }
    _wishlistSubscription = _repository
        .watchWishlistFor(user.uid)
        .listen(
          (movies) => emit(state.copyWith(movies: movies)),
          onError: (_) {},
        );
  }

  void refreshForCurrentUser() =>
      _onAuthChanged(fb_auth.FirebaseAuth.instance.currentUser);

  Future<void> toggleWishlist(MovieDetails movie) =>
      _repository.toggleWishlist(movie);

  @override
  Future<void> close() {
    _authSubscription.cancel();
    _wishlistSubscription?.cancel();
    return super.close();
  }
}

extension MovieDetailsMapper on MovieDetails {
  Movie toMovie() => Movie(
    id: id?.toString() ?? '',
    title: title ?? 'Untitled',
    posterUrl: largeCoverImage ?? '',
    rating: rating ?? 0,
    year: year ?? 0,
  );
}

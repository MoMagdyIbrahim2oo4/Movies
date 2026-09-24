import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse/data/models/category_model.dart';
import 'package:movies/features/browse/data/repos/movie_category_repo.dart';

import '../../../../core/models/movie_model.dart';

part 'movie_category_state.dart';

class MovieCategoryCubit extends Cubit<MovieCategoryState> {
  MovieCategoryCubit(this.movieCategoryRepo) : super(MovieCategoryInitial());
  final MovieCategoryRepo movieCategoryRepo;

  String _selectedCategoryId = CategoryModel.categories.first.genrsId;
  String get selectedCategoryId => _selectedCategoryId;

  Future<void> movieCategory(String categoryId) async {
    _selectedCategoryId = categoryId;
    emit(MovieCategoryLoadingState());

    final moviesCategory = await movieCategoryRepo.getCategoryMovies(
      categoryId,
    );
    if (isClosed) return;
    moviesCategory.when(
      success: (categories) => emit(MovieCategorySuccessState(categories)),
      failure: (message) => emit(MovieCategoryFailureState(message)),
    );
  }
}

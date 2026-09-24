import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';

abstract class WishlistRepository {
  Stream<List<MovieDetails>> watchWishlistFor(String uid);
  Future<void> toggleWishlist(MovieDetails movie);
}

class FirebaseWishlistRepository implements WishlistRepository {
  FirebaseWishlistRepository({FirebaseFirestore? firestore, FirebaseAuth? auth})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CollectionReference<Map<String, dynamic>> _wishlistRefFor(String uid) =>
      _firestore.collection('users').doc(uid).collection('wishlist');

  @override
  Stream<List<MovieDetails>> watchWishlistFor(String uid) {
    return _wishlistRefFor(uid).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return MovieDetails(
          id: int.tryParse(doc.id),
          title: data['title'] as String?,
          largeCoverImage: data['largeCoverImage'] as String?,
          year: data['year'] as int?,
          rating: (data['rating'] as num?)?.toDouble(),
        );
      }).toList();
    });
  }

  @override
  Future<void> toggleWishlist(MovieDetails movie) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _wishlistRefFor(uid).doc(movie.id!.toString());
    final doc = await docRef.get();
    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set({
        'title': movie.title,
        'largeCoverImage': movie.largeCoverImage,
        'year': movie.year,
        'rating': movie.rating,
      });
    }
  }
}

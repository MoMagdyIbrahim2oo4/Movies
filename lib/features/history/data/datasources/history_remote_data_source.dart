import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/core/models/movie_model.dart';

class HistoryRemoteDataSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> addMovieToHistory(Movie movie) async {
    final user = _auth.currentUser;
    if (user == null) return;
    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .doc(movie.id)
        .set({
      ...movie.toMap(),
      'watched_at': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Movie>> getWatchHistory() async {
    final user = _auth.currentUser;
    if (user == null) return [];
    final snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .get();

    final docs = snapshot.docs.toList();
    docs.sort((a, b) {
      final aTime = a.data()['watched_at'] as Timestamp?;
      final bTime = b.data()['watched_at'] as Timestamp?;
      if (aTime == null && bTime == null) return 0;
      if (aTime == null) return 1;
      if (bTime == null) return -1;
      return bTime.compareTo(aTime);
    });

    return docs.map((doc) => Movie.fromJson(doc.data())).toList();
  }
}

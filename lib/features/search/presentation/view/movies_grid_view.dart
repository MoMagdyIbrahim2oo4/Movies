import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/movie_card.dart';

class MoviesGridVew extends StatelessWidget {
  MoviesGridVew({super.key});
  final List<Movie> movies = Movie.movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 8.h,
      ),
      itemBuilder: (context, index) => MovieCard(movie: movies[index]),
    );
  }
}

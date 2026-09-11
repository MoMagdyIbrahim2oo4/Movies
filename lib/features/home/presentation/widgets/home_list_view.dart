import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/movie_card.dart';

class HomeMovieList extends StatelessWidget {
  final List<Movie> movies;
  final double cardWidth;

  const HomeMovieList({
    super.key,
    required this.movies,
    this.cardWidth = 128,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (_, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) => SizedBox(
          width: cardWidth.w,
          child: MovieCard(movie: movies[index]),
        ),
      ),
    );
  }
}
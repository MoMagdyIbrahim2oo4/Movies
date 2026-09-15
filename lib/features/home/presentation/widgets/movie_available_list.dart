import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/movie_card.dart';

class MovieAvailableList extends StatelessWidget {
  const MovieAvailableList({
    super.key,
    required this.movies,
    required this.onChangePage,
  });

  final List<Movie> movies;
  final void Function(int, CarouselPageChangedReason) onChangePage;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: MovieCard(movie: movie),
        );
      },
      options: CarouselOptions(
        height: 351.h,
        initialPage: 4,
        viewportFraction: .5,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        // aspectRatio: 234 / 360,
        enlargeFactor: 0.3,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: onChangePage,
      ),
    );
  }
}

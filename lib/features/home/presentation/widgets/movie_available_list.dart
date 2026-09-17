import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/widgets/movie_card.dart';

class MovieAvailableList extends StatelessWidget {
  const MovieAvailableList({
    super.key,
    required this.movies,
    required this.onChangePage,
    this.currentIndex,
    this.initialPage = 4,
  });

  final List<Movie> movies;
  final int? currentIndex;
  final void Function(int, CarouselPageChangedReason) onChangePage;
  final int initialPage;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];
        return InkWell(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(AppRoutes.movieDetailsScreen, arguments: movie);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: MovieCard(movie: movie),
          ),
        );
      },
      options: CarouselOptions(
        height: 351.h,
        initialPage: initialPage,
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

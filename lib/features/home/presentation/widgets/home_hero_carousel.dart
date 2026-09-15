import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/home/presentation/widgets/custom_movie_background_image.dart';
import 'package:movies/features/home/presentation/widgets/movie_available_list.dart';

class HomeHeroCarousel extends StatefulWidget {
  final List<Movie> movies;

  const HomeHeroCarousel({super.key, required this.movies});

  @override
  State<HomeHeroCarousel> createState() => _HomeHeroCarouselState();
}

class _HomeHeroCarouselState extends State<HomeHeroCarousel> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Positioned.fill(
          child: CustomBackgroundMovieImage(
            width: width,
            imagePath: widget.movies[currentPageIndex].posterUrl,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 28.r),
              child: Image.asset(
                AppImages.available,
                fit: BoxFit.cover,
                width: width,
              ),
            ),
            MovieAvailableList(
              movies: widget.movies,
              onChangePage: (index, reason) {
                onChangePage(index);
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.r, vertical: 21.r),
              child: IgnorePointer(child: Image.asset(AppImages.watchNow)),
            ),
          ],
        ),
      ],
    );
  }

  void onChangePage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}

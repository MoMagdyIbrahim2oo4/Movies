import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/models/movie_model.dart';

class HomeHeroCarousel extends StatelessWidget {
  final List<Movie> movies;

  const HomeHeroCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 465.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.movie1917,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 42.h),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .68,
                child: _HeroPoster(movie: movies[index]),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Image.asset(
                AppImages.available,
                height: 56.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Image.asset(
                AppImages.watchNow,
                height: 76.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPoster extends StatelessWidget {
  final Movie movie;

  const _HeroPoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: movie.posterUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => ColoredBox(
              color: theme.colorScheme.surface,
              child: const Icon(Icons.movie_outlined),
            ),
          ),
          Positioned(
            top: 12.h,
            left: 12.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(180),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                child: Row(
                  children: [
                    Text(
                      movie.rating.toStringAsFixed(1),
                      style: theme.textTheme.labelMedium,
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.star_rounded,
                      color: theme.colorScheme.onSecondary,
                      size: 17.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

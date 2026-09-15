import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/routing/app_routes.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.movieDetailsScreen,
        arguments: movie,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: movie.posterUrl,
                fit: BoxFit.cover,
                errorWidget: (context, error, stackTrace) =>
                    Container(color: theme.colorScheme.surface),
              ),
            ),
            PositionedDirectional(
              top: 13.h,
              start: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(181),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${movie.rating}',
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.star,
                      color: theme.colorScheme.onSecondary,
                      size: 14.r,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

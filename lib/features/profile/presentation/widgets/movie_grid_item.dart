import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';

class MovieGridItem extends StatelessWidget {
  final Movie movie;

  const MovieGridItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              movie.posterUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
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
    );
  }
}

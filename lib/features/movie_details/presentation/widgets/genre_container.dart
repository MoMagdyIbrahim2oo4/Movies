import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class GenreContainer extends StatelessWidget {
  final String genre;
  const GenreContainer({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 122.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          genre,
          style: theme.textTheme.labelSmall!.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

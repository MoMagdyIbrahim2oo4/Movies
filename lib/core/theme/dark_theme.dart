import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_colors.dart';

class DarkTheme {
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkGray,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.amber,
        foregroundColor: AppColors.darkGray,
        padding: EdgeInsetsGeometry.symmetric(vertical: 16.h),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadiusGeometry.circular(15.r),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/constants/app_text_styles.dart';

class DarkTheme {
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkGray,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.darkGray,
        onPrimary: AppColors.crimson,
        secondary: AppColors.white,
        onSecondary: AppColors.amber,
        error: Colors.red,
        onError: AppColors.amberWithOpacity,
        surface: AppColors.darkCharcoalGray,
        onSurface: Colors.transparent
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGray,
      centerTitle: true,
      foregroundColor: AppColors.amber,
    ),
    textTheme: TextTheme(
      labelSmall: AppTextStyles.regular16Amber,
      labelMedium: AppTextStyles.regular20White,
      labelLarge: AppTextStyles.regular20DarkGray
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCharcoalGray,
      contentPadding: EdgeInsetsGeometry.symmetric(vertical: 20.h),
      hintStyle: AppTextStyles.regular16White,
      labelStyle: AppTextStyles.regular16White,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.2,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      prefixIconConstraints: BoxConstraints(
        minWidth: 40.w,
        minHeight: 24.h,

      ),
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
    ),
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

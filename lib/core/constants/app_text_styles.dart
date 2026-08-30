import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/constants/app_colors.dart';
class AppTextStyles{
  static final TextStyle regular16Amber=GoogleFonts.roboto(
    color: AppColors.amber,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle regular16White=GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle regular20White=GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle regular20DarkGray=GoogleFonts.roboto(
    color: AppColors.darkGray,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
}
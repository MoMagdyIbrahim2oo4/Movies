import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_Icons.dart';
import 'package:movies/core/constants/app_images.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.civilWar),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 13.w,
            top: 13.h,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                children: [
                  Text("7.7", style: Theme.of(context).textTheme.labelMedium),
                  SizedBox(width: 5.w),
                  Image.asset(AppImages.star),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

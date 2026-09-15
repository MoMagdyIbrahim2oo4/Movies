import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_colors.dart';

class CustomBackgroundMovieImage extends StatelessWidget {
  const CustomBackgroundMovieImage({
    super.key,
    required this.width,
    required this.imagePath,
  });

  final double width;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: AppColors.darkGray,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imagePath,
            fit: BoxFit.fill,
            errorWidget: (context, error, stackTrace) =>
                Container(color: AppColors.darkGray),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  AppColors.darkGray.withValues(alpha: .8),
                  AppColors.darkGray.withValues(alpha: .6),
                  AppColors.darkGray.withValues(alpha: 1.0),
                ],
                stops: [0.0, .47, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

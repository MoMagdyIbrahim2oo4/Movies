import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_colors.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ColoredBox(
        color: Colors.black.withValues(alpha: 0.5),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.amber,
          ),
        ),
      ),
    );
  }
}
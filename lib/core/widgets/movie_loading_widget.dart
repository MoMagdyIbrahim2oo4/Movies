import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_colors.dart';

class MovieLoadingWidget extends StatelessWidget {
  const MovieLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.loadingIndicator),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_Icons.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/movie_details/presentation/widgets/save_button.dart';

/// Poster image + gradient + back/save/play buttons + title/year.
class MovieHeader extends StatelessWidget {
  final Movie movie;
  const MovieHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Image.network(movie.posterUrl, fit: BoxFit.cover),
        Positioned.fill(
          child: Image.asset(AppImages.gradiant, fit: BoxFit.cover),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 21.h),
          child: Column(
            spacing: 180.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(AppIcons.backIcon),
                  ),
                  SaveButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.playIcon),
                  ),
                ],
              ),
              Column(
                spacing: 15.h,
                children: [
                  Text(
                    movie.title,
                    style: theme.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${movie.year}',
                    style: theme.textTheme.displayMedium!.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

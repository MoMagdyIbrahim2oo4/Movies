import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/movie_details/presentation/widgets/stats_container.dart';

class StatsRow extends StatelessWidget {
  final MovieDetails movie;
  const StatsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatsContainer(
          iconPath: AppIcons.heartIcon,
          value: '${movie.likeCount}',
        ),
        StatsContainer(iconPath: AppIcons.clockIcon, value: '${movie.runtime}'),
        StatsContainer(iconPath: AppIcons.starIcon, value: '${movie.rating}'),
      ],
    );
  }
}

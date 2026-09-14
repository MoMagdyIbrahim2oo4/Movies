import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_Icons.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/movie_details/presentation/widgets/stats_container.dart';

class StatsRow extends StatelessWidget {
  final Movie movie;
  const StatsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatsContainer(iconPath: AppIcons.heartIcon, value: '${movie.likes}'),
        StatsContainer(
          iconPath: AppIcons.clockIcon,
          value: '${movie.durationMinutes}',
        ),
        StatsContainer(iconPath: AppIcons.starIcon, value: '${movie.rating}'),
      ],
    );
  }
}

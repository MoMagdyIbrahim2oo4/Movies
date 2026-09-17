import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/movie_card.dart';

import '../../data/models/movie_details_response.dart';

class SimilarSection extends StatelessWidget {
  final MovieDetails currentMovie;
  const SimilarSection({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final similar = Movie.movies
        .where((m) => m.id != currentMovie.id)
        .take(4)
        .toList();
    if (similar.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16.h,
      children: [
        Text("similar".tr(), style: theme.textTheme.headlineLarge),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.68,
          ),
          children: [for (final m in similar) MovieCard(movie: m)],
        ),
      ],
    );
  }
}

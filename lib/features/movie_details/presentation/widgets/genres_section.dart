import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/features/movie_details/presentation/widgets/genre_container.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;
  const GenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16.h,
      children: [
        Text("genres".tr(), style: theme.textTheme.headlineLarge),
        Wrap(
          spacing: 16.w,
          runSpacing: 11.h,
          children: [for (final genre in genres) GenreContainer(genre: genre)],
        ),
      ],
    );
  }
}

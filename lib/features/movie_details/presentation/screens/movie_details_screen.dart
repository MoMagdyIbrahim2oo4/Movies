import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/features/movie_details/presentation/widgets/cast_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/genres_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/movie_header.dart';
import 'package:movies/features/movie_details/presentation/widgets/screenshots_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/similar_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/stats_row.dart';
import 'package:movies/features/movie_details/presentation/widgets/summary_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/watch_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 57.h),
            child: Column(
              children: [
                MovieHeader(movie: movie),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    spacing: 16.h,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      WatchButton(),
                      StatsRow(movie: movie),
                      ScreenshotsSection(screenshotUrls: movie.screenshotUrls),
                      SimilarSection(currentMovie: movie),
                      SummarySection(summary: movie.summary),
                      CastSection(cast: movie.cast),
                      GenresSection(genres: movie.genres),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

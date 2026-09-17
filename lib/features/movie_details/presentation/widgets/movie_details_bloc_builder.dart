import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/movie_loading_widget.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies/features/movie_details/presentation/widgets/cast_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/movie_header.dart';
import 'package:movies/features/movie_details/presentation/widgets/screenshots_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/similar_section.dart';
import 'package:movies/features/movie_details/presentation/widgets/stats_row.dart';
import 'package:movies/features/movie_details/presentation/widgets/summary_section.dart'
    show SummarySection;
import 'package:movies/features/movie_details/presentation/widgets/watch_button.dart';
import 'genres_section.dart' show GenresSection;

class MovieDetailsBlocBuilder extends StatelessWidget {
  const MovieDetailsBlocBuilder({super.key, required this.movie,});
    final Movie movie;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        switch (state) {
          case MovieDetailsInitial():
          case MovieDetailsLoading():
            return MovieLoadingWidget();
          case MovieDetailsFailuure():
            return Text('Error: ${state.errorMessage}');
          case MovieDetailsSuccess(:final movieDetails):
            if (movieDetails == null) {
              return const Center(child: Text('No details available'));
            }
            final moviesDetails = state.movieDetails;
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 57.h),
                    child: Column(
                      children: [
                        MovieHeader(movie: movieDetails),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            spacing: 16.h,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              WatchButton(),
                              StatsRow(movie: movieDetails),
                              ScreenshotsSection(
                                screenshotUrls: [
                                  moviesDetails!.mediumScreenshotImage1!,
                                  moviesDetails.mediumScreenshotImage2!,
                                  moviesDetails.mediumScreenshotImage3!,
                                ]
                              ),
                              SimilarSection(currentMovie: movie),
                              SummarySection(summary: movieDetails.descriptionFull!),
                              CastSection(cast: moviesDetails.cast!),
                              GenresSection(genres: movieDetails.genres ?? []),
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
      },
    );
  }
}
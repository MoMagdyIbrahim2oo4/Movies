import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/widgets/movie_card.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_sugestion_cubit.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_sugestions_state.dart';

import '../../data/models/movie_details_response.dart';

class SimilarSection extends StatelessWidget {
  final Movie currentMovie;
  const SimilarSection({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          getIt<MovieSugestionsCubit>()..loadSuggestions(currentMovie.id),
      child: BlocBuilder<MovieSugestionsCubit, MovieSugestionsState>(
        builder: (context, state) {
          switch (state) {
            case MovieSugestionsInitial():
            case MovieSugestionsLoading():
              return Center(child: CircularProgressIndicator());
            case MovieSugestionsError():
              return Center(
                child: Text(
                  'Error : ${state.message}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            case MovieSugestionsSuccess():
              final similar = state.movies;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16.h,
                children: [
                  Text("similar".tr(), style: theme.textTheme.headlineLarge),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) =>
                        MovieCard(movie: similar[index]),
                    itemCount: similar.length,
                    // children: [for (final m in similar) MovieCard(movie: m)],
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}

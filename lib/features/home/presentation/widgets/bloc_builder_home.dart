import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';
import 'package:movies/features/home/presentation/widgets/home_error_view.dart';
import 'package:movies/features/home/presentation/widgets/home_hero_carousel.dart';
import 'package:movies/features/home/presentation/widgets/movie_category_list.dart';
import 'package:movies/features/home/presentation/widgets/movie_section_title.dart';

class BlocBuilderHome extends StatelessWidget {
  const BlocBuilderHome({super.key, required this.onBrowse});

  final VoidCallback onBrowse;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            switch (state) {
              HomeLoading() => const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                ),
              ),
              HomeFailure(:final message) => SliverFillRemaining(
                child: HomeErrorView(
                  message: message,
                  onRetry: context.read<HomeCubit>().loadMovies,
                ),
              ),
              HomeSuccess(:final movies) => SliverList(
                delegate: SliverChildListDelegate([
                  HomeHeroCarousel(movies: movies),
                  MovieSectionTitle(title: 'Action', onSeeMore: onBrowse),
                  MovieCategoryList(movies: movies),
                  SizedBox(height: 24.h),
                ]),
              ),
              HomeInitial() => const SliverFillRemaining(
                child: SizedBox.shrink(),
              ),
            },
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/home/data/repositories/movie_repo_impl.dart';
import 'package:movies/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';
import 'package:movies/features/home/presentation/widgets/home_hero_carousel.dart';
import 'package:movies/features/home/presentation/widgets/home_list_view.dart';
import 'package:movies/features/home/presentation/widgets/home_error_view.dart';
import 'package:movies/features/home/presentation/widgets/movie_section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeCubit(repository: MovieRepoImpl(MovieRemoteDataSource()))
            ..loadMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              switch (state) {
                HomeLoading() => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
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
                    MovieSectionTitle(
                      title: 'Action',
                      onSeeMore: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('More movies coming soon'),
                          ),
                        );
                      },
                    ),
                    HomeMovieList(movies: movies),
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
      ),
    );
  }
}

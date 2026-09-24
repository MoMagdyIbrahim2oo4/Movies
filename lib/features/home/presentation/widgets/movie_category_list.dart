import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/widgets/failure_widget.dart';
import 'package:movies/core/widgets/movie_card.dart';
import 'package:movies/core/widgets/movie_loading_widget.dart';
import 'package:movies/features/browse/presentation/cubit/movie_category_cubit.dart';

class MovieCategoryList extends StatelessWidget {
  // final List<Movie> movies;
  final double cardWidth;

  const MovieCategoryList({
    super.key,
    // required this.movies,
    this.cardWidth = 128,
  });

  @override
  Widget build(BuildContext context) {
    var movieCategoryCubit = context.read<MovieCategoryCubit>();
    return BlocBuilder<MovieCategoryCubit, MovieCategoryState>(
      builder: (context, state) {
        switch(state) {
          case MovieCategoryInitial():
          case MovieCategoryLoadingState():
           return MovieLoadingWidget();
          case MovieCategoryFailureState():
            return FailureWidget(errorMessage: state.errorMessage,
                onRetry: (){
              movieCategoryCubit.movieCategory(movieCategoryCubit.selectedCategoryId);
            }
            );
          case MovieCategorySuccessState(:final categories):
            return SizedBox(
              height: 238.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, index) => SizedBox(width: 16.w),
                itemBuilder: (context, index) =>
                    SizedBox(
                      width: cardWidth.w,
                      child: MovieCard(movie: categories[index]),
                    ),
              ),
            );
        }

      },
    );
  }
}

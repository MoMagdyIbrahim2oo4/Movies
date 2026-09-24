import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_text_styles.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/failure_widget.dart';
import '../../../../core/widgets/movie_loading_widget.dart';
import '../../../../core/widgets/movies_grid_view.dart';
import '../cubit/movie_category_cubit.dart';

class CategoryContentWidget extends StatelessWidget {
  final MovieCategoryState state;
  final VoidCallback onRetry;

  const CategoryContentWidget({
    super.key,
    required this.state,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      MovieCategoryInitial() ||
      MovieCategoryLoadingState() => MovieLoadingWidget(),
      MovieCategoryFailureState(:final errorMessage) => FailureWidget(
        errorMessage: errorMessage,
        onRetry: onRetry,
      ),
      MovieCategorySuccessState(categories:final movieCategories) =>
        movieCategories.isEmpty
            ?  Center(
                child: Text(
                  'No movies found for this category',
                  style: AppTextStyles.regular20White,
                ),
              )
            : MoviesGridView(movies: movieCategories, crossAxisCount: 2),
    };
  }
}

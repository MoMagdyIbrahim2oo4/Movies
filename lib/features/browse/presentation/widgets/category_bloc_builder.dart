import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../data/models/category_model.dart';
import '../cubit/movie_category_cubit.dart';
import 'category_content_widget.dart';
import 'category_list_widget.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCategoryCubit, MovieCategoryState>(
      builder: (context, state) {
        final cubit = context.read<MovieCategoryCubit>();
        final categoriesList = CategoryModel.categories;

        return Padding(
          padding: EdgeInsets.only(
                top: 16.h ,
                right : 16.w ,
                left : 16.w ,
              ),
          child: Column(
            spacing: 13.h,
            children: [
              CategoryListWidget(
                categories: categoriesList,
                selectedCategoryId: cubit.selectedCategoryId,
                onCategorySelected: (category) {
                  cubit.movieCategory(category.genrsId);
                },
              ),
              Expanded(
                child: CategoryContentWidget(
                  state: state,
                  onRetry: () {
                    cubit.movieCategory(cubit.selectedCategoryId);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

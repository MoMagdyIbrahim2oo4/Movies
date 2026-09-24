import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/features/browse/data/models/category_model.dart';
import 'package:movies/features/browse/presentation/cubit/movie_category_cubit.dart';

import '../widgets/category_bloc_builder.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieCategoryCubit>()
        ..movieCategory(
          CategoryModel.categories.first.genrsId,
        ),
      child: const CategoryBlocBuilder(),
    );
  }
}

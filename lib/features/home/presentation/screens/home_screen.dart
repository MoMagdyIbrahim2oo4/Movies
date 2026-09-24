import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/widgets/bloc_builder_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onBrowse});

  final VoidCallback onBrowse;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..loadMovies(),
      child: BlocBuilderHome(onBrowse: onBrowse),
    );
  }
}

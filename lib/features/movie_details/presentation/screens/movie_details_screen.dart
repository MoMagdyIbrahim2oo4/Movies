import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/network/api_service.dart';

import 'package:movies/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response.dart';
import 'package:movies/features/movie_details/data/repos/movie_details_repo.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_details_cubit.dart';

import 'package:movies/features/movie_details/presentation/widgets/movie_details_bloc_builder.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var movieDetailsCubit = MovieDetailsCubit(
      MovieDetailsRepo(MovieDetailsRemoteDataSource(ApiService())),
    );
    // var movieData = ModalRoute.of(context)!.settings.arguments as Movie;
    return BlocProvider(
      create: (context) => movieDetailsCubit..getMoviesDetails(movieId: movie.id),
      child: MovieDetailsBlocBuilder(movie: movie),
    );
  }
}

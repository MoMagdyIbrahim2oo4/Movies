import 'package:get_it/get_it.dart';
import 'package:movies/core/network/api_service.dart';
import 'package:movies/features/movie_details/data/datasources/movie_sugesstions_remote_data_source.dart';
import 'package:movies/features/movie_details/data/repos/movie_sugestions_repo_imp.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_sugestion_cubit.dart';
import 'package:movies/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:movies/features/wishlist/data/wishlist_repository.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;

// 2. Register them at app startup
Future<void> configureDependencies() async {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerLazySingleton<MovieSugestionsRemoteDataSourceImp>(
    () => MovieSugestionsRemoteDataSourceImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<MovieSugestionsRepoImp>(
    () => MovieSugestionsRepoImp(getIt<MovieSugestionsRemoteDataSourceImp>()),
  );
  getIt.registerFactory<MovieSugestionsCubit>(
    () => MovieSugestionsCubit(getIt<MovieSugestionsRepoImp>()),
  );
  getIt.registerLazySingleton<WishlistRepository>(
        () => FirebaseWishlistRepository(),
  );
  getIt.registerFactory<WishlistCubit>(
        () => WishlistCubit(getIt<WishlistRepository>()),
  );

  // Search
  getIt.registerLazySingleton<SearchRemoteDataSourceImp>(
        () => SearchRemoteDataSourceImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SearchRepoImp>(
        () => SearchRepoImp(getIt<SearchRemoteDataSourceImp>()),
  );
  getIt.registerFactory<SearchCubit>(
        () => SearchCubit(getIt<SearchRepoImp>()),
  );

  // Browse Category
  getIt.registerSingleton<MovieCategoryRemoteDataSource>(
    MovieCategoryRemoteDataSource(getIt()),
  );
  getIt.registerSingleton<MovieCategoryRepo>(MovieCategoryRepoImpl(getIt()));
  getIt.registerFactory(() => MovieCategoryCubit(getIt()));

  // Home
  getIt.registerLazySingleton<MovieDataSource>(
        () => MovieRemoteDataSource(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<MovieRepository>(
        () => MovieRepoImpl(getIt<MovieDataSource>()),
  );
  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(repository: getIt<MovieRepository>()),
  );
}

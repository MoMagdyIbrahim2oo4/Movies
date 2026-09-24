import 'package:get_it/get_it.dart';
import 'package:movies/core/network/api_service.dart';
import 'package:movies/features/browse/data/datasources/movie_category_remote_data_source.dart';
import 'package:movies/features/browse/data/repos/movie_category_repo.dart';
import 'package:movies/features/browse/data/repos/movie_category_repo_impl.dart';
import 'package:movies/features/browse/presentation/cubit/movie_category_cubit.dart';
import 'package:movies/features/history/data/datasources/history_remote_data_source.dart';
import 'package:movies/features/history/data/repos/history_repo.dart';
import 'package:movies/features/history/presentation/cubit/history_cubit.dart';
import 'package:movies/features/movie_details/data/datasources/movie_sugesstions_remote_data_source.dart';
import 'package:movies/features/movie_details/data/repos/movie_sugestions_repo_imp.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_sugestion_cubit.dart';
import 'package:movies/features/search/data/datasources/search_remote_data_source.dart';
import 'package:movies/features/search/data/repos/search_repo_imp.dart';
import 'package:movies/features/search/presentation/cubit/search_cubit.dart';
import 'package:movies/features/wishlist/data/wishlist_repository.dart';
import 'package:movies/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:movies/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/home/data/repositories/movie_repository.dart';
import 'package:movies/features/home/data/repositories/movie_repo_impl.dart';
import 'package:movies/features/home/presentation/cubit/home_cubit.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;

// 2. Register them at app startup
Future<void> configureDependencies() async {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerLazySingleton<MovieSugestionsRemoteDataSourceImp>(
    () => MovieSugestionsRemoteDataSourceImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SearchRemoteDataSourceImp>(
    () => SearchRemoteDataSourceImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<MovieSugestionsRepoImp>(
    () => MovieSugestionsRepoImp(getIt<MovieSugestionsRemoteDataSourceImp>()),
  );
  getIt.registerLazySingleton<SearchRepoImp>(
    () => SearchRepoImp(getIt<SearchRemoteDataSourceImp>()),
  );
  getIt.registerFactory<MovieSugestionsCubit>(
    () => MovieSugestionsCubit(getIt<MovieSugestionsRepoImp>()),
  );
  getIt.registerFactory<SearchCubit>(
        () => SearchCubit(getIt<SearchRepoImp>()),
  );

  // Browse Category
  getIt.registerSingleton<MovieCategoryRemoteDataSource>(
    MovieCategoryRemoteDataSource(getIt()),
  );
  getIt.registerSingleton<MovieCategoryRepo>(MovieCategoryRepoImpl(getIt()));
  getIt.registerFactory(()=> MovieCategoryCubit(getIt()));

  // History
  getIt.registerLazySingleton<HistoryRemoteDataSource>(
    () => HistoryRemoteDataSource(),
  );
  getIt.registerLazySingleton<HistoryRepo>(
    () => HistoryRepo(getIt<HistoryRemoteDataSource>()),
  );
  getIt.registerFactory<HistoryCubit>(
    () => HistoryCubit(getIt<HistoryRepo>()),
  );

  // Wishlist
  getIt.registerLazySingleton<WishlistRepository>(
    () => FirebaseWishlistRepository(),
  );
  getIt.registerFactory<WishlistCubit>(
    () => WishlistCubit(getIt<WishlistRepository>()),
  );

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

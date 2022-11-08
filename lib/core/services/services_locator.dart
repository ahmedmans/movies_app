import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/playing_now_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // movie bloc object
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    // use cases object
    sl.registerLazySingleton(() => PopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => TopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => PlayingNowMovieUseCase(sl()));
    // repository object
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    // data sourc object
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/playing_now_movie_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // use cases object
    sl.registerLazySingleton(() => PlayingNowMovieUseCase(sl()));
    // repository object
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    // data sourc object
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

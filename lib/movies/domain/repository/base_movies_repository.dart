import 'package:movies_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<List<Movie>> getNowPlayingMovie();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}

import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class TopRatedMoviesUseCase {
  final BaseMoviesRepository moviesRepository;

  TopRatedMoviesUseCase(this.moviesRepository);

  Future<List<Movie>> execute() async {
    return await moviesRepository.getTopRatedMovies();
  }
}

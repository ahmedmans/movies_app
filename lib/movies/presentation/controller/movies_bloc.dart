import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/playing_now_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  MovieBloc() : super(const MoviesState()) {
    on<PlayingNowMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMoviesRepository moviesRepository =
          MoviesRepository(baseMovieRemoteDataSource);
      final result = await PlayingNowMovieUseCase(moviesRepository).execute();

      emit(const MoviesState(nowPlayingState: RequestState.isLoaded));

      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingState: RequestState.isError,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingState: RequestState.isLoaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });
  }
}

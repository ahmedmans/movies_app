import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/playing_now_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final PlayingNowMovieUseCase playingNowMovieUseCase;
  MovieBloc(this.playingNowMovieUseCase) : super(const MoviesState()) {
    on<PlayingNowMoviesEvent>((event, emit) async {
      final result = await playingNowMovieUseCase.execute();

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

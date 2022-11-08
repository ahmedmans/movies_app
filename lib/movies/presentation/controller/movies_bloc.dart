import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/playing_now_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final PlayingNowMovieUseCase playingNowMovieUseCase;
  final PopularMoviesUseCase popularMoviesUseCase;
  final TopRatedMoviesUseCase topRatedMoviesUseCase;
  MovieBloc(
    this.playingNowMovieUseCase,
    this.popularMoviesUseCase,
    this.topRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<PlayingNowMoviesEvent>(_getPlayingNow);

    on<PopularMoviesEvent>(_getPopularMovies);

    on<TopRatedMoviesEvent>(_getTopRated);
  }

  FutureOr<void> _getPlayingNow(
      PlayingNowMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await playingNowMovieUseCase.execute();

    //emit(const MoviesState(nowPlayingState: RequestState.isLoaded));

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.isError,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestState.isLoaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  Future<FutureOr<void>> _getPopularMovies(
      PopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await popularMoviesUseCase.execute();

    // emit(const MoviesState(popularState: RequestState.isLoaded));

    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.isError,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.isLoaded,
          popularMovies: r,
        ),
      ),
    );
  }

  Future<FutureOr<void>> _getTopRated(
      TopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await topRatedMoviesUseCase.execute();

    //emit(const MoviesState(topReatedState: RequestState.isLoaded));

    result.fold(
      (l) => emit(
        state.copyWith(
          topReatedState: RequestState.isError,
          topReatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topReatedState: RequestState.isLoaded,
          topReatedMovies: r,
        ),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class PlayingNowMoviesEvent extends MoviesEvent {}

class PopularMoviesEvent extends MoviesEvent {}

class TopRatedMoviesEvent extends MoviesEvent {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/playing_now_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieBloc()..add(PlayingNowMoviesEvent());
      },
      lazy: false,
      child: BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
        print(state);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Movies Screen"),
          ),
        );
      }),
    );
  }
}

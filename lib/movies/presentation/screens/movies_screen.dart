import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieBloc(sl())..add(PlayingNowMoviesEvent());
      },
      lazy: false,
      child: BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Movies Screen"),
          ),
        );
      }),
    );
  }
}

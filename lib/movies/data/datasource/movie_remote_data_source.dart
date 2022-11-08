import 'package:dio/dio.dart';
import 'package:movies_app/core/error/excpetions.dart';
import 'package:movies_app/core/helper/my_dio_client.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  final Dio _dio = MyDioClient.init();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await _dio.get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      final data = List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));

      return data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _dio.get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      final data = List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));

      return data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await _dio.get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      final data = List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));

      return data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}

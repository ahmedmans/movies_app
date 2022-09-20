import 'package:dio/dio.dart';
import 'package:movies_app/core/helper/my_dio_client.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

class MovieRemoteDataSource {
  final Dio _dio = MyDioClient.init();

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=8e5de9b3a5d392960b7e3c70e8a909b2");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      return [];
    }
  }
}

class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '8e5de9b3a5d392960b7e3c70e8a909b2';

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
}

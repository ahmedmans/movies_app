class Movie {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
  });
}

class Movie {
  final String title;
  final int id;
  final String overview;
  final String posterPath;
  final String backdropPath;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.backdropPath,
    this.posterPath,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'];
}

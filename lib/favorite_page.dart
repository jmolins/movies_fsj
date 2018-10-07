import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/movie_card.dart';

class FavoritePage extends StatefulWidget {
  final AppState appState;

  FavoritePage({@required this.appState}) : assert(appState != null);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.appState.movies
          .where((movie) => widget.appState.isFavorite(movie.id))
          .map((movie) {
        return MovieCard(
          movie: movie,
          callerPage: "favorite",
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/movie_card.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: appState.movies
          .where((movie) => appState.isFavorite(movie.id))
          .map((movie) {
        return MovieCard(
          movie: movie,
          callerPage: "favorite",
        );
      }).toList(),
    );
  }
}

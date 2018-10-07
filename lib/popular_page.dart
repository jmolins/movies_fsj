import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/movie_card.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/movie.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage>
    with AutomaticKeepAliveClientMixin<PopularPage> {
  @override
  void initState() {
    super.initState();
    if (appState.movies.isEmpty) getMoreItems();
  }

  getMoreItems() async {
    List<Movie> movies = await Api.getMovies(++appState.lastPage);
    appState.movies.addAll(movies);
    setState(() {});
  }

  Widget _buildPopularList() {
    if (appState.movies.isEmpty)
      return Center(child: CircularProgressIndicator());
    else
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index < appState.movies.length) {
            return MovieCard(
              movie: appState.movies[index],
              callerPage: "popular",
            );
          } else {
            getMoreItems();
            return Center(child: CircularProgressIndicator());
          }
        },
        itemCount: appState.movies.length + 1,
      );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPopularList();
  }

  @override
  bool get wantKeepAlive => true;
}

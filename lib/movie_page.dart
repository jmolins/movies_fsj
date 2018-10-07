import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/movie.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  final AppState appState;

  // This is used for the hero animation
  final String callerPage;

  MoviePage({
    @required this.movie,
    @required this.appState,
    @required this.callerPage,
  })  : assert(movie != null),
        assert(appState != null),
        assert(callerPage != null);

  @override
  MoviePageState createState() {
    return new MoviePageState();
  }
}

class MoviePageState extends State<MoviePage> {
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    favorite = widget.appState.isFavorite(widget.movie.id);
  }

  void onFavorite() {
    setState(() {
      favorite = !favorite;
      if (favorite)
        widget.appState.addFavorite(widget.movie.id);
      else
        widget.appState.removeFavorite(widget.movie.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              Api.imageUrl(widget.movie.backdropPath)),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFF000000)],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 130.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Hero(
                              tag: "${widget.callerPage}${widget.movie.id}",
                              child: Container(
                                height: 200.0,
                                width: 150.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(Api.imageUrl(
                                          widget.movie.posterPath)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star_half),
                                Icon(Icons.star_border),
                                Icon(Icons.star_border),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(widget.movie.title,
                            style: Theme.of(context).textTheme.headline),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          widget.movie.overview,
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 16.0, color: Colors.grey[600]),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                brightness: Brightness.light,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: onFavorite,
        icon: favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        iconSize: 35.0,
      ),
    );
  }
}

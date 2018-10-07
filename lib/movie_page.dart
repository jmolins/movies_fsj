import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/movie.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  MoviePage({@required this.movie});

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
    favorite = appState.isFavorite(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 220.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(Api.imageUrl(widget.movie.backdropPath)),
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
                        Container(
                          height: 200.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    Api.imageUrl(widget.movie.posterPath)),
                                fit: BoxFit.cover),
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
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 16.0, color: Colors.grey[600]),
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
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          favorite
              ? appState.removeFavorite(widget.movie.id)
              : appState.addFavorite(widget.movie.id);
          favorite = !favorite;
          setState(() {});
        },
        icon: favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        iconSize: 35.0,
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_fsj/movie_page.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/movie.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Movie> movies = [];

  int page = 1;

  @override
  void initState() {
    super.initState();
    getMoreMovies();
  }

  Future<List<Movie>> getMoreMovies() async {
    movies.addAll(await Api.getMovies(page));
    print(movies[0]);
    setState(() {});
  }

  Widget _buildCard(Movie movie) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return MoviePage(movie: movie);
              })
          );
        },
        child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  height: 170.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(Api.imageUrl(movie.posterPath)),
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(movie.title, style: Theme
                            .of(context)
                            .textTheme
                            .subhead),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          movie.overview,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies FSJ"),
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: movies.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          if (index < movies.length)
            return _buildCard(movies[index]);
          else {
            page++;
            getMoreMovies();
            return Center(child: CircularProgressIndicator());
          }
        },
        itemCount: movies.length + 1,
      ),
    );
  }
}

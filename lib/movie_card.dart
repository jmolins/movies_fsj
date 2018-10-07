import 'package:flutter/material.dart';
import 'package:movies_fsj/movie_page.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  final String callerPage;

  MovieCard({@required this.movie, @required this.callerPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return MoviePage(
                movie: movie,
                callerPage: callerPage,
              );
            }),
          );
        },
        child: Card(
          elevation: 3.0,
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                tag: "${callerPage}${movie.id}",
                child: Container(
                  width: 120.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(5.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                          "${Api.imageUrl(movie.posterPath)}",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 170.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(movie.title,
                            style: Theme.of(context).textTheme.subhead),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          movie.overview,
                          style: Theme.of(context).textTheme.body1,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

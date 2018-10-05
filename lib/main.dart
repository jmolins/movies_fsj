import 'package:flutter/material.dart';
import 'package:movies_fsj/tools/movie_json.dart';

void main() {
  runApp(new Center(
    child: Text("JSON - TEST MOVIE:\n\n$movie_json",
    textDirection: TextDirection.ltr,),
  ));
}

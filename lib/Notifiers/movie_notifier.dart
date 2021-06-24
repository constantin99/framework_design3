import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:framework_design3/Models/movie.dart';


class MovieNotifier with ChangeNotifier{
  List<Movie> _movieList = [];
  late Movie _currentMovie;

  UnmodifiableListView<Movie> get movieList => UnmodifiableListView(_movieList);

  Movie get currentMovie => _currentMovie;

  set movieList(List<Movie> movieList){
    _movieList = movieList;
    notifyListeners();
  }

  set currentMovie(Movie movie){
    _currentMovie = movie;
    notifyListeners();
  }
}
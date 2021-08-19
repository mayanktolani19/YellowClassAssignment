import 'package:flutter/cupertino.dart';
import 'package:yellow_class/Models/hive_movie.dart';
import 'package:yellow_class/Models/movie.dart';

class MovieListProvider extends ChangeNotifier {
  List<MovieModel> movieModelList = [];

  void setMovieList(List<MovieModel> list) {
    movieModelList = list;
    notifyListeners();
  }

  void addMovie(MovieModel newMovie){
    movieModelList.add(newMovie);
    notifyListeners();
  }

  void editMovie(int index, MovieModel editedMovie){
    movieModelList[index] = editedMovie;
    notifyListeners();
  }

  void deleteMovie(int index){
    movieModelList.removeAt(index);
    notifyListeners();
  }

  void clearMovieList() {
    movieModelList = [];
  }
}

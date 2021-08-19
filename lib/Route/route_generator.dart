import 'package:flutter/material.dart';
import 'package:yellow_class/Pages/add_movie.dart';
import 'package:yellow_class/Pages/edit_movie.dart';
import 'package:yellow_class/Pages/movie_list_view.dart';
import 'package:yellow_class/Pages/splash_screen.dart';
import 'package:yellow_class/Route/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.movieListViewRoute:
        return MaterialPageRoute(builder: (context) => MovieListView());
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.addMovieRoute:
        return MaterialPageRoute(builder: (context) => AddMovie());
      case Routes.editMovieRoute:
        return MaterialPageRoute(builder:(context)=>EditMovie(args));
    }
    return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}

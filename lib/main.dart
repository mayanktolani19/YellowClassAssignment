import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'Models/hive_movie.dart';
import 'Provider/movie_list_provider.dart';
import 'Route/route_generator.dart';
import 'Route/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieListProvider>(
          create: (context) => MovieListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.splashScreenRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

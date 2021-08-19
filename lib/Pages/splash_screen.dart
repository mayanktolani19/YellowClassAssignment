import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/Database/hive_database.dart';
import 'package:yellow_class/Models/hive_movie.dart';
import 'package:yellow_class/Models/movie.dart';
import 'package:yellow_class/Provider/movie_list_provider.dart';
import 'package:yellow_class/Utility/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigateUser();
    // TODO: implement initState
    super.initState();
  }

  void navigateUser(){
    Timer(const Duration(milliseconds: 1000), () async {
      HiveDatabase hiveDb = HiveDatabase();
      List<MovieModel>movieList = await hiveDb.getData();
      if(movieList.length!=0)
      Provider.of<MovieListProvider>(context, listen:false).setMovieList(movieList);
      print(Provider.of<MovieListProvider>(context, listen:false).movieModelList);
      Navigator.pushReplacementNamed(context, '/movieListView');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.accentColor,
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child:Icon(Icons.movie_filter_outlined, size: 90,),),
            Container(child:Text('Movie App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),))
          ],
        ),),);
  }
}

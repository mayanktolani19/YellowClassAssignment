import 'package:hive/hive.dart';
import 'package:yellow_class/Models/hive_movie.dart';
import 'package:yellow_class/Models/movie.dart';

class HiveDatabase{

  // var box = Hive.box('myBox');

  void setData(List<MovieModel>movies)async {
    var box = await Hive.openBox('myBox');
    List<List<String>>l = [];
    for(int i=0; i<movies.length;i++){
      List<String>temp = [movies[i].movieName, movies[i].directorName];
      l.add(temp);
    }
    print(l);
    box.put("movies",l);
    print(box.get("movies"));
  }

   Future<List<MovieModel>> getData()async{
    List<MovieModel>empty = [];
    try{
      var box = await Hive.openBox('myBox');
      var movies =  box.get("movies");
      List<MovieModel>l = [];
      for(int i=0;i<movies.length;i++){
        MovieModel m = MovieModel(movies[i][0],movies[i][1]);
        l.add(m);
      }
      return l;
    }
    catch(e){
      print(e);
      return empty;
    }
  }

}
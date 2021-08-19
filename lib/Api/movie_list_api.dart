// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:yellow_class/Models/movie.dart';
// import 'package:yellow_class/Provider/movie_list_provider.dart';
// import 'package:yellow_class/Utility/api.dart';
// import 'package:provider/provider.dart';
//
// class WatchListApi {
//   static Future<bool> getWatchList(
//       {required BuildContext context, required int index}) async {
//     try {
//       Provider.of<MovieListProvider>(context, listen: false).clearMovieList();
//       String url = Url.baseUrl;
//       if (index == 0) {
//         url += Url.currentlyWatching;
//       } else if (index == 1) {
//         url += Url.planToWatch;
//       } else {
//         url += Url.completedWatching;
//       }
//       print('---GET WATCH LIST---');
//       print(url);
//       Response response;
//       Dio dio = new Dio();
//       //Headers
//       dio.options.headers['Accept'] = "application/json";
//       dio.options.headers['Content-Type'] = "application/json";
//       dio.options.headers['Connection'] = "keep-alive";
//       response = await dio.get(url);
//       if (response.statusCode == 200) {
//         List<movieModel> watchList = [];
//         for (var i in response.data) {
//           // watchList.add(movieModel.fromJson(i));
//         }
//         Provider.of<MovieListProvider>(context, listen: false)
//             .setMovieList(watchList);
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print('--ERROR--');
//       print(e.toString());
//       return false;
//     }
//   }
// }

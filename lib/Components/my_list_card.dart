import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/Components/show_toast.dart';
import 'package:yellow_class/Database/hive_database.dart';
import 'package:yellow_class/Models/hive_movie.dart';
import 'package:yellow_class/Models/movie.dart';
import 'package:yellow_class/Provider/movie_list_provider.dart';
import 'package:yellow_class/Utility/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyListCard extends StatelessWidget {
  MovieModel model;
  int index;

  MyListCard({required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        showDialog(
            context: context,
            builder: (context) {
              return NAlertDialog(
                title: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text(
                      "Delete this movie?",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                content: SingleChildScrollView(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "NO",
                    ),
                    textColor: Colors.white,
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("YES"),
                    textColor: Colors.white,
                    color: AppColor.accentColor,
                    onPressed: () {
                      Provider.of<MovieListProvider>(context, listen: false).deleteMovie(index);
                      HiveDatabase hiveDb = HiveDatabase();
                      hiveDb.setData(Provider.of<MovieListProvider>(context, listen:false).movieModelList);
                      Navigator.of(context).pop();
                      showFlutterToast("Movie Deleted Successfully",  Colors.blue);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        width: double.infinity,
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor,
              spreadRadius: 5,
              blurRadius: 40,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: 'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.movieName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: AppColor.textColorLgDark,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model.directorName,
                                  style: TextStyle(
                                    color: AppColor.textColorMdDark,
                                  ),
                                ),
                                Text(
                                  '1999',
                                  style: TextStyle(
                                    color: AppColor.textColorMdDark,
                                  ),
                                ),
                                Text(
                                  'type',
                                  style: TextStyle(
                                    color: AppColor.textColorMdDark,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: AppColor.unselectedColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: IconButton(icon:Icon(Icons.edit),
                          iconSize: 20,
                          padding: EdgeInsets.all(0),
                          onPressed: (){
                          Navigator.of(context).pushNamed('/editMovie',arguments: index);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                            color: AppColor.textColorLgDark,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

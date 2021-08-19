import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/Api/movie_list_api.dart';
import 'package:yellow_class/Components/my_list_card.dart';
import 'package:yellow_class/Components/option_capsule.dart';
import 'package:yellow_class/Provider/movie_list_provider.dart';
import 'package:yellow_class/Utility/colors.dart';

class MovieListView extends StatefulWidget {
  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  int selectedTab = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListProvider>(
        builder: (context, movieModel, child) {
          return Scaffold(
            backgroundColor: AppColor.primaryColor,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: AppColor.iconColor,
                ),
              ),
              title: Text(
                'My Movie List',
                style: TextStyle(
                  color: AppColor.textColorLgDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
              elevation: 0,
              backgroundColor: AppColor.primaryColor,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list_rounded,
                    color: AppColor.iconColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: AppColor.iconColor,
                  ),
                ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: Text('Press and hold on a movie to delete.', style: TextStyle(fontWeight: FontWeight.w300),), alignment: Alignment.center),
                Expanded(
                  child: (movieModel.movieModelList.length != 0 &&
                      movieModel.movieModelList.length != 0)
                      ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: movieModel.movieModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MyListCard(
                        model: movieModel.movieModelList[index],
                        index:index
                      );
                    },
                  )
                      : Center(
                    child: Container(
                      // child: SpinKitFadingCircle(
                      //   color: AppColor.accentColor,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.accentColor,
              child: Icon(Icons.add),
              onPressed: (){Navigator.pushNamed(context, '/addMovie');},),
            // bottomNavigationBar: BottomNavigationBar(
            //   type: BottomNavigationBarType.fixed,
            //   showSelectedLabels: true,
            //   showUnselectedLabels: true,
            //   backgroundColor: AppColor.primaryColor,
            //   items: const <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.explore),
            //       label: 'Explore',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.list),
            //       label: 'List',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.dynamic_feed_outlined),
            //       label: 'Feed',
            //     ),
            //     BottomNavigationBarItem(
            //         icon: CircleAvatar(
            //           radius: 16,
            //           backgroundImage: NetworkImage(
            //               "https://image.shutterstock.com/image-photo/handsome-unshaven-young-darkskinned-male-600w-640011838.jpg"),
            //           backgroundColor: Colors.black12,
            //         ),
            //         label: 'Profile'),
            //   ],
            //   unselectedItemColor: AppColor.unselectedTextColor,
            //   currentIndex: 0,
            //   selectedItemColor: AppColor.accentColor,
            //   onTap: (value) {},
            // ),
          );
        });
  }
}

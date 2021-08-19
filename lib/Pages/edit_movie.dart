import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/Components/input_field.dart';
import 'package:yellow_class/Components/show_toast.dart';
import 'package:yellow_class/Database/hive_database.dart';
import 'package:yellow_class/Models/hive_movie.dart';
import 'package:yellow_class/Models/movie.dart';
import 'package:yellow_class/Provider/movie_list_provider.dart';
import 'package:yellow_class/Utility/colors.dart';

class EditMovie extends StatefulWidget {
 var movieIndex;
  EditMovie(this.movieIndex);
  @override
  _EditMovieState createState() => _EditMovieState();
}

class _EditMovieState extends State<EditMovie> {

  TextEditingController movieTextEditingController = new TextEditingController();
  TextEditingController directorTextEditingController = new TextEditingController();

  bool showSpinner = false, selected = false;
  File pickedImage = File('');

  Future pickImage(var imageSource) async {
    var image, i;
    i = await ImagePicker().getImage(source: imageSource);
    image = File(i.path);
    if (image == null) {
      return;
    }
    setState(() {
      selected = true;
      pickedImage = image;
    });
  }
  validateForm() {
    if (movieTextEditingController.text.isEmpty ||
        directorTextEditingController.text.isEmpty) return false;
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeDetails();
    super.initState();
  }

  void initializeDetails(){
    movieTextEditingController.text = Provider.of<MovieListProvider>(context, listen:false).movieModelList[widget.movieIndex].movieName;
    directorTextEditingController.text = Provider.of<MovieListProvider>(context, listen:false).movieModelList[widget.movieIndex].directorName;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.iconColor,
          ),
        ),
        title: Text(
          'Edit Movie',
          style: TextStyle(
            color: AppColor.textColorLgDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      buildShowModalBottomSheet(context);
                    },
                    child: CircularProfileAvatar('',
                        borderColor: Colors.grey,
                        child: !selected
                            ? Icon(
                          Icons.add_a_photo,
                          size: 30,
                        )
                            : Image.file(
                          pickedImage,
                          fit: BoxFit.cover,
                        ),
                        radius: 75,
                        elevation: 5.0),
                  ),
                  SizedBox(height: 20),
                  CustomInputField('Movie Name', Icons.movie_creation_outlined,
                      movieTextEditingController),
                  CustomInputField(
                      'Director Name', Icons.account_circle, directorTextEditingController),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.92,
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: AppColor.accentColor,
                        onPressed: () async {
                          if(validateForm()){
                            MovieModel editedMovie = MovieModel(movieTextEditingController.text, directorTextEditingController.text);
                            Provider.of<MovieListProvider>(context, listen: false).editMovie(widget.movieIndex, editedMovie);
                            showFlutterToast('Movie Updated Successfully', AppColor.accentColor);
                            HiveDatabase hiveDb = HiveDatabase();
                            hiveDb.setData(Provider.of<MovieListProvider>(context, listen:false).movieModelList);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: AppColor.accentColor,
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Open Gallery',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        });
  }
}

import 'dart:io';

class MovieModel {
  String movieName;
  String directorName;

  MovieModel(this.movieName, this.directorName);
  // movieModel.fromJson(Map<String, dynamic> json) {
  //   try {
  //     year = json['title']['year'];
  //     rating = json['title']['rating'].toDouble();
  //     title = json['title']['title'] ?? '';
  //     country = json['title']['country'] ?? '';
  //     if (json['title']['episodes'] == null) {
  //       episodes = 1;
  //       episode_seen = 1;
  //     } else {
  //       episodes = json['title']['episodes'];
  //       episode_seen = json['episode_seen'];
  //     }
  //     thumb = json['title']['images']['thumb'] ?? '';
  //     type = json['title']['type'] ?? '';
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_task/repository/url.dart';

import '../model/top_rated_model.dart';
class MovieTopRatedRepo{
  TopRated topRated=TopRated();
  Future <TopRated?> getMovieTopTated()async{
    var url = Uri.parse("${AppUrl.topRatedUrl}");
    final response = await http.get(
      url

    );

    topRated=TopRated.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      return topRated;

    }
    else {
      return null;
    }
  }
}
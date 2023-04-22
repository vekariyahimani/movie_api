import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_api/screen/modal/movie_modal.dart';



class ApiHelper
{

  Future<Movie> getApiCall(String Series)
  async {
    String link="https://imdb8.p.rapidapi.com/auto-complete?q=$Series";
    Uri uri=Uri.parse(link);
    var response=await http.get(uri,headers: {
    "X-RapidAPI-Key": "66dd3b00eamsh972cf3ebab173f1p15dc02jsn6d5e29696c0e",
    "X-RapidAPI-Host": "imdb8.p.rapidapi.com",
    });
    var json=jsonDecode(response.body);

    Movie movie=Movie.fromJson(json);
    return movie;

  }

}
import 'package:flutter/material.dart';
import 'package:movie_api/screen/modal/movie_modal.dart';
import 'package:movie_api/utils/api_helper.dart';

class MovieProvider extends ChangeNotifier
{

  TextEditingController txtserch = TextEditingController(text: 'movie');

  Future<Movie> getData()
  {
    ApiHelper apiHelper=ApiHelper();
    var movie=apiHelper.getApiCall(txtserch.text);
    return movie;


  }
}
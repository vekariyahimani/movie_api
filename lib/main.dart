import 'package:flutter/material.dart';
import 'package:movie_api/screen/provider/movie_provider.dart';
import 'package:movie_api/screen/view/movie_screen.dart';
import 'package:provider/provider.dart';


void main()
{

  runApp(
    ChangeNotifierProvider(
      create:  (context) => MovieProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => MovieScreen(),

        },
      ),
    )
  );

}
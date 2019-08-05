import 'package:flutter/material.dart';
import 'package:flutter_hello_world/page/BasePage.dart';
import 'package:flutter_hello_world/page/index.dart';
import 'package:flutter_hello_world/movie/Home.dart';
import 'package:flutter_hello_world/movie/screens/MovieDetail.dart';
import 'package:flutter_hello_world/movie/screens/VideoPlayer.dart';

Route<dynamic> getRoute(RouteSettings routeSettings){

  switch(routeSettings.name){
    case "change":
      return MaterialPageRoute(builder: (context) => MyPage());
    case "list_view":
      return MaterialPageRoute(builder: (context) => ListViewDemo());
    case "movie":
      return MaterialPageRoute(builder: (context) => Home());
    case "detail":
      var arguments = routeSettings.arguments;
      return MaterialPageRoute(builder: (context) => MovieDetail(id: arguments));
    case "video":
      var url = routeSettings.arguments;
      return MaterialPageRoute(builder: (context) => VideoPage(url: url));
  }
}
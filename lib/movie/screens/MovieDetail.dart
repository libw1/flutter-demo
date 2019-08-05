import 'package:flutter/material.dart';
import 'package:flutter_hello_world/movie/utils/api.dart' as api;
import 'package:flutter_hello_world/movie/widgets/DetailTop.dart';
import 'package:flutter_hello_world/movie/widgets/Rate.dart';
import 'package:flutter_hello_world/movie/widgets/Actors.dart';
import 'package:flutter_hello_world/movie/widgets/Photos.dart';
import 'package:flutter_hello_world/movie/widgets/Comments.dart';

class MovieDetail extends StatefulWidget{
  final id;

  const MovieDetail({Key key, this.id}) : super(key: key);

  _MovieDetailPage createState() => _MovieDetailPage();

}


class _MovieDetailPage extends State<MovieDetail>{
  var _data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var res = await api.getMovieDetail(widget.id);
    setState(() {
      _data = res;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.vertical,
                  children: <Widget>[
                    DetailTop(data: _data),
                    Rate(count : _data['ratings_count'], data : _data['rating']),
                    Container(padding: EdgeInsets.all(10), child: Text(_data['summary'])),
                    Actors(directors: _data['directors'], casts: _data['casts']),
                    Photos(photos: _data['photos']),
                    Comments(comments: _data['popular_comments'])
                  ],
              ),
            ))
    );
  }

}
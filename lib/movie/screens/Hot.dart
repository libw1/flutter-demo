import 'package:flutter/material.dart';
import 'package:flutter_hello_world/movie/utils/api.dart' as api;
import 'package:flutter_hello_world/movie/widgets/MovieItem.dart';

class Hot extends StatefulWidget {
  bool history;
  Hot({Key key, this.history = false}) : super(key : key);

  _HotPage createState() => _HotPage();
}

class _HotPage extends State<Hot> with AutomaticKeepAliveClientMixin{
  List _movieList = [];
  int start = 0;
  int total = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        getMore();
      }
    });
    this.query(init: true);
  }

  query({bool init = false}) async {
    Map res = await api.getMovieList(history: widget.history, start: init ? 0 : this.start);
    var start = res['start'];
    var total = res['total'];
    var subjects = res['subjects'];

    setState(() {
      if (init) {
        this._movieList = subjects;
      } else {
        this._movieList.addAll(subjects);
      }
      this.start = start + 10;
      this.total = total;
    });
  }

  getMore() {
    if(start < total){
      query();
    }
  }


  @override
  Widget build(BuildContext context) {

    return this._movieList.isEmpty ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _movieList.length,
        itemBuilder: (BuildContext context, int index) =>
            MovieItem(data: this._movieList[index]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;



  Future<Null> _onRefresh() async {
    await this.query(init: true);
  }
}
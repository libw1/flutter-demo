import 'package:flutter/material.dart';
import 'package:flutter_hello_world/movie/screens/Hot.dart';

class Home extends StatefulWidget{

  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: 2, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(text: '正在热映',),
            Tab(text: 'TOP 250',)
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Hot(),
          Hot(history: true)
        ],
      ),
    );
  }

}
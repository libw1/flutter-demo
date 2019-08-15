import 'package:flutter/material.dart';
import 'package:flutter_hello_world/page/BasePage.dart';
import 'package:flutter_hello_world/routes.dart' as route;

void main() => runApp(MyApp3());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Hello")),
            body: Center(child: Text("Hello World!", style: TextStyle(fontSize: 32)))));
  }
}

class MyApp1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello Flutter")),
        body: Center(child: Text("Hello World!",style: TextStyle(fontSize: 32,backgroundColor: Colors.blue)))
      )
    );
  }
}

class MyApp2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
//      theme: ThemeData.dark(),
        home: MyPage());
  }

}

class MyApp3 extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
      onGenerateRoute: route.getRoute
    );
  }
  
}

const DEMOS = [
  Demo(
    title: '跳转',
    description: '跳转到下一个界面',
    routeName: 'change',
  ),
  Demo(
    title: 'ListView',
    description: '跳转到一个普通的列表',
    routeName: 'list_view',
  ),
  Demo(
    title: '电影',
    description: '电影界面',
    routeName: 'movie',
  ),
  Demo(
    title: 'ios风格',
    description: '跳转到ios风格',
    routeName: 'ios',
  ),
  Demo(
    title: 'youtube player',
    description: 'youtube播放器',
    routeName: 'youtube_player',
  ),
  Demo(
    title: 'ios风格',
    description: '跳转到ios风格',
    routeName: 'ios',
  ),
];

class Demo {
  final String title;
  final String description;
  final String routeName;

  const Demo({this.title, this.description, this.routeName});
}

/// 颜色
const List<Color> COLORS = [
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFFFA400),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];


class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Demo")
      ),
      body: GridView.builder(
          itemCount: DEMOS.length,
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
        itemBuilder: (context, index) {
          return FlatButton(
            onPressed: () => Navigator.pushNamed(context, DEMOS[index].routeName),
            color: COLORS[index % COLORS.length],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      DEMOS[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    DEMOS[index].description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

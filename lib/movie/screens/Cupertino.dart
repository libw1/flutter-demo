import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget{

  _CupertinoPage createState() => _CupertinoPage();

}

class _CupertinoPage extends State<CupertinoPage>{

  void showAlertDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
            title: Text('ios dialog'),
            content: Text('这样一个ios风格的对话框'),
          actions: <Widget>[
            CupertinoButton(
              child: Text('Don\'t Allow'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            CupertinoButton(
              child: Text('Allow'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back),
        middle: Text('ios风格的界面'),
        trailing: Icon(CupertinoIcons.share),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text("显示dialog"),
              pressedOpacity: 0.5,
              onPressed: () {
                showAlertDialog(context);
              },
            ),
            SizedBox(height: 10),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text("退出"),
              pressedOpacity: 0.5,
              onPressed: () {
                Navigator.of(context).pop();
//                showAlertDialog(context);
              },
            )
          ],
        )
    );
  }

}
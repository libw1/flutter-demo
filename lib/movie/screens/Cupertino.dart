import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            CupertinoDialogAction(
              child: Text('Don\'t Allow'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
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

  void showActionSheet(BuildContext cxt){
    showCupertinoModalPopup<int>(context: cxt, builder: (cxt) {
      var dialog = CupertinoActionSheet(
        title: Text("This is Title"),
        message: Text('Chose a item !'),
        cancelButton: CupertinoActionSheetAction(onPressed: () {
          Navigator.pop(cxt, 0);
          },
            child: Text("Cancel")),
        actions: <Widget>[
          CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(cxt, 1);
                Fluttertoast.showToast(msg : "Apple!");
                },
              child: Text('Apple')),
          CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(cxt, 2);
                Fluttertoast.showToast(msg : "Windows!");
                },
              child: Text('Windows')),
          CupertinoActionSheetAction(
              onPressed: () {
              Navigator.pop(cxt, 3);
              Fluttertoast.showToast(msg : "Linux!");
            },
              child: Text('Linux')),
        ],
      );
      return dialog;
    });
  }

  void _showCupertinoPicker(BuildContext cxt){
    final picker  = CupertinoPicker(itemExtent: 20,
        onSelectedItemChanged: (position){
          print('The position is $position');
        }, children: [
          Text("0"),
          Text("1"),
          Text("2"),
          Text("3"),
          Text("4"),
        ]);

    showCupertinoModalPopup(context: cxt, builder: (cxt){
      return Container(
        height: 200,
        child: picker,
      );
    });
  }

  void _showCupertinoTimerPicker(BuildContext cxt){
    final picker = CupertinoTimerPicker(onTimerDurationChanged: (duration){
      print('the time is $duration');
    });

    showCupertinoModalPopup(context: cxt, builder: (cxt){
      return Container(
        height: 200,
        child: picker,
      );
    });
  }

  void _showCupertinoDatePicker(BuildContext cxt){
    final picker =CupertinoDatePicker(onDateTimeChanged: (date){
      print("the date is ${date.toString()}");
    },
      initialDateTime: DateTime(1995),
    );

    showCupertinoModalPopup(context: cxt, builder: (cxt){
      return Container(
        height: 200,
        child: picker,
      );
    });
  }

  bool _lights = false;
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
            CupertinoSwitch(value : _lights,onChanged: (bool b){
              setState(() {
                _lights = b;
              });
              if(b){
                Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                );
              }
            }),
            SizedBox(height: 20),
            CupertinoActivityIndicator(),
            SizedBox(height: 20),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text("显示dialog"),
              pressedOpacity: 0.5,
              onPressed: () {
//                _showCupertinoTimerPicker(context);
                _showCupertinoDatePicker(context);
//                _showCupertinoPicker(context);
              },
            ),
            SizedBox(height: 10),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text("退出"),
              pressedOpacity: 0.5,
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                );
                Navigator.of(context).pop();
//                showAlertDialog(context);
              },
            )
          ],
        )
    );
  }

}
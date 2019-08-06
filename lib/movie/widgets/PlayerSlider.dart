/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerSlider extends StatefulWidget{
  final VideoPlayerController controller;
  const PlayerSlider({Key key, this.controller}) : super(key: key);

  _PlayerSliderState createState() => _PlayerSliderState();
}


class _PlayerSliderState extends State<PlayerSlider>{
  double value = 0.0;

  @override
  void initState() {
    widget.controller.position.then((position){
      setState(() {
        value = position.inMilliseconds / widget.controller.value.duration.inMilliseconds * 100;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      inactiveColor: Colors.black12,
      min: 0.0,
      max: 100.0,
      label: 'value:$value',
      activeColor: Colors.blue,
      onChanged: (double){
        setState(() {
          value = double.roundToDouble();
          widget.controller.seekTo(Duration(milliseconds: double * widget.controller.value.duration.inMilliseconds ~/ 100));
        });
      },
    );
  }

}*/

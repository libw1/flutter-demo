import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class VideoPage extends StatefulWidget{
  final url;
  const VideoPage({Key key, this.url}) : super(key: key);

  @override
  _VideoPlayerPage createState() => _VideoPlayerPage();

}

class _VideoPlayerPage extends State<VideoPage>{
  VideoPlayerController _controller;
  ChewieController _chewieController;
  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预告片'),
      ),
      body: Center(
            child: AspectRatio(
              aspectRatio: _chewieController.aspectRatio,
              child: Chewie(controller: _chewieController)
            )
          )
    );
  }

}
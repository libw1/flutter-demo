import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPage extends StatefulWidget{
  final url;
  const VideoPage({Key key, this.url}) : super(key: key);

  @override
  _VideoPlayerPage createState() => _VideoPlayerPage();

}

class _VideoPlayerPage extends State<VideoPage>{
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller =
    VideoPlayerController.network(widget.url.replaceFirst('http', 'https'))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预告片'),
      ),
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

}
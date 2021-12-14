import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String _videoImg = 'https://i.ytimg.com/vi/WgMPrLX-zsA/default.jpg';
String _videoTitle = "LoveBabbar";

class YoutubePlayerScreen extends StatefulWidget {
  YoutubePlayerScreen(this._img, this._title, this._videoId);
  final String _img;
  final String _title;
  final String _videoId;
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget._videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listnear);
  }

  void _listnear() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      // use as u want
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
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
        title: Text("data"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Flexible(
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    _isPlayerReady = true;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget._title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

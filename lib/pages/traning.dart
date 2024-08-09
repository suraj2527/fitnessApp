import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<Map<String, dynamic>> mediaItems = [
    {"type": "image", "path": "images/B1.jpg"},
   // {"type": "image", "path": "images/B2.jpg"},
    {"type": "video", "path": "images/yoga1.mp4"},
    {"type": "image", "path": "images/B3.jpg"},
    // {"type": "video", "path": "https://www.example.com/video2.mp4"},
    // Add more items...
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yoga List')),
      body: ListView.builder(
        itemCount: mediaItems.length,
        itemBuilder: (context, index) {
          final item = mediaItems[index];

          return Column(
            children: [
              Card(
                child: ListTile(
                 // title: Text(yoga[index]),
                  trailing: item["type"] == "image"
                      ? Image.asset(item["path"])
                      : VideoPlayerWidget(videoUrl: item["path"]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
      width: 100,  // Set width or use MediaQuery to make it responsive
      height: 100, // Set height
      child: Chewie(controller: _chewieController!),
    )
        : CircularProgressIndicator();
  }
}

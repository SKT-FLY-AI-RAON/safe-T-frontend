import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

// / Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   const VideoApp({super.key});
//
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;
//
//   Future<void> getStreamInfo() async {
//     final response = await http.head(Uri.parse('http://172.30.1.60:8080/video'));
//     print('Content-Type: ${response.headers['content-type']}');
//   }
//   @override
//   void initState() {
//     super.initState();
//     getStreamInfo();
//     _controller = VideoPlayerController.networkUrl(
//         Uri.parse('http://172.30.1.60:8080/video'))
//       ..initialize().then((_) {
//         _controller.setLooping(true);
//         _controller.play();
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

class MjpegStreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MJPEG Stream'),
      ),
      body: Center(
        child: Mjpeg(
          stream: 'http://172.23.248.9:8080/video',
          isLive: true,
        ),
      ),
    );
  }
}
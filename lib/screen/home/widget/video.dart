// import 'package:ebbf/configs/images.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoWidget extends StatefulWidget {
//   const VideoWidget({Key? key}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _VideoState createState() => _VideoState();
// }
//
// class _VideoState extends State<VideoWidget> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://www.ebbf.ae/beta/frontfiles/banners/Untitled.mp4');
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.initialize().then((value) {
//       setState(() {
//         _controller.play();
//       });
//     });
//     _controller.setLooping(true).then((value) {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _controller.value.isInitialized
//           ? VideoPlayer(_controller)
//           : Container(
//         child: Image(image: AppImages.videothumbnel,),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

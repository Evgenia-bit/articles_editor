import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

const _noVideoAssetName = 'packages/mapper/assets/no_video.png';

class Video extends StatefulWidget {
  final Uri uri;
  const Video({required this.uri, super.key});

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.uri)
      ..initialize().then((_) {
        _controller
          ..setLooping(true)
          ..play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.hasError) {
      return Image.asset(
        _noVideoAssetName,
        width: 250,
      );
    }

    if (!_controller.value.isInitialized) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

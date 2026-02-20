import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:multipliers/products.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  late YoutubePlayerController _controller;
  static final Map<String, List<String>> _videos = Products().videos;

  @override
  void initState() {
    super.initState();

    final String currentProduct = productList[productIndex];
    final List<String>? currentVideos = _videos[currentProduct];
    String? videoUrl;
    if (toggle) {
      videoUrl = currentVideos?[1];
    } else {
      videoUrl = currentVideos?[0];
    }

    final String videoId = YoutubePlayer.convertUrlToId(videoUrl ?? "") ?? "";

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      builder: (context, player) {
        return Center(child: player);
      },
    );
  }
}

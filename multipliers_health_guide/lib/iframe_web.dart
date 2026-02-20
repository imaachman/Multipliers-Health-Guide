import 'dart:ui_web' as ui;
import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:multipliers/products.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  static final Map<String, List<String>> _videos = Products().videos;

  late Widget _iframeWidget;

  final web.HTMLIFrameElement _iframeElement = web.HTMLIFrameElement();

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

    _iframeElement.src = 'https://www.youtube.com/embed/$videoId';
    _iframeElement.style.border = 'none';
    _iframeElement.allowFullscreen = true;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _iframeWidget);
  }
}

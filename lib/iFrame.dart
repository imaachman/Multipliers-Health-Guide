import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:multipliers/products.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({Key key}) : super(key: key);

  @override
  _IframeScreenState createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {

  static Map _videos = Products().videos;

  Widget _iframeWidget;

  static IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    //_iframeElement.height = '500';
    //_iframeElement.width = '500';

    _iframeElement.src = 'https://www.youtube.com/embed/' + "${YoutubePlayer.convertUrlToId("${toggle == false ? _videos[productList[productIndex]][0] : _videos[productList[productIndex]][1]}")}";
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
    return Center(
        child: SizedBox(
          height: 360.0,
          width: 640.0,
          child: _iframeWidget,
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
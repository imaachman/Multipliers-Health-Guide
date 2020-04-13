import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown/markdown.dart';
import 'package:multipliers/products.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  Widget _detailsWidget;

  final IFrameElement _detailsElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    //_iframeElement.height = '500';
    //_iframeElement.width = '500';

    _detailsElement.src = markdownToHtml(rootBundle.loadString("assets/docs/" + productList[productIndex] + "${toggle == false ? " ENGLISH" : " HINDI"}" + ".md").toString());
    _detailsElement.style.border = 'none';
    _detailsElement.allowFullscreen = true;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'detailsElement',
      (int viewId) => _detailsElement,
    );

    _detailsWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: 640.0,
          child: _detailsWidget,
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
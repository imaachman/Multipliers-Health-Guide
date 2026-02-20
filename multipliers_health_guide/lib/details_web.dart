import 'dart:js_interop';
import 'dart:ui_web' as ui;
import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown/markdown.dart';
import 'package:multipliers/products.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Widget _detailsWidget;
  final web.HTMLIFrameElement _detailsElement = web.HTMLIFrameElement();

  @override
  void initState() {
    super.initState();

    _loadData();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'detailsElement',
      (int viewId) => _detailsElement,
    );

    _detailsWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'detailsElement',
    );
  }

  Future<void> _loadData() async {
    final String content = await rootBundle.loadString(
      "assets/docs/${productList[productIndex]}${toggle == false ? " ENGLISH" : " HINDI"}.md",
    );
    _detailsElement.srcdoc = markdownToHtml(content).toJS;
    _detailsElement.style.border = 'none';
    _detailsElement.allowFullscreen = true;
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
}

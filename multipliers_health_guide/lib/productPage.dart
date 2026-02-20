import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:multipliers/products.dart';
import 'package:multipliers/iframe.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final Map<String, List<dynamic>> _products = Products().products;
  final List<String> _hindiQues = Products().hindiQues;
  static final Map<String, List<String>> _videos = Products().videos;

  late YoutubePlayerController _controller;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

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

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl ?? "") ?? "",
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          toggle == false ? "Details" : "विवरण",
          style: const TextStyle(
            fontFamily: "Alatsi",
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before, color: Colors.white),
            onPressed: () {
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next, color: Colors.white),
            onPressed: () {
              _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Hero(
            tag: "$productIndex",
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink[100]!, Colors.white],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String currentKey = _products.keys
                              .toList()[index];
                          final List<dynamic> productData = _products.values
                              .toList()[index];
                          final bool containsProduct = productData.contains(
                            productList[productIndex],
                          );

                          return containsProduct
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          toggle == false
                                              ? currentKey
                                              : _hindiQues[index],
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        indent: 35.0,
                                        endIndent: 35.0,
                                        thickness: 1.0,
                                        height: 30.0,
                                      ),
                                    ],
                                  ),
                                )
                              : Container();
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 15,
                  right: MediaQuery.of(context).size.width / 15,
                  child: Draggable(
                    feedback: SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                      width: MediaQuery.of(context).size.width / 20,
                      child: Image(
                        image: AssetImage(
                          "assets/images/${productList[productIndex]}.png",
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: SizedBox(
                      height: 170.0,
                      width: 170.0,
                      child: Image(
                        image: AssetImage(
                          "assets/images/${productList[productIndex]}.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: IframeScreen(),
                  ),
                ),
                Divider(
                  height: 50.0,
                  color: Colors.white,
                  thickness: 1.0,
                  indent: MediaQuery.of(context).size.width / 10,
                  endIndent: MediaQuery.of(context).size.width / 10,
                ),
                FutureBuilder<String>(
                  future: rootBundle.loadString(
                    "assets/docs/${productList[productIndex]}${toggle == false ? " ENGLISH" : " HINDI"}.md",
                  ),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: MarkdownBody(
                              data: snapshot.data!,
                              styleSheet: MarkdownStyleSheet(
                                p: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                strong: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                h1: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                              "Error loading document",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

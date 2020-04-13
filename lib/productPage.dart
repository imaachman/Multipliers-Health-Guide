import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown/markdown.dart' as markdown;
import 'package:multipliers/details.dart';
import 'package:multipliers/iFrame.dart';
import 'package:multipliers/products.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:refined_markdown/refined_markdown.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  Map _products = Products().products;
  List<String> _hindiQues = Products().hindiQues;
  static Map _videos = Products().videos;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId("${toggle == false ? _videos[productList[productIndex]][0] : _videos[productList[productIndex]][1]}"),
    flags: YoutubePlayerFlags(
      autoPlay: false,
    )
  );

  PageController _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {

    CSS baseCSS = CSS(
      backgroundColor: Colors.black,
      fontSize: 16.0,
      fontColor: Colors.white
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(toggle == false ? "Details" : "विवरण", style: TextStyle(fontFamily: "Alatsi", fontSize: 24.0),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.white,),
            onPressed: () {
              _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
          ),
          IconButton(
            icon: Icon(Icons.navigate_next, color: Colors.white,),
            onPressed: () {
              _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
          )
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
                          colors: [Colors.pink[100], Colors.white],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _products.values.toList()[index].contains(productList[productIndex])
                                  
                                  ? 
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      children: <Widget>[
                                        Material(
                                          color: Colors.transparent, 
                                          child: Text(toggle == false ? _products.keys.toList()[index] : _hindiQues[index], style: TextStyle(fontSize: 16.0),)
                                        ),
                                        Divider(indent: 35.0, endIndent: 35.0, thickness: 1.0, height: 30.0,),
                                      ],
                                    ),
                                  )
                                  
                                  : 
                                  
                                  Container();
                            
                          }
                        
                      )
          ),
                  ),
                ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 15,
            right: MediaQuery.of(context).size.width / 15,
            child: Draggable(
              feedback: Container(
                height: MediaQuery.of(context).size.width / 20,
                width: MediaQuery.of(context).size.width / 20,
                child: Image(image: AssetImage("assets/images/" + productList[productIndex] + ".png"),),
              ),
              child: Container(
                height: 170.0,
                width: 170.0,
                child: Image(image: AssetImage("assets/images/" + productList[productIndex] + ".png"),),
              ),
              childWhenDragging: Container(),
            ),
          ),
              ],
            ),
          ),

          Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: <Widget>[
                Center(
                  child: EasyWebView(
                    src: Uri.dataFromString("""<html><body><iframe src="https://www.youtube.com/embed/" + "${YoutubePlayer.convertUrlToId("${toggle == false ? _videos[productList[productIndex]][0] : _videos[productList[productIndex]][1]}")}"> </iframe></body></html>""").toString(),
                    height: 360.0,
                    width: 640.0,
                    isHtml: true,
                  ),
                ),
                
                Divider(
                  height: 50.0,
                  color: Colors.white,
                  thickness: 1.0,
                  indent: MediaQuery.of(context).size.width / 10,
                  endIndent: MediaQuery.of(context).size.width / 10,
                ),

                FutureBuilder(
                  future: rootBundle.loadString("assets/docs/" + productList[productIndex] + "${toggle == false ? " ENGLISH" : " HINDI"}" + ".md"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                    ? EasyWebView(
                      src: markdown.markdownToHtml("""<font face="Roboto" color="white">""" + "${snapshot.data}" + """</font>"""),
                      isHtml: true,
                      widgetsTextSelectable: true,
                      height: MediaQuery.of(context).size.height / 2,
                      width: 640.0,
                    ) : CircularProgressIndicator();
                  },
                )
              ],
            ),
          )

// For Android!

          //  Scaffold(
          //    backgroundColor: Colors.black,
          //    body: Center(
          //      child: Column(
          //        children: <Widget>[
          //          YoutubePlayer(
          //            controller: _controller,
          //            showVideoProgressIndicator: true,
          //            progressIndicatorColor: Colors.red,
                     
          //          ),

          //          Divider(height: 30.0, thickness: 1.0,),

          //          Flexible(
          //           child: Padding(
          //             padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          //             child: FutureBuilder(
          //                future: rootBundle.loadString("assets/docs/" + productList[productIndex] + "${toggle == false ? " ENGLISH" : " HINDI"}" + ".md"),
          //                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //                  return snapshot.hasData ? RefinedMarkdown(text: snapshot.data, css: baseCSS,) : Center(child: CircularProgressIndicator(),);
          //                },
          //              ),
          //           ),
          //          )

          //         //  Flexible(
          //         //   child: FutureBuilder(
          //         //      future: rootBundle.loadString("assets/docs/9E5 HEALTH DRINK ENGLISH.md"),
          //         //      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //         //        return snapshot.hasData ? Markdown(data: snapshot.data,) : Center(child: CircularProgressIndicator(),);
          //         //      },
          //         //    ),
          //         //  )
          //        ],
          //      ),
          //    ),
          //  )

        ],
      ) 
    );
  }
}
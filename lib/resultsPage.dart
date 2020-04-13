import 'package:flutter/material.dart';
import 'package:multipliers/productPage.dart';
import 'products.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  Map _products = Products().products;
  //List<int> _selectedProducts = Products().selectedProducts;

  @override
  Widget build(BuildContext context) {

    productList = [];

    for (int index = 0; index < selectedProducts.length; index++) {
      int _productIndex = selectedProducts[index];
      for (int i = 2; i < 5; i++) {
        if (productList.contains(_products.values.toList()[_productIndex][i])) {
          continue;
        } else {
          productList.add(_products.values.toList()[_productIndex][i]);
        }
      }
    }


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(toggle == false ? "RECOMMENDATIONS" : "सुझाव", style: TextStyle(fontFamily: "Alatsi", fontSize: 24.0, color: Colors.white)),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(top: 20.0, right: 20.0),
        //     child: Text("      Made With ❤\nBy Team Multipliers", style: TextStyle(fontFamily: "Pacifico", fontSize: 8.0),),
        //   )
        // ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                toggle == false ? "Some of the best products recommended by senior doctors!" : "वरिष्ठ डॉक्टरों द्वारा अनुशंसित कुछ बेहतरीन उत्पाद!",
                style: TextStyle(fontFamily: "Roboto", fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold)
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        productIndex = index;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage()));
                    },
                    child: Center(
                      child: Container(
                        width: 350.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(30.0),
                              child: Hero(
                                tag: '$index',
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 40,
                                      //left: MediaQuery.of(context).size.width / 7.5,
                                      child: Container(
                                        height: 350.0,
                                        width: 350.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.pinkAccent[200], Colors.pink[100]],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                          ),
                                          borderRadius: BorderRadius.circular(200.0)
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 250.0,
                                            width: 250.0,
                                            child: Image(image: AssetImage("assets/images/" + productList[index] + ".png"),),
                                          ),
                                          Material(color: Colors.transparent, child: Text(productList[index], style: TextStyle(fontSize: 25.0, fontFamily: "Alatsi", color: Colors.white),)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                            index == productList.length - 1
                            ? Padding(
                              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                              child: Text("made with ❤ by team Multipliers", style: TextStyle(fontFamily: "Pacifico", fontSize: 18.0, color: Colors.white,)),
                            )
                            : Container()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      )
    );
  }
}
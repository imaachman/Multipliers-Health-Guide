import 'package:flutter/material.dart';
import 'package:multipliers/productPage.dart';
import 'products.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final Map<String, List<dynamic>> _products = Products().products;

  @override
  Widget build(BuildContext context) {
    productList = [];

    for (int index = 0; index < selectedProducts.length; index++) {
      int _productIndex = selectedProducts[index];
      final List<dynamic> productData =
          _products.values.toList()[_productIndex];
      for (int i = 2; i < 5; i++) {
        if (productList.contains(productData[i] as String)) {
          continue;
        } else {
          productList.add(productData[i] as String);
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          toggle == false ? "RECOMMENDATIONS" : "सुझाव",
          style: const TextStyle(
              fontFamily: "Alatsi", fontSize: 24.0, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              toggle == false
                  ? "Some of the best products recommended by senior doctors!"
                  : "वरिष्ठ डॉक्टरों द्वारा अनुशंसित कुछ बेहतरीन उत्पाद!",
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                  },
                  child: Center(
                    child: SizedBox(
                      width: 350.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(30.0),
                            child: Hero(
                              tag: '$index',
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 40,
                                    child: Container(
                                      height: 350.0,
                                      width: 350.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.pinkAccent[200]!,
                                            Colors.pink[100]!
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(200.0),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 250.0,
                                          width: 250.0,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/${productList[index]}.png"),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: Text(
                                            productList[index],
                                            style: const TextStyle(
                                                fontSize: 25.0,
                                                fontFamily: "Alatsi",
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (index == productList.length - 1)
                            const Padding(
                              padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                              child: Text(
                                "made with ❤ by team Multipliers",
                                style: TextStyle(
                                    fontFamily: "Pacifico",
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

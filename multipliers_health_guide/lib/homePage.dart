import 'package:flutter/material.dart';
import 'package:multipliers/resultsPage.dart';
import 'products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<dynamic>> _products = Products().products;
  final List<String> _hindiQues = Products().hindiQues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          toggle == false ? " HEALTH ISSUES" : "स्वास्थ्य समस्याएं",
          style: const TextStyle(
              fontFamily: "Alatsi", fontSize: 26.0, color: Colors.white),
        ),
        actions: <Widget>[
          Switch(
            value: toggle,
            onChanged: (value) {
              setState(() {
                toggle = value;
              });
            },
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.blueAccent[100],
            inactiveTrackColor: Colors.white,
            inactiveThumbImage: const AssetImage("assets/images/En.png"),
            activeThumbImage: const AssetImage("assets/images/Hi.png"),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              toggle == false
                  ? "Do you suffer with any of the following?"
                  : "क्या आप निम्न में से किसी से पीड़ित हैं?",
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  final List<dynamic> productData =
                      _products.values.toList()[index];
                  final bool isSelected = productData[0] as bool;
                  final double height = productData[1] as double;

                  return Column(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                productData[0] = !isSelected;
                                productData[1] =
                                    (height == 50.0) ? 100.0 : 50.0;
                              });
                              if (selectedProducts.contains(index)) {
                                selectedProducts.remove(index);
                              } else {
                                selectedProducts.add(index);
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              height: height,
                              width: 300.0,
                              decoration: BoxDecoration(
                                gradient: isSelected == false
                                    ? LinearGradient(
                                        colors: [
                                          Colors.blueAccent[200]!,
                                          Colors.blue[300]!
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.greenAccent[200]!,
                                          Colors.green[300]!
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  toggle == false
                                      ? _products.keys.toList()[index]
                                      : _hindiQues[index],
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Roboto",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (index == _products.length - 1)
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultsPage()));
        },
        backgroundColor: Colors.blueAccent[100],
        child: const Icon(Icons.check, color: Colors.black, size: 35.0),
      ),
    );
  }
}

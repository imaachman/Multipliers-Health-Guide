import 'package:flutter/material.dart';
import 'package:multipliers/resultsPage.dart';
import 'products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map _products = Products().products;
  List<String> _hindiQues = Products().hindiQues;

  //List<int> _selectedProducts = Products().selectedProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(toggle == false ? " HEALTH ISSUES" : "स्वास्थ्य समस्याएं", style: TextStyle(fontFamily: "Alatsi", fontSize: 26.0, color: Colors.white)),
        actions: <Widget>[
          Switch(
            value: toggle,
            onChanged: (value) {
              setState(() {
                toggle = value;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.blueAccent[100],
            inactiveTrackColor: Colors.white,
            inactiveThumbImage: AssetImage("assets/images/En.png"),
            activeThumbImage: AssetImage("assets/images/Hi.png"),
          )
        ],
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(top: 20.0, right: 0.0),
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
                toggle == false 
                ? "Do you suffer with any of the following?"
                : "क्या आप निम्न में से किसी से पीड़ित हैं?", 
                style: TextStyle(fontSize: 20.0, fontFamily: "Roboto",fontWeight: FontWeight.bold, color: Colors.white,),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: ListView.builder(
                  itemCount: _products.entries.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  _products.values.toList()[index][0] = !_products.values.toList()[index][0];
                                  _products.values.toList()[index][1] == 50.0 ? _products.values.toList()[index][1] = 100.0 : _products.values.toList()[index][1] = 50.0;
                                });
                                selectedProducts.contains(index) ? selectedProducts.remove(index) : selectedProducts.add(index);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                height: _products.values.toList()[index][1],
                                width: 300.0,
                                decoration: BoxDecoration(
                                  gradient: _products.values.toList()[index][0] == false 
                                  ? LinearGradient(
                                    colors: [Colors.blueAccent[200], Colors.blue[300]],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                  ) 
                                  : LinearGradient(
                                      colors: [Colors.greenAccent[200], Colors.green[300]],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                    ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Text(
                                    toggle == false ? _products.keys.toList()[index] : _hindiQues[index], 
                                    style: TextStyle(fontSize: 16.0, fontFamily: "Roboto", color: Colors.white),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        index == _products.entries.toList().length - 1
                        ? Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                          child: Text("made with ❤ by team Multipliers", style: TextStyle(fontFamily: "Pacifico", fontSize: 18.0, color: Colors.white,)),
                        )
                        : Container()
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(),));
        },
        backgroundColor: Colors.blueAccent[100],
        child: Icon(Icons.check, color: Colors.black, size: 35.0),
      ),
    );
  }
}
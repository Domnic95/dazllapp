import 'package:dazllapp/model/selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RealtorHomePage extends StatefulWidget {
  @override
  _RealtorHomePageState createState() => _RealtorHomePageState();
}

class _RealtorHomePageState extends State<RealtorHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          "REAL STATE PROFESSIONAL",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GridView.builder(
            itemCount: Selections.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Card(
                // color: Colors.blueGrey[100],
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Selections[index].image,
                      width: 80,
                    ),
                    Text(
                      Selections[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}

List<Selection> Selections = [
  Selection(image: "assets/images/create.png", name: "create a phd"),
  Selection(image: "assets/images/complete.png", name: "completed phd"),
  Selection(image: "assets/images/account.png", name: "my account"),
  Selection(image: "assets/images/start.png", name: "start a project"),
  Selection(image: "assets/images/document.png", name: "my documents"),
  Selection(image: "assets/images/inspire.png", name: "get inspired"),
];

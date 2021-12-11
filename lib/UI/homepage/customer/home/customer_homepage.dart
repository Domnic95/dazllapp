import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/login/login_screen.dart';

import 'delegrate.dart';
import 'package:dazllapp/model/selection.dart';
import 'package:flutter/material.dart';

class CustomerHomepage extends StatefulWidget {
  @override
  _CustomerHomepageState createState() => _CustomerHomepageState();
}

class _CustomerHomepageState extends State<CustomerHomepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          "HOMEOWNERS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GridView.builder(
            itemCount: Selections.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                    itemCount: Selections.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateProject()));
                  }
                },
                child: Card(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}

List<Selection> Selections = [
  Selection(image: "assets/images/start.png", name: "Start a project"),
  Selection(image: "assets/images/my_project.png", name: "My projects"),
  Selection(image: "assets/images/inspire.png", name: "Get inspired"),
];

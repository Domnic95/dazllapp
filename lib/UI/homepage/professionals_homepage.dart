import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessionalsHomepage extends StatefulWidget {
  @override
  __ProfessionalsHomepageState createState() => __ProfessionalsHomepageState();
}

class __ProfessionalsHomepageState extends State<ProfessionalsHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Service Professional",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
            itemCount: Selections.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                //color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Selections[index].image,
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Selections[index].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class Selection {
  String image;
  String name;
  Selection({
    required this.image,
    required this.name,
  });
}

List<Selection> Selections = [
  Selection(
      image: "assets/images/opportunities.png", name: "Project Opportunities"),
  Selection(image: "assets/images/profile.png", name: "My Company Profile"),
];

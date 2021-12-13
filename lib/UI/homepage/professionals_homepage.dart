import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
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
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(
            "assets/images/navigation.png",
          ),
        ),
        centerTitle: true,
        title: Text(
          "Service Professional",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: darkTextColor.withOpacity(.9)),
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
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView.builder(
              itemCount: Selections.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    //color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Selections[index].image,
                            width: 80,
                            color: AppTheme.colorPrimary,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            Selections[index].name,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppTheme.colorPrimary,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
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

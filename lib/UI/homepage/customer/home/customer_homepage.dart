import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';

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
      drawer: drawer(context),
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(14.0),
        //   child: Image.asset(
        //     "assets/images/navigation.png",
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          "HOMEOWNERS",
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
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: ListView.builder(
              itemCount: Selections.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreateProject()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Selections[index].image,
                              color: AppTheme.colorPrimary,
                              width: 100,
                            ),
                            Text(
                              Selections[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppTheme.colorPrimary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    ));
  }
}

List<Selection> Selections = [
  Selection(image: "assets/images/start.png", name: "Start a project"),
  Selection(image: "assets/images/my_project.png", name: "My projects"),
  Selection(image: "assets/images/inspire.png", name: "Get inspired"),
];

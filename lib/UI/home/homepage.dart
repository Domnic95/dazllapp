// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dazllapp/UI/component/banner.dart';
import 'package:dazllapp/UI/home/categorycard.dart';
import 'package:dazllapp/UI/home/component/GetInspiredWidget.dart';
import 'package:dazllapp/UI/home/component/on_trend_widget.dart';
import 'package:dazllapp/UI/home/component/services.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/strings.dart';
import 'package:dazllapp/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(14.0),
        //   child: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //   // child: Image.asset(
        //   //   "assets/images/navigation.png",
        //   // ),
        // ),
        centerTitle: true,
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: darkTextColor.withOpacity(.9)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              "assets/images/search.png",
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Banners(),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              ServicesWidget(),
              SizedBox(
                height: 20,
              ),
              OnTrendWidget(),
              SizedBox(
                height: 10,
              ),
              GetInspiredWidget(),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount: democategory.length,
                        itemBuilder: (BuildContext context, int i) {
                          return CategoryCard(category: democategory[i],);
                        }),
                  )
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawer(BuildContext context) {
  return SafeArea(
    child: Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
            GestureDetector(onTap: (){
            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
            },
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                       Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                    },
                    icon: Icon(Icons.home),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                 Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(index: 0)),
                              (route) => false);
              },
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                       Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(index: 0)),
                              (route) => false);
                    },
                    icon: Icon(
                      Icons.logout,
                    ),
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
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
  void initState() {
    super.initState();
   // print(SpHelpers.getBool(keep_me_logged_in.toString()));
  }
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
          "Real State Professional",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: darkTextColor.withOpacity(.9)),
        ),
        actions: [
         
        ],
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
                      color: AppTheme.colorPrimary,
                    ),
                    Text(
                      Selections[index].name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.colorPrimary,
                          ),
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
  Selection(image: "assets/images/create.png", name: "Create a phd"),
  Selection(image: "assets/images/complete.png", name: "Completed phd"),
  Selection(image: "assets/images/account.png", name: "My account"),
  Selection(image: "assets/images/start.png", name: "Start a project"),
  Selection(image: "assets/images/document.png", name: "My documents"),
  Selection(image: "assets/images/inspire.png", name: "Get inspired"),
];

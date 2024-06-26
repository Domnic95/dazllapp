// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names

import 'package:dazllapp/UI/Profile/profile.dart';
import 'package:dazllapp/UI/component/popup_button.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/create_phd.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/realtor_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/start_project.dart';
import 'package:dazllapp/UI/homepage/realtor/complitedPhd/selectCustomer.dart';
import 'package:dazllapp/UI/homepage/realtor/savePhd/SelectSavePhd.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/model/selection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RealtorHomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<RealtorHomePage> createState() => _RealtorHomePageState();
}

class _RealtorHomePageState extends ConsumerState<RealtorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: drawer(context, ref),
      appBar: AppBar(
        leading: PopupButton(),
        backgroundColor: primaryColor,
        // InkWell(
        //   onTap: () {

        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(14.0),
        //     child: Image.asset(
        //       "assets/images/navigation.png",
        //       color: lightColor,
        //     ),
        //   ),
        // ),

        centerTitle: true,
        title: Text(
          "Real State Professional",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 16, color: lightColor.withOpacity(.9)),
        ),
        actions: [],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GridView.builder(
            itemCount: Selections.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreatePhd()));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => TestEmailPhd()));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectCustomer(),
                    ));
                  } else if (index == 2) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  } else if (index == 3) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Select_customer()));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Start_project(
                            // customerid: customerid!,
                            )));
                  } else if (index == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectSavePhd(),
                    ));
                  } else if (index == 5) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Realtor_project(),
                    ));
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
                        color: AppTheme.colorPrimary,
                      ),
                      SizedBox(height: 10),
                      Text(
                        Selections[index].name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppTheme.colorPrimary,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

List<Selection> Selections = [
  Selection(
    image: "assets/images/create.png",
    name: "Create a phd",
  ),
  Selection(
    image: "assets/images/complete.png",
    name: "Completed phd",
  ),
  Selection(
    image: "assets/images/account.png",
    name: "Agents Profile",
  ),
  Selection(
    image: "assets/images/start.png",
    name: "Start a project",
  ),
  Selection(
    image: "assets/images/document.png",
    name: "Saved phds",
  ),
  Selection(
    image: "assets/images/inspire.png",
    name: "My-projects-agents",
  ),
];

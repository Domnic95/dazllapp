// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable, unused_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:dazllapp/UI/Profile/profile.dart';
import 'package:dazllapp/UI/component/popup_button.dart';
import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/homepage/customer/my_project/myproject.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dazllapp/model/selection.dart';
import 'package:flutter/material.dart';

class CustomerHomepage extends ConsumerStatefulWidget {
  @override
  ConsumerState<CustomerHomepage> createState() => _CustomerHomepageState();
}

class _CustomerHomepageState extends ConsumerState<CustomerHomepage> {
  @override
  Widget build(BuildContext context) {
    final _roomsprovider = ref.read(customernotifier);
    return SafeArea(
        child: Scaffold(
      // drawer:
          //  HomeDrawer(
          //   screenIndex: DrawerIndex.HOME,
          //   iconAnimationController:
          //       AnimationController(vsync: this, duration: Duration(seconds: 2)),
          //   callBackIndex: (DrawerIndex) {},
          // ),
          // drawer(context, ref),
      appBar: AppBar(
         leading: PopupButton(),
        centerTitle: true,
        title: Text(
          "HOMEOWNERS",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: lightColor.withOpacity(.9)),
        ),
        actions: [],
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
                    } else if (index == 1) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => myproject()));
                    } else if (index == 2) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyProfile()));
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
  Selection(image: "assets/images/profile.png", name: "My Info"),
];

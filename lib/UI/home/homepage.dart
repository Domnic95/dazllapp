// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:dazllapp/UI/component/banner.dart';
import 'package:dazllapp/UI/component/home_popup_button.dart';
import 'package:dazllapp/UI/home/component/GetInspiredWidget.dart';
import 'package:dazllapp/UI/home/component/on_trend_widget.dart';
import 'package:dazllapp/UI/home/component/services.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: drawer(context,ref),
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(14.0),
        //   child: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //   // child: Image.asset(
        //   //   "assets/images/navigation.png",
        //   // ),
        // ),
        backgroundColor: AppTheme.colorPrimaryDark,
        centerTitle: false,
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: lightColor,
              ),
        ),
        actions: [HomePopupButton()],
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(14.0),
        //     child: Image.asset(
        //       "assets/images/search.png",
        //     ),
        //   )
        // ],
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

Widget drawer(BuildContext context, WidgetRef ref) {
  int? currentindex = SpHelpers.getInt(
    SharedPrefsKeys.currentindex,
  );
  return SafeArea(
    child: Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomePage()),
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
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
                child: GestureDetector(
                  onTap: () {
                    Changepassworddailog(context, currentindex!, ref);
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(builder: (context) => HomePage()),
                    //     (route) => false);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.password_rounded,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Change Password',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
                child: GestureDetector(
                  onTap: () {
                    logoutdilouge(
                      context,
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

logoutdilouge(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        'Are You Sure to want to logout?',
        style: TextStyle(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actionsPadding: EdgeInsets.all(8),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              logOut(context);
            },
            child: Text(
              'Yes',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ))
      ],
    ),
  );
}

Changepassworddailog(BuildContext context, int currentindex, WidgetRef ref) {
  TextEditingController Oldpassword = TextEditingController();
  TextEditingController Newpassword = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  bool showoldpassword = false;
  bool shownewpassword = false;
  bool showconfirmpassword = false;
  final realtor = ref.read(realtorprovider);
  return showDialog<String>(
    context: context,
    builder: (BuildContext dailogcontext) => GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StatefulBuilder(builder: (context, setstate) {
          return AlertDialog(
            title: Text(
              'Change Password',
              style: TextStyle(
                color: primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            titlePadding:
                EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            actionsPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.all(15),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: Oldpassword,
                  textAlign: TextAlign.start,
                  // controller: searchCtrl,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  obscureText: !showoldpassword,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setstate(
                          () {
                            showoldpassword = !showoldpassword;
                          },
                        );
                      },
                      child: Icon(
                        showoldpassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    ),
                    // label: Text("Old Password"),
                    hintText: 'Enter Old Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(12),
                    // fillColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: Newpassword,
                  obscureText: !shownewpassword,
                  textAlign: TextAlign.start,
                  // controller: searchCtrl,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setstate(
                          () {
                            shownewpassword = !shownewpassword;
                          },
                        );
                      },
                      child: Icon(
                        shownewpassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    ),
                    // label: Text("Old Password"),
                    hintText: 'Enter New Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(12),
                    // fillColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  obscureText: !showconfirmpassword,
                  controller: Confirmpassword,
                  textAlign: TextAlign.start,
                  // controller: searchCtrl,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setstate(
                          () {
                            showconfirmpassword = !showconfirmpassword;
                          },
                        );
                      },
                      child: Icon(
                        showconfirmpassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    ),
                    // label: Text("Old Password"),
                    hintText: 'Enter Confirm Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(12),
                    // fillColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      onPressed: () async {
                        if (Oldpassword.text.isEmpty) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Enter Old Password",
                              ),
                            ),
                          );
                        } else if (Newpassword.text.isEmpty) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
                            backgroundColor: Colors.red,
                              content: Text(
                                "Enter New Password",
                              ),
                            ),
                          );
                        } else if (Confirmpassword.text.isEmpty) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(backgroundColor: Colors.red,
                              content: Text(
                                "Enter Confirm Password",
                              ),
                            ),
                          );
                        } else if (Newpassword.text != Confirmpassword.text) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Password does not match",
                              ),
                            ),
                          );
                        } else {
                          Response res = await realtor.changepassword(
                            currentindex: currentindex,
                            currentPassword: Oldpassword.text,
                            newPassword: Newpassword.text,
                            confirmPassword: Confirmpassword.text,
                          );
                          if (res.statusCode == 200) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (route) => false);
                                 toastShowError(context, res.data["message"]);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     backgroundColor: Colors.green,
                            //     content: Text(
                            //       res.data["message"],
                            //     ),
                            //   ),
                            // );
                          } else {
                            // Navigator.of(context).pop();
                            ScaffoldMessenger.of(dailogcontext).showSnackBar(
                              SnackBar(
                                 backgroundColor: Colors.red,
                                content: Text(
                                  res.data["message"],
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    ),
  );
}

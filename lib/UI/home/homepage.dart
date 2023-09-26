// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:dazllapp/UI/component/banner.dart';
import 'package:dazllapp/UI/home/component/GetInspiredWidget.dart';
import 'package:dazllapp/UI/home/component/on_trend_widget.dart';
import 'package:dazllapp/UI/home/component/services.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/apicall.dart';
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
        centerTitle: true,
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 18, color: lightColor),
        ),
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
      title: Text('Are You Sure to want to logout?'),
      actionsPadding: EdgeInsets.all(8),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              logOut(context);
            },
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.white),
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
            title: Text('Change Password'),
            actionsPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.all(10),
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
                        color: Colors.black,
                      ),
                    ),
                    // label: Text("Old Password"),
                    hintText: 'Enter Old Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
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
                        color: Colors.black,
                      ),
                    ),
                    // label: Text("Old Password"),
                    hintText: 'Enter New Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
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
                        color: Colors.black,
                      ),
                    ),
                    // label: Text("Old Password"),
                    hintText: 'Enter Confirm Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (Oldpassword.text.isEmpty) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Enter Old Password",
                              ),
                            ),
                          );
                        } else if (Newpassword.text.isEmpty) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Enter New Password",
                              ),
                            ),
                          );
                        } else if (Confirmpassword.text.isEmpty) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Enter Confirm Password",
                              ),
                            ),
                          );
                        } else if (Newpassword.text != Confirmpassword.text) {
                          ScaffoldMessenger.of(dailogcontext).showSnackBar(
                            SnackBar(
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
                                  builder: (context) => LoginScreen(
                                    index: 0,
                                  ),
                                ),
                                (route) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  res.data["message"],
                                ),
                              ),
                            );
                          } else {
                            // Navigator.of(context).pop();
                            ScaffoldMessenger.of(dailogcontext).showSnackBar(
                              SnackBar(
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
                        style: TextStyle(color: Colors.white),
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

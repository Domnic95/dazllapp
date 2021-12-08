import 'package:dazllapp/UI/forgot_password.dart/forgot_password_screen.dart';
import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/homepage/professionals_homepage.dart';
import 'package:dazllapp/UI/homepage/realtor_homepage.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

import 'UI/homepage/customer/home/customer_homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAZL',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        // appBarTheme: AppBarTheme(backgroundColor: ),

        textTheme: TextTheme(
          bodyText1: TextStyle(color: darkTextColor, letterSpacing: .5),
          bodyText2: TextStyle(
              color: darkTextColor,
              letterSpacing: .5,
              fontWeight: FontWeight.w500),
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(0xffFFFFFF, primaryColors),
        accentColor: primaryColor,
        dividerColor: Colors.transparent,
      ),
      // home: ProfessionalsHomepage(),dfgfgfg fg fgf
    );
  }
}

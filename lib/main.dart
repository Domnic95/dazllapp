// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_print, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/homepage/dashBoard.dart';
import 'package:dazllapp/UI/homepage/professional/professionals_homepage.dart';
import 'package:dazllapp/UI/homepage/realtor/realtor_homepage.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/homepage/customer/home/customer_homepage.dart';
import 'config/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

// Future<void> initPrefs() async {
//   SharedPreferences _pref = await SharedPreferences.getInstance();
//   await SpHelpers.setPref(name, data)();
// ignore: unnecessary_new
//  new Future.delayed(const Duration(seconds: 3), () {
// if (_pref.getBool(Spkeys.key_keep_me_logged_in) != null) {
//   if (_pref.getBool(Spkeys.key_keep_me_logged_in)) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => RealtorHomePage(),
//       ),
//     );
//   } else {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => T2WalkThrough(),
//       ),
//     );
//   }
// } else {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute<dynamic>(
//       builder: (BuildContext context) => T2WalkThrough(),
//     ),
//   );
// }
// });
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(SpHelpers.getBool(SharedPrefsKeys.key_keep_me_logged_in).toString());
    print(SpHelpers.getInt(SharedPrefsKeys.key_current).toString());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DAZL',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          // appBarTheme: AppBarTheme(
          //   systemOverlayStyle: SystemUiOverlayStyle(
          //     statusBarColor: primaryColor,
          //   ),
          // ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: blackColor))),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: darkTextColor, letterSpacing: .5),
            bodyText2: TextStyle(
                color: darkTextColor,
                letterSpacing: .5,
                fontWeight: FontWeight.w500),
          ),
          dividerColor: Colors.transparent,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primaryContainer: lightColor,
            secondaryContainer: lightColor,
            onPrimary: primaryColor,
            background: lightColor,
            onSecondaryContainer: lightColor,
            secondary: primaryColor,
            primary: primaryColor,
            onBackground: lightColor,
            surfaceTint: lightColor,
            brightness: Brightness.light,
          ),
          // colorScheme: ColorScheme.fromSwatch(
          //         primarySwatch: MaterialColor(0xffef4444, primaryColors))
          //     .copyWith(secondary: primaryColor),
        ),
        routes: {},
        home: Welcome()
        //key_keep_me_logged_in=="true"?RealtorHomePage():LoginScreen()
        );
  }
}

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.jpg',
              height: 200,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "A real estate collaboration hub",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Future<void> initPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // await SpHelpers.setPref();
    Timer(const Duration(seconds: 3), () {
      if (sharedPreferences.getBool(SharedPrefsKeys.key_keep_me_logged_in) !=
          null) {
        // print(sharedPreferences.getBool(SharedPrefsKeys.key_keep_me_logged_in).toString());
        if (sharedPreferences.getBool(SharedPrefsKeys.key_keep_me_logged_in) ==
                true &&
            sharedPreferences.getInt(SharedPrefsKeys.key_current) == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<dynamic>(
              // builder: (BuildContext context) => RealtorHomePage(),
              builder: (BuildContext context) => DashBoard(
                goingNextPage: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return RealtorHomePage();
                    },
                  ));
                },
                title: agentTitle,
                decs: agentDecs,
                appbarTitle: 'Real State Professional',
              ),
            ),
          );
        }
        if (sharedPreferences.getBool(SharedPrefsKeys.key_keep_me_logged_in) ==
                true &&
            sharedPreferences.getInt(SharedPrefsKeys.key_current) == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<dynamic>(
              // builder: (BuildContext context) => ProfessionalsHomepage(),
              builder: (BuildContext context) => DashBoard(
                goingNextPage: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return ProfessionalsHomepage();
                    },
                  ));
                },
                title: professionalTitle,
                decs: professionalDecs,
                appbarTitle: 'Service Professional',
              ),
            ),
          );
        }

        if (sharedPreferences.getBool(SharedPrefsKeys.key_keep_me_logged_in) ==
                true &&
            sharedPreferences.getInt(SharedPrefsKeys.key_current) == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<dynamic>(
              // builder: (BuildContext context) => CustomerHomepage(),
              builder: (BuildContext context) => DashBoard(
                title: homeOwnerTitle,
                decs: homeOwnerDecs,
                appbarTitle: 'HOMEOWNERS',
                goingNextPage: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return CustomerHomepage();
                    },
                  ));
                },
              ),
            ),
          );
        }
        if (sharedPreferences.getBool(SharedPrefsKeys.key_keep_me_logged_in) ==
            false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => HomePage(),
            ),
          );
        }

        //if (sharedPreferences.getBool(key)) {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute<dynamic>(
        //           builder: (BuildContext context) => RealtorHomePage(),
        //         ),
        //       );
        //     } else {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute<dynamic>(
        //           builder: (BuildContext context) => T2WalkThrough(),
        //         ),
        //       );
        //     }
        //   } else {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute<dynamic>(
        //         builder: (BuildContext context) => T2WalkThrough(),
        //       ),
        //     );
        //   }
        // }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => HomePage()),
        );
      }
    });
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<String> tags = [
    "love",
    "instagood",
    "photooftheday",
    "beautiful",
    "fashion",
    "happy",
    "tbt",
    "cute",
    "followme",
    "like4like",
    "follow",
    "picoftheday",
    "me",
    "selfie",
    "summer",
    "instadaily"
  ];

  List selected_tags = ["love", "me", "summer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: <Widget>[...generate_tags()],
      ),
    );
  }

  generate_tags() {
    return tags.map((tag) => get_chip(tag)).toList();
  }

  get_chip(name) {
    return FilterChip(
      selected: selected_tags.contains(name),
      selectedColor: Colors.blue.shade800,
      disabledColor: Colors.blue.shade400,
      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      label: Text("#${name}"),
      onSelected: (bool value) {},
    );
  }
}

import 'dart:developer';
import 'dart:io';
import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fNameControllre = TextEditingController();
  final _lNameControllre = TextEditingController();
  final _mobileNoControllre = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  // List<ServiceType> servicesType = [];
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
      child: Text("Service Type"),
      value: 0,
    )
  ];

  bool _showPassword = false;
  bool _showAgainPassword = false;
  int value = 0;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _toggleAgainvisibility() {
    setState(() {
      _showAgainPassword = !_showAgainPassword;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height / 3,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Stack(
                      children: [
                        Container(
                            height: size.height * 0.33,
                            width: size.width,
                            decoration: new BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    AppTheme.colorPrimary,
                                    AppTheme.colorPrimaryDark
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.lerp(Radius.circular(50),
                                      Radius.circular(60), 5)!,
                                  bottomRight: Radius.lerp(Radius.circular(50),
                                      Radius.circular(50), 5)!),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/dotsbg.png",
                                  width: 200,
                                  height: 200,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Sign Up!',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 35),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        'Please fill the details below to\ncomplete your account',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: EditField(
                      controller: _fNameControllre,
                      hint: "First Name",
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: EditField(
                      controller: _lNameControllre,
                      hint: "Last Name",
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Column(
                children: [
                  EditField(
                    controller: _emailController,
                    hint: "Email",
                  ),
                  SizedBox(height: size.height * 0.03),
                  EditField(
                    hint: "Zip Code",
                    inputType: TextInputType.number,
                  ),
                  SizedBox(height: size.height * 0.03),
                  EditField(
                    controller: _mobileNoControllre,
                    hint: "Mobile Number",
                    inputType: TextInputType.phone,
                    maxLength: 10,
                  ),
                  SizedBox(height: size.height * 0.03),
                  EditField(
                    controller: _passwordController,
                    hint: "Create Password",
                    isPassword: true,
                  ),
                  SizedBox(height: size.height * 0.03),
                  EditField(
                    controller: _passwordAgainController,
                    hint: "Confrim Password",
                    isPassword: true,
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              )),
          // Padding(
          //   padding: EdgeInsets.only(left: 55, right: 55, top: 20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       DropdownButton(
          //         style: TextStyle(
          //             color: AppTheme.darkerText,
          //             fontFamily: AppTheme.fontName,
          //             fontSize: 15,
          //             fontWeight: FontWeight.w400),
          //         items: items,
          //         value: value,
          //         isExpanded: true,
          //         onChanged: (v) {
          //           value = v;
          //           setState(() {});
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: size.height * 0.03),
          submitButton(
              _fNameControllre.text.toString(),
              _lNameControllre.text.toString(),
              _emailController.text.toString(),
              _mobileNoControllre.text.toString(),
              _passwordController.text.toString()),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.maybePop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return LoginScreen();
              //     },
              //   ),
              // );
            },
          ),
        ],
      ),
    ));
  }

  Widget submitButton(String fName, String lName, String emailId,
          String mobileNum, String password) =>
      ElevatedButton(
        child: Padding(
          padding: EdgeInsets.only(left: 110, right: 110, top: 15, bottom: 15),
          child: Text("Sign Up", style: TextStyle(fontSize: 14)),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppTheme.colorPrimary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: AppTheme.colorPrimary)))),
        onPressed: () async => {
          if (_fNameControllre.text.toString().isEmpty)
            {
              showAlertDialog(
                  context: context,
                  title: "Require First Name",
                  content: "Please Enter First Name",
                  defaultActionText: "OK")
            }
          else if (_lNameControllre.text.toString().isEmpty)
            {
              showAlertDialog(
                  context: context,
                  title: "Require Last Name",
                  content: "Please Enter Last Name",
                  defaultActionText: "OK")
            }
          else if (_emailController.text.toString().isEmpty)
            {
              showAlertDialog(
                  context: context,
                  title: "Require Email",
                  content: "Please Enter Email Id",
                  defaultActionText: "OK")
            }
          else if (_mobileNoControllre.text.toString().isEmpty)
            {
              showAlertDialog(
                  context: context,
                  title: "Require Mobile Number",
                  content: "Please Enter Mobile Number",
                  defaultActionText: "OK")
            }
          else if (_passwordController.text.toString().isEmpty)
            {
              showAlertDialog(
                  context: context,
                  title: "Require Password",
                  content: "Please Enter Password",
                  defaultActionText: "OK")
            }
          else if (_passwordController.text != _passwordAgainController.text)
            {
              showAlertDialog(
                  context: context,
                  title: "Password",
                  content: "Password does not match",
                  defaultActionText: "OK")
            }
          else if (value == 0)
            {
              showAlertDialog(
                  context: context,
                  title: "Require Service Type",
                  content: "Please Select Service Type",
                  defaultActionText: "OK")
            }
          else
            {
              // bloc.signUpReq(fName, lName, emailId, mobileNum, password,
              //     await _getId(), context, value),
              // getProfile(),
              // prefs = await SharedPreferences.getInstance(),
            }
        },
      );

  // Future<dynamic> getPrefs() async {
  //   return prefs;
  // }

//   getProfile() {
//     StreamBuilder<UserProfileRespo>(
//         stream: bloc.subjectUserProfile.stream,
//         // ignore: missing_return
//         builder: (context, snap) {
//           prefs.setString(SharedPrefsKeys.USER_ID, snap.data.id.toString());
//           prefs.setString(SharedPrefsKeys.FIRST_NAME, snap.data.firstName);
//           prefs.setString(SharedPrefsKeys.LAST_NAME, snap.data.lastName);
//           prefs.setString(SharedPrefsKeys.EMAIL_ADDRESS, snap.data.email);
//           if (snap.data.picture.startsWith("http")) {
//             prefs.setString(SharedPrefsKeys.PICTURE, snap.data.picture);
//             print('snapImage=${snap.data.picture}');
//           } else {
//             prefs.setString(SharedPrefsKeys.PICTURE,
//                 baseUrl + "storage/" + snap.data.picture);
//             print('snapImage=${snap.data.picture}');
//           }
//           prefs.setString(SharedPrefsKeys.GENDER, snap.data.gender);
//           prefs.setString(SharedPrefsKeys.MOBILE, snap.data.mobile);
//           prefs.setString(SharedPrefsKeys.WALLET_BALANCE,
//               snap.data.walletBalance.toString());
//           prefs.setString(SharedPrefsKeys.PAYMENT_MODE, snap.data.paymentMode);
//           prefs.setString(SharedPrefsKeys.SOS, snap.data.sos);
//           prefs.setBool(SharedPrefsKeys.LOGEDIN, true);

//           if (snap.data.currency != "" && snap.data.currency != null) {
//             prefs.setString(SharedPrefsKeys.CURRENCY, snap.data.currency);
//           } else {
//             prefs.setString(SharedPrefsKeys.CURRENCY, "\$");
//           }

// /*          Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return SignUpScreen();
//               },
//             ),
//           );*/
//         });
//   }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle1),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.subtitle1),
      ],
    ));
  }
}

// Future<bool> showAlertDialog({
//   @required BuildContext context,
//   @required String title,
//   @required String content,
//   String cancelActionText,
//   @required String defaultActionText,
// }) async {
//   if (!Platform.isIOS) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: <Widget>[
//           if (cancelActionText != null)
//             TextButton(
//               child: Text(cancelActionText),
//               onPressed: () => Navigator.of(context).pop(false),
//             ),
//           TextButton(
//             child: Text(defaultActionText),
//             onPressed: () => Navigator.of(context).pop(true),
//           ),
//         ],
//       ),
//     );
//   }

//   // todo : showDialog for ios
//   return showCupertinoDialog(
//     context: context,
//     builder: (context) => CupertinoAlertDialog(
//       title: Text(title),
//       content: Text(content),
//       actions: <Widget>[
//         if (cancelActionText != null)
//           CupertinoDialogAction(
//             child: Text(cancelActionText),
//             onPressed: () => Navigator.of(context).pop(false),
//           ),
//         CupertinoDialogAction(
//           child: Text(defaultActionText),
//           onPressed: () => Navigator.of(context).pop(true),
//         ),
//       ],
//     ),
//   );
// }

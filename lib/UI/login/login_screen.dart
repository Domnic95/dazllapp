import 'dart:io';

import 'package:dazllapp/UI/forgot_password.dart/forgot_password_screen.dart';
import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/homepage/customer/home/customer_homepage.dart';
import 'package:dazllapp/UI/homepage/professionals_homepage.dart';
import 'package:dazllapp/UI/homepage/realtor_homepage.dart';
import 'package:dazllapp/UI/sign_up/sign_up.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  int index;
  LoginScreen({required this.index});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // SharedPreferences prefs;
  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
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
                                      Radius.circular(50), 5)!,
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
                                        'Welcome Back!',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 35),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Signin to your account',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
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
          SizedBox(height: size.height * 0.03),
          SizedBox(height: size.height * 0.03),
          Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    // inputFormatters:<TextInputFormatter>[formater],
                    cursorColor: AppTheme.nearlyBlack,

                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: new TextStyle(
                            color: AppTheme.darkerText,
                            fontFamily: AppTheme.fontName,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        labelStyle: new TextStyle(
                            color: const Color(0xFF424242),
                            fontFamily: AppTheme.fontName,
                            fontSize: 15),
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red))),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    // inputFormatters:<TextInputFormatter>[formater],
                    obscureText: !_showPassword,
                    cursorColor: AppTheme.nearlyBlack,
                    decoration: InputDecoration(
                      hintStyle: new TextStyle(
                          color: AppTheme.darkerText,
                          fontFamily: AppTheme.fontName,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      hintText: "Password",
                      labelStyle: new TextStyle(
                          color: const Color(0xFF424242),
                          fontFamily: AppTheme.fontName,
                          fontSize: 12),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.red)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        ForgotPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forget Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              )))
                    ],
                  )
                ],
              )),
          SizedBox(height: size.height * 0.03),
          submitButton(_emailController.text.toString(),
              _passwordController.text.toString()),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  Widget submitButton(String emailId, String password) => Column(
        children: <Widget>[
          ElevatedButton(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 110, right: 110, top: 15, bottom: 15),
              child: Text("Login", style: TextStyle(fontSize: 14)),
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
              // _emailController.text = "tire@roadrunnersclub.net",
              // _passwordController.text = "123456",
              // _emailController.text = "apitest24@mail.com",
              // _passwordController.text = "12345678",
              // _emailController.text = "apitest24@mail.com",
              // _passwordController.text = "12345678",
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                if (widget.index == 0) {
                  return RealtorHomePage();
                }
                if (widget.index == 1) {
                  return ProfessionalsHomepage();
                }
                if (widget.index == 2) {
                  return CustomerHomepage();
                }
                return Container();
              })),
              if (_emailController.text.toString().isEmpty)
                {
                  showAlertDialog(
                      context: context,
                      title: "Require Email",
                      content: "Please Enter Email Id",
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
              else
                {
                  // bloc.loginReq(
                  //     _emailController.text.toString(),
                  //     _passwordController.text.toString(),
                  //     await _getId(),
                  //     context),
                  // if (snap.hasData)
                  //   {
                  //     prefs = await SharedPreferences.getInstance(),
                  //     prefs.setString(SharedPrefsKeys.ACCESS_TOKEN,
                  //         snap.data.accessToken),

                  //     // prefs.setString(SharedPrefsKeys.CURRENCY,
                  //     //     snap.data.currency)
                  //     // bloc.userProfileReq(await _getId(), context,snap.data.access_token,snap.data.token_type),

                  //     //  getProfile()
                  //   }
                }
            },
          ),
        ],
      );

  // Widget submitButton(String emailId, String password) =>
  //     StreamBuilder<LoginResponse>(
  //         stream: bloc.subject.stream,
  //         builder: (context, snap) {
  //           return Column(
  //             children: <Widget>[
  //               ElevatedButton(
  //                 child: Padding(
  //                   padding: EdgeInsets.only(
  //                       left: 110, right: 110, top: 15, bottom: 15),
  //                   child: Text("Login", style: TextStyle(fontSize: 14)),
  //                 ),
  //                 style: ButtonStyle(
  //                     foregroundColor:
  //                         MaterialStateProperty.all<Color>(Colors.white),
  //                     backgroundColor: MaterialStateProperty.all<Color>(
  //                         AppTheme.colorPrimary),
  //                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                         RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(25),
  //                             side: BorderSide(color: AppTheme.colorPrimary)))),
  //                 onPressed: () async => {
  //                   _emailController.text = "tire@roadrunnersclub.net",
  //                   _passwordController.text = "123456",
  //                   if (_emailController.text.toString().isEmpty)
  //                     {
  //                       showAlertDialog(
  //                           context: context,
  //                           title: "Require Email",
  //                           content: "Please Enter Email Id",
  //                           defaultActionText: "OK")
  //                     }
  //                   else if (_passwordController.text.toString().isEmpty)
  //                     {
  //                       showAlertDialog(
  //                           context: context,
  //                           title: "Require Password",
  //                           content: "Please Enter Password",
  //                           defaultActionText: "OK")
  //                     }
  //                   else
  //                     {
  //                       bloc.loginReq(
  //                           _emailController.text.toString(),
  //                           _passwordController.text.toString(),
  //                           await _getId(),
  //                           context),
  //                       if (snap.hasData)
  //                         {
  //                           prefs = await SharedPreferences.getInstance(),
  //                           prefs.setString(SharedPrefsKeys.ACCESS_TOKEN,
  //                               snap.data.accessToken),

  //                           // prefs.setString(SharedPrefsKeys.CURRENCY,
  //                           //     snap.data.currency)
  //                           // bloc.userProfileReq(await _getId(), context,snap.data.access_token,snap.data.token_type),

  //                           //  getProfile()
  //                         }
  //                     }
  //                 },
  //               ),
  //             ],
  //           );
  //         });

  // Future<dynamic> getPrefs() async {
  //   return prefs;
  // }

  // getProfile() {
  //   StreamBuilder<UserProfileRespo>(
  //       stream: bloc.subjectUserProfile.stream,
  //       builder: (context, snap) {
  //         print("RUNING");
  //         return putvalues(
  //             snap.data.id.toString(),
  //             snap.data.firstName.toString(),
  //             snap.data.lastName.toString(),
  //             snap.data.email.toString(),
  //             snap.data.picture.toString(),
  //             snap.data.gender.toString(),
  //             snap.data.mobile.toString(),
  //             snap.data.walletBalance.toString(),
  //             snap.data.paymentMode.toString(),
  //             snap.data.sos.toString(),
  //             snap.data.currency.toString());
  //       });
  // }

  // putvalues(
  //     String userId,
  //     String fname,
  //     String lname,
  //     String email,
  //     String picture,
  //     String gender,
  //     String mobile,
  //     String walletBalance,
  //     String payMode,
  //     String sos,
  //     String currency) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setString(SharedPrefsKeys.USER_ID, userId);
  //   prefs.setString(SharedPrefsKeys.FIRST_NAME, fname);
  //   prefs.setString(SharedPrefsKeys.LAST_NAME, lname);
  //   prefs.setString(SharedPrefsKeys.EMAIL_ADDRESS, email);

  //   print('picture $picture');
  //   if (picture.startsWith("http")) {
  //     prefs.setString(SharedPrefsKeys.PICTURE, picture);
  //     print('snap' + picture.toString());
  //   } else {
  //     prefs.setString(SharedPrefsKeys.PICTURE, baseUrl + "storage/" + picture);
  //     print('snap' + picture.toString());
  //   }
  //   prefs.setString(SharedPrefsKeys.GENDER, gender);
  //   prefs.setString(SharedPrefsKeys.MOBILE, mobile);
  //   prefs.setString(SharedPrefsKeys.WALLET_BALANCE, walletBalance);
  //   prefs.setString(SharedPrefsKeys.PAYMENT_MODE, payMode);
  //   prefs.setString(SharedPrefsKeys.SOS, sos);
  //   prefs.setBool(SharedPrefsKeys.LOGEDIN, true);

  //   if (currency != "" && currency != null) {
  //     prefs.setString(SharedPrefsKeys.CURRENCY, currency);
  //   } else {
  //     prefs.setString(SharedPrefsKeys.CURRENCY, "\$");
  //   }

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return NavigationHomeScreen();
  //       },
  //     ),
  //   );
  // }

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

Future<bool> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String cancelActionText = "",
  required String defaultActionText,
}) async {
  return true;
  // if (!Platform.isIOS) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(title),
  //       content: Text(content),
  //       actions: <Widget>[
  //         if (cancelActionText != null)
  //           TextButton(
  //             child: Text(cancelActionText),
  //             onPressed: () => Navigator.of(context).pop(false),
  //           ),
  //         TextButton(
  //           child: Text(defaultActionText),
  //           onPressed: () => Navigator.of(context).pop(true),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // // todo : showDialog for ios
  // return showCupertinoDialog(
  //   context: context,
  //   builder: (context) => CupertinoAlertDialog(
  //     title: Text(title),
  //     content: Text(content),
  //     actions: <Widget>[
  //       if (cancelActionText != null)
  //         CupertinoDialogAction(
  //           child: Text(cancelActionText),
  //           onPressed: () => Navigator.of(context).pop(false),
  //         ),
  //       CupertinoDialogAction(
  //         child: Text(defaultActionText),
  //         onPressed: () => Navigator.of(context).pop(true),
  //       ),
  //     ],
  //   ),
  // );
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              login ? "Don’t have an Account ? " : "Already have an Account ? ",
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: press as void Function()?,
              child: Text(
                login ? "Sign Up" : "Sign In",
                style: TextStyle(
                  color: AppTheme.colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // Text(
        //   "or",
        //   style: TextStyle(
        //       color: Color(0xFFBDBDBD),
        //       fontSize: 15,
        //       fontFamily: AppTheme.fontName,
        //       fontWeight: FontWeight.w400),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // Text(
        //   "Continue With",
        //   style: TextStyle(
        //       color: Color(0xFF616161),
        //       fontSize: 15,
        //       fontFamily: AppTheme.fontName,
        //       fontWeight: FontWeight.w400),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     SocalIcon(
        //       iconSrc: "assets/images/facebook.png",
        //       press: () {},
        //     ),
        //     SocalIcon(
        //       iconSrc: "assets/images/google.png",
        //       press: () {},
        //     ),
        //   ],
        // )
      ],
    );
  }
}

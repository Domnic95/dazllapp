// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, avoid_print, deprecated_member_use, unused_catch_clause, prefer_const_literals_to_create_immutables, unnecessary_import, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, unused_element

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/forgot_password.dart/forgot_password_screen.dart';
import 'package:dazllapp/UI/sign_up/sign_up.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // int curruntindex = 0;
  bool keep_me_logged_in = false;
  bool loading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // SharedPreferences prefs;
  bool _showPassword = false;

  @override
  void initState() {
    //  getversion();
    super.initState();
  }

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Future getversion() async {
    // final _version = context.read(versionProvider);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String CheckversionAndroid = "0.0.0";
    String CheckversionIos = "00";
    String version = packageInfo.version;
    bool isVersionGreaterThan(String newVersion, String currentVersion) {
      List<String> currentV = currentVersion.split(".");
      List<String> newV = newVersion.split(".");
      bool a = false;
      for (var i = 0; i <= 2; i++) {
        a = int.parse(newV[i]) > int.parse(currentV[i]);
        if (int.parse(newV[i]) != int.parse(currentV[i])) break;
      }
      return a;
    }

    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    // String buildNumber = packageInfo.buildNumber;
    // log('appName1' + andr.toString());
    log('appName3' + CheckversionAndroid);
    log('appName4' + CheckversionIos);
    log("appName " +
        isVersionGreaterThan(version, CheckversionAndroid).toString());
    log("appName " + isVersionGreaterThan(version, CheckversionIos).toString());
    isVersionGreaterThan(
            version, Platform.isAndroid ? CheckversionAndroid : CheckversionIos)
        ? Container()
        : _showMyDialog();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            contentPadding:
                EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 10),
            title: Center(
                child: Text(
              'Update App ?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            content: Container(
              width: 220,
              height: 175,
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lottie/dazl.json',
                    height: 110,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A new version of DAZL is available! Kindly Update',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.colorPrimary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Text('UPDATE NOW',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  onPressed: () {
                    Platform.isAndroid ? onAndroid() : onIOS();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  onIOS() {
    String url = '';
    try {
      launch(url);
    } on PlatformException catch (e) {
      launch(url);
    } finally {
      launch(url);
    }
  }

  onAndroid() {
    String appPackageName = 'com.app.dazllapp';
    try {
      launch("market://details?id=" + appPackageName);
    } on PlatformException catch (e) {
      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
    } finally {
      launch("https://play.google.com/store/apps/details?id=" + appPackageName);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final serviceProvider = ref.watch(serviceProviders);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body:
            //   UpgradeAlert(
            // upgrader: Upgrader(
            //   showReleaseNotes: false,
            //   minAppVersion: '0.0.0',
            //   dialogStyle: Platform.isAndroid
            //       ? UpgradeDialogStyle.material
            //       : UpgradeDialogStyle.cupertino,
            //   // durationUntilAlertAgain: Duration(seconds: 30),
            //   onUpdate: () => Platform.isAndroid ? onAndroid() : onIOS(),
            //   showLater: false,
            //   showIgnore: false,
            //   messages: MyEnglishMessages(),
            // ),
            //child:
            SingleChildScrollView(
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
                                      bottomLeft: Radius.lerp(
                                          Radius.circular(50),
                                          Radius.circular(50),
                                          5)!,
                                      bottomRight: Radius.lerp(
                                          Radius.circular(50),
                                          Radius.circular(50),
                                          5)!),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            'Welcome Back!',
                                            style: TextStyle(
                                              color: AppTheme.white,
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 35,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            'Sign In to your account',
                                            style: TextStyle(
                                              color: AppTheme.white,
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
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
              SizedBox(height: size.height * 0.06),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonTheme(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: serviceProvider.dropdownValue,

                    icon: const Icon(Icons.expand_more),
                    iconSize: 24,
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      // color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        serviceProvider.dropdownValue = newValue!;
                        serviceProvider.setSevice(
                            serviceProvider.DropsDownvalue.indexOf(newValue));

                        SpHelpers.setInt(SharedPrefsKeys.currentindex,
                            serviceProvider.curruntindex);
                      });
                    },
                    items: serviceProvider.DropsDownvalue.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: TextField(
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
                          enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: blackColor)),
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: primaryColor))),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: TextField(
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
                        enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: blackColor)),
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: primaryColor)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _togglevisibility();
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Checkbox(
                                checkColor: lightColor,
                                activeColor: primaryColor,
                                value: keep_me_logged_in,
                                onChanged: (v) {
                                  keep_me_logged_in = v ?? false;
                                  setState(() {});
                                }),
                            Text(
                              "Keep me login",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppTheme.fontName,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15, right: 24),
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
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: AppTheme.fontName,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              )))
                    ],
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              submitButton(_emailController.text.toString(),
                  _passwordController.text.toString(), ref),
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
        ),
        // )
      ),
    );
  }

  Widget submitButton(String emailId, String password, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        if (_emailController.text.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Enter email')));
        } else if (_passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Enter password')));
        } else {
          loading = true;
          setState(() {});
          await login(
              ref.read(serviceProviders).curruntindex,
              _emailController.text.trim(),
              _passwordController.text.trim(),
              context,
              keep_me_logged_in,
              ref);
          loading = false;
          setState(() {});
        }
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.75,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: primaryColor,
        ),
        child: loading
            ? CircularProgressIndicator(
                color: lightColor,
              )
            : Text("Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: lightColor)),
      ),
    );
  }

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
            style: Theme.of(context).textTheme.titleMedium),
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
            style: Theme.of(context).textTheme.titleMedium),
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
  final VoidCallback? press;

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
              onTap: press,
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

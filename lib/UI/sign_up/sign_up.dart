// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, use_key_in_widget_constructors, unused_element, avoid_print

import 'dart:developer';
import 'dart:io';
import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/UI/homepage/customer/home/customer_homepage.dart';
import 'package:dazllapp/UI/homepage/professionals_homepage.dart';
import 'package:dazllapp/UI/homepage/realtor_homepage.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../config/api.dart';
import '../../config/apicall.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fNameControllre = TextEditingController();
  final _PfNameControllre = TextEditingController();
  final _CfNameControllre = TextEditingController();
  final _addressController = TextEditingController();
  final _PcompanyaddressController = TextEditingController();
  final _PcompanycityController = TextEditingController();
  final _PcompanynameController = TextEditingController();
  final _addressController1 = TextEditingController();
  final _lNameControllre = TextEditingController();
  final _ClNameControllre = TextEditingController();
  final _PlNameControllre = TextEditingController();
  final _mobileNoControllre = TextEditingController();
  final _CmobileNoControllre = TextEditingController();
  final _PmobileNoControllre = TextEditingController();
  final _emailController = TextEditingController();
  final _CemailController = TextEditingController();
  final _PemailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _CpasswordController = TextEditingController();
  final _PpasswordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final _CpasswordAgainController = TextEditingController();
  final _PpasswordAgainController = TextEditingController();
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
  String dropdownValue = "Realtor";
  int curruntindex = 0;
  List<String> DropsDownvalue = [
    'Realtor',
    'Professional',
    'Customer',
  ];

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
                            // ignore: unnecessary_new
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ButtonTheme(
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,

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
                    dropdownValue = newValue!;
                    curruntindex = DropsDownvalue.indexOf(newValue);
                    print(curruntindex);
                  });
                },
                items: DropsDownvalue.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          (curruntindex == 0)
              ? (Column(
                  children: [
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
                                hint: "Second Name",
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
                              hint: "Email address",
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
                            EditField(
                              controller: _addressController,
                              hint: "Real Estate Agency Affiliation (name)",
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _addressController1,
                                    hint:
                                        "Real Estate Agency Affiliation (city)",
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    hint: "Zip Code",
                                    inputType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: EditField(
                                    hint: "State",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _mobileNoControllre,
                              hint: "Mobile Phone Number",
                              inputType: TextInputType.phone,
                              maxLength: 10,
                            ),
                          ],
                        ))
                  ],
                ))
              : (Column()),
          (curruntindex == 1)
              ? (Column(
                  children: [
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
                                controller: _PfNameControllre,
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
                                controller: _PlNameControllre,
                                hint: "Second Name",
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
                              controller: _PemailController,
                              hint: "Email address",
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PpasswordController,
                              hint: "Create Password",
                              isPassword: true,
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PpasswordAgainController,
                              hint: "Confrim Password",
                              isPassword: true,
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PcompanynameController,
                              hint: "Company Name",
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PcompanyaddressController,
                              hint: "Company Street Address",
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _PcompanycityController,
                                    hint: "Company City",
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    hint: "Zip Code",
                                    inputType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: EditField(
                                    hint: "State",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PmobileNoControllre,
                              hint: "Mobile Phone Number",
                              inputType: TextInputType.phone,
                              maxLength: 10,
                            ),
                          ],
                        ))
                  ],
                ))
              : (Column()),
          (curruntindex == 2)
              ? (Column(
                  children: [
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
                                controller: _CfNameControllre,
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
                                controller: _ClNameControllre,
                                hint: "Second Name",
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
                              controller: _CmobileNoControllre,
                              hint: "Mobile Phone Number",
                              inputType: TextInputType.phone,
                              maxLength: 10,
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _CemailController,
                                    hint: "Email address",
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    hint: "Zip Code",
                                    inputType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _CpasswordController,
                              hint: "Create Password",
                              isPassword: true,
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _CpasswordAgainController,
                              hint: "Confrim Password",
                              isPassword: true,
                            ),
                          ],
                        ))
                  ],
                ))
              : (Column()),
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
        onPressed: () async {
          if (_fNameControllre.text.isEmpty) {
            showAlertDialog(
                context: context,
                title: "Require First Name",
                content: "Please Enter First Name",
                defaultActionText: "OK");
          } else if (_lNameControllre.text.toString().isEmpty) {
            showAlertDialog(
                context: context,
                title: "Require Last Name",
                content: "Please Enter Last Name",
                defaultActionText: "OK");
          } else if (_emailController.text.toString().isEmpty) {
            showAlertDialog(
                context: context,
                title: "Require Email",
                content: "Please Enter Email Id",
                defaultActionText: "OK");
          } else if (_mobileNoControllre.text.toString().isEmpty) {
            showAlertDialog(
                context: context,
                title: "Require Mobile Number",
                content: "Please Enter Mobile Number",
                defaultActionText: "OK");
          } else if (_passwordController.text.toString().isEmpty) {
            showAlertDialog(
                context: context,
                title: "Require Password",
                content: "Please Enter Password",
                defaultActionText: "OK");
          } else if (_passwordController.text !=
              _passwordAgainController.text) {
            showAlertDialog(
                context: context,
                title: "Password",
                content: "Password does not match",
                defaultActionText: "OK");
          } else if (value == 0) {
            showAlertDialog(
                context: context,
                title: "Require Service Type",
                content: "Please Select Service Type",
                defaultActionText: "OK");
          } else {
            // bloc.signUpReq(fName, lName, emailId, mobileNum, password,
            //     await _getId(), context, value),
            // getProfile(),
            // prefs = await SharedPreferences.getInstance(),
          }
          if (_emailController.text.isEmpty &&
              _CemailController.text.isEmpty &&
              _PemailController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Fill Fields')));
          }
          if (curruntindex == 0) {
            // print(curruntindex);
            // signupRealtor();
            signupRealtor(
              curruntindex,
              context,
              _addressController1.text,
              _passwordAgainController.text,
              _emailController.text,
              _fNameControllre.text,
              _lNameControllre.text,
              _passwordController.text,
              _mobileNoControllre.text,
              _addressController.text,
            );
          } else if (curruntindex == 1) {
            // signupProfessional();
            signupProfessional(
              curruntindex,
              context,
              _PcompanycityController.text,
              _PcompanynameController.text,
              _PcompanyaddressController.text,
              _PpasswordAgainController.text,
              _PemailController.text,
              _PfNameControllre.text,
              _PlNameControllre.text,
              _PpasswordController.text,
              _PmobileNoControllre.text,
            );
          } else if (curruntindex == 2) {
            //   signupCustomer();
            signupCustomer(
              curruntindex,
              context,
              _CpasswordAgainController.text,
              _CemailController.text,
              _CfNameControllre.text,
              _ClNameControllre.text,
              _CpasswordController.text,
              _CmobileNoControllre.text,
            );
          } else {}
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

import 'package:dazllapp/UI/component/common_button.dart';
import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 32),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Enter your registered email address',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
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
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: EditField(
              hint: "Email",
            ),
          ),

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
          // submitButton(
          //     _fNameControllre.text.toString(),
          //     _lNameControllre.text.toString(),
          //     _emailController.text.toString(),
          //     _mobileNoControllre.text.toString(),
          //     _passwordController.text.toString()),
          CommonButton(
            label: "Submit",
          ),
        ],
      ),
    ));
  }
}
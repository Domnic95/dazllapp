import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/UI/sign_up/sign_up.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePopupButton extends StatefulHookConsumerWidget {
  const HomePopupButton({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePopupButton> createState() => _HomePopupButtonState();
}

class _HomePopupButtonState extends ConsumerState<HomePopupButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int? currentindex = SpHelpers.getInt(
      SharedPrefsKeys.currentindex,
    );
    return PopupMenuButton<int>(
      icon: Image.asset(
        "assets/images/navigation.png",
        color: lightColor,
      ),
      itemBuilder: (context) => [
        // PopupMenuItem 1
        // PopupMenuItem(
        //   value: 1,
        //   // row with 2 children
        //   child: Row(
        //     children: [
        //       Text(
        //         'HOME PAGE',
        //         style: TextStyle(fontSize: 16),
        //       )
        //     ],
        //   ),
        // ),
        // PopupMenuItem 2
        PopupMenuItem(
          value: 2,
          // row with two children
          child: Row(
            children: [
              Text(
                'LOG IN',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          // row with two children
          child: Row(
            children: [
              Text(
                'SIGN UP',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        // PopupMenuItem(
        //   value: 4,
        //   // row with two children
        //   child: Row(
        //     children: [
        //       Text(
        //         'BLOG',
        //         style: TextStyle(fontSize: 16),
        //       )
        //     ],
        //   ),
        // ),
        PopupMenuItem(
          value: 5,
          // row with two children
          child: Row(
            children: [
              Text(
                'TERM & CONDITIONS',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        // PopupMenuItem(
        //   value: 6,
        //   // row with two children
        //   child: Row(
        //     children: [
        //       Text(
        //         'CONTACT US',
        //         style: TextStyle(fontSize: 16),
        //       )
        //     ],
        //   ),
        // ),
      ],
      offset: Offset(0, 50),
      color: lightColor,
      elevation: 2, 
      // on selected we show the dialog box
      onSelected: (value) {
        // if value 1 show dialog
        if (value == 1) {
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //     (route) => false);
        } else if (value == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginScreen(
                index: 0,
              ),
            ),
          );
        } else if (value == 3) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ),
          );
        } else if (value == 5) {
          commonTermConditionshowModalSheet(size);
        }
      },
    );
  }

  void commonTermConditionshowModalSheet(size) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.88,
          decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    'TERMS AND CONDITIONS and SERVICE COMMITMENT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: primaryColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'DAZL SERVICE COMMITMENT',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    serviceComment,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppTheme.darkText,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'ACCEPTANCE OF THESE TERMS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: acceptionsOfTheseTerms,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: ' ${acceptionsOfTheseTerms1}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppTheme.darkText,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        acceptionsOfTheseTerms2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: AppTheme.darkText,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'MODIFICATIONS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    modifications,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppTheme.darkText,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'PRIVACY POLICY, ADDITIONAL TERMS AND POLICIES',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Please review',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: ' DAZLPRO, LLC OR DAZL LP Privacy Policy',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppTheme.colorPrimaryDark,
                                letterSpacing: 0.5,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: AppTheme.darkText,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'KEY TERMS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: keyTerms,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: keyTerms1,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppTheme.darkText,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

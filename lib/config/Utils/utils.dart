import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class Utils {
  static void loaderDialog(BuildContext context, bool isShow) {
    if (isShow) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Loading",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: darkTextColor),
                  ),
                  Text(
                    "Please Wait",
                    style: TextStyle(fontSize: 18, color: darkTextColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(child: LoadingWidget())
                ],
              ),
            ),
          );
        },
      );
    } else {
      Navigator.pop(context);
    }
  }

  static void imageInfoDialog(
      {required BuildContext context,
      required String url,
      required String description}) {
    // if (isShow) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Image.network(
            url,
            fit: BoxFit.contain,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text(
              //   "Description",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       decorationThickness: 5,
              //       color: darkTextColor,
              //       fontWeight: FontWeight.bold),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(color: darkTextColor),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: primaryColor),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
    // } else {
    //   Navigator.pop(context);
    // }
  }
}

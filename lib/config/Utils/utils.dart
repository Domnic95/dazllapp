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
}

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          title: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 10),
              url.contains('.svg')
                  ? SvgPicture.network(
                      url,
                      placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const CircularProgressIndicator()),
                    )
                  : Image.network(
                      url,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
            ],
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
          // actions: [
          //   ElevatedButton(
          //       style: ElevatedButton.styleFrom(primary: primaryColor),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       child: Text(
          //         'Ok',
          //         style: TextStyle(color: Colors.white),
          //       ))
          // ],
        );
      },
    );
    // } else {
    //   Navigator.pop(context);
    // }
  }
}

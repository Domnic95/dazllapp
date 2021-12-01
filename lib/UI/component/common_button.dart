import 'package:dazllapp/config/app_theme.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final Function? onTap;
  const CommonButton({this.label = "", this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.only(left: 110, right: 110, top: 15, bottom: 15),
        child: Text(label, style: TextStyle(fontSize: 14)),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppTheme.colorPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: AppTheme.colorPrimary)))),
      onPressed: onTap as void Function()?,
    );
  }
}
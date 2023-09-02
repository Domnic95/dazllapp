import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: primaryColor),
      ),
    );
  }
}

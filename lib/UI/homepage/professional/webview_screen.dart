// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_screen extends StatefulWidget {
  String url;
  webview_screen(this.url, {Key? key}) : super(key: key);

  @override
  State<webview_screen> createState() => _webview_screenState();
}

class _webview_screenState extends State<webview_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
      ),
    );
  }
}

import 'package:dazllapp/UI/component/popup_button.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  DashBoard({
    required this.title,
    required this.decs,
    required this.appbarTitle,
    required this.goingNextPage,
    Key? key,
  }) : super(key: key);
  final String title, decs, appbarTitle;
  final VoidCallback goingNextPage;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: PopupButton(),
        centerTitle: true,
        title: Text(
          widget.appbarTitle,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 16, color: lightColor.withOpacity(.9)),
        ),
        actions: [],
      ),
      body: Container(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 12),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.decs,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: widget.goingNextPage,
          label: Text(
            'Next',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

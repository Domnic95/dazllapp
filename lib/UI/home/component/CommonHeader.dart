import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  const CommonHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: primaryColor),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                color: lightColor.withOpacity(.9),
              ),
        ),
      ),
    );
  }
}

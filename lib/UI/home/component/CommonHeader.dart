import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  final bool isback;
  const CommonHeader({Key? key, required this.title, required this.isback})
      : super(key: key);

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: isback
                        ? Icon(
                            Icons.arrow_back,
                            color: lightColor,
                          )
                        : SizedBox(),
                  ),
                )),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    color: lightColor.withOpacity(.9),
                  ),
            ),
            SizedBox(
              width: 38,
            )
          ],
        ),
      ),
    );
  }
}

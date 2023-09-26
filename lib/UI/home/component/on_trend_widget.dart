// ignore_for_file: prefer_const_constructors

import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/strings.dart';
import 'package:flutter/material.dart';

class OnTrendWidget extends StatefulWidget {
  const OnTrendWidget({Key? key}) : super(key: key);

  @override
  State<OnTrendWidget> createState() => _OnTrendWidgetState();
}

class _OnTrendWidgetState extends State<OnTrendWidget> {
  bool flag = true;
  String? firstHalf;
  String? secondHalf;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (onTrendDesc.length > 120) {
      firstHalf = onTrendDesc.substring(0, 120);
      secondHalf = onTrendDesc.substring(120, onTrendDesc.length);
    } else {
      firstHalf = onTrendDesc;
      secondHalf = "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Blog-Image.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.6), BlendMode.darken)),
      ),
      width: size.width,
      height: !flag ? size.height * .46 : size.height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "On Trend",
                  style: theme.bodyText1!.copyWith(
                    color: lightColor,
                    fontSize: 18,
                  ),
                ),
                // Text(
                //   "See All",
                //   style: theme.bodyText1!.copyWith(
                //       color: lightColor.withOpacity(.8), fontSize: 14),
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Retro Colors Make a Comeback:",
                  style: theme.bodyText1!.copyWith(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "What’s Hot in Decor Right Now",
                  style: theme.bodyText1!.copyWith(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                    // overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: flag
                          ? (firstHalf.toString() + "...")
                          : (firstHalf.toString() + secondHalf!).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: lightColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: InkWell(
                        child: Text(
                          flag ? " Read more" : " less",
                          style: TextStyle(
                            color: Colors.blue.shade500,
                            // fontWeight: FontWeight.w600,

                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/strings.dart';
import 'package:flutter/material.dart';

class OnTrendWidget extends StatelessWidget {
  const OnTrendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/realEstate.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.6), BlendMode.darken)),
      ),
      width: size.width,
      height: size.height * .3,
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
                  style: theme.bodyText1!
                      .copyWith(color: lightColor, fontSize: 18),
                ),
                Text(
                  "See All",
                  style: theme.bodyText1!.copyWith(
                      color: lightColor.withOpacity(.8), fontSize: 14),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              onTrendDesc,
              style: theme.bodyText1!.copyWith(
                color: lightColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dazllapp/UI/home/homepage.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopupButton extends StatefulHookConsumerWidget {
  const PopupButton({Key? key}) : super(key: key);

  @override
  ConsumerState<PopupButton> createState() => _PopupButtonState();
}

class _PopupButtonState extends ConsumerState<PopupButton> {
  @override
  Widget build(BuildContext context) {
    int? currentindex = SpHelpers.getInt(
      SharedPrefsKeys.currentindex,
    );
    return PopupMenuButton<int>(
      icon: Image.asset(
        "assets/images/navigation.png",
        color: lightColor,
      ),
      itemBuilder: (context) => [
        // PopupMenuItem 1
        // PopupMenuItem(
        //   value: 1,
        //   // row with 2 children
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.home,
        //         color: blackColor,
        //       ),
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Text(
        //         'Home',
        //         style: TextStyle(fontSize: 16),
        //       )
        //     ],
        //   ),
        // ),
        // PopupMenuItem 2
        PopupMenuItem(
          value: 2,
          // row with two children
          child: Row(
            children: [
              Icon(
                Icons.password_rounded,
                color: blackColor,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Change Password',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          // row with two children
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: blackColor,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ],
      offset: Offset(0, 40),
      color: lightColor,
      elevation: 2,
      // on selected we show the dialog box
      onSelected: (value) {
        // if value 1 show dialog
        if (value == 1) {
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //     (route) => false);
        } else if (value == 2) {
          Changepassworddailog(context, currentindex!, ref);
        } else if (value == 3) {
          logoutdilouge(
            context,
          );
        }
      },
    );
  }
}

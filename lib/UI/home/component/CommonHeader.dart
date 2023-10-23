import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isback;
  final VoidCallback? back;
  const CommonHeader(
      {Key? key, required this.title, required this.isback, this.back})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      leadingWidth: size.width * .1,
      leading: InkWell(
        onTap: () {
          if (isback && back == null) {
            Navigator.of(context).pop();
          } else if (back != null) {
            print("sdzhkhdfk");
            back!();
          }
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
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16,
              color: lightColor.withOpacity(.9),
            ),
      ),
    );
    // return Container(
    //   height: size.height * 0.12,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(20),
    //       bottomRight: Radius.circular(20),
    //     ),
    //     color: primaryColor,
    //   ),
    //   child: SafeArea(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         InkWell(
    //             onTap: () {
    //               if (isback && back == null) {
    //                 Navigator.of(context).pop();
    //               } else if (back != null) {
    //                 print("sdzhkhdfk");
    //                 back!();
    //               }
    //             },
    //             child: SizedBox(
    //               width: 30,
    //               child: Padding(
    //                 padding: const EdgeInsets.only(left: 8.0),
    //                 child: isback
    //                     ? Icon(
    //                         Icons.arrow_back,
    //                         color: lightColor,
    //                       )
    //                     : SizedBox(),
    //               ),
    //             )),
    //         Text(
    //           title,
    //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //                 fontSize: 16,
    //                 color: lightColor.withOpacity(.9),
    //               ),
    //         ),
    //         SizedBox(
    //           width: 38,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}

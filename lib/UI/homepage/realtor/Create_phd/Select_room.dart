import 'dart:developer';

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/phd.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class selectRoom extends ConsumerStatefulWidget {
  selectRoom({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<selectRoom> createState() => _selectRoomState();
}

class _selectRoomState extends ConsumerState<selectRoom> {
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await ref.read(customernotifier).getRooms();
    setState(() {
      loading = false;
    });
  }

  // Set select = {};
  int currentindex = -1;
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    final _roomsNotifier = ref.read(customernotifier);
    final _roomProvider = ref.read(realtorRoomsProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: Container(),
      //   elevation: 0,
      // ),
      body: Container(
        child: Column(
          children: [
            CommonHeader(title: "Create a new phd", isback: false),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            Expanded(
              child: loading
                  ? LoadingWidget()
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      itemCount: _roomsNotifier.listOfRoom.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (currentindex == index) {
                                currentindex = -1;
                              } else
                                currentindex = index;
                              roomid = _roomsNotifier.listOfRoom[index].id;
                              log("shhfdhdf  ${_roomsNotifier.listOfRoom[index].id}");
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: currentindex == index
                                      ? AppTheme.shadowcolor
                                      : AppTheme.light_grey,
                                  boxShadow: [
                                    currentindex == index
                                        ? BoxShadow(
                                            color: AppTheme.colorPrimary
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            // blurRadius: 3
                                          )
                                        : BoxShadow(),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // _roomsNotifier.listOfRoom[index].image ==
                                  //         ""
                                  //     ? Image.asset(
                                  //         'assets/images/noimage.png',
                                  //         width: 70,
                                  //         color: primaryColor,
                                  //       )
                                  //     : Image.network(
                                  //         _roomsNotifier
                                  //             .listOfRoom[index].image
                                  //             .toString(),
                                  //         width: 50,
                                  //         color: primaryColor,
                                  //       ),
                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                  Center(
                                    child: Text(
                                      _roomsNotifier.listOfRoom[index].name,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppTheme.colorPrimary,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: AppTheme.white,
                          ),
                          Text(
                            "Previous",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 18,
                                      color: lightColor.withOpacity(.9),
                                    ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        currentindex == -1;
                        // ? SizedBox()
                        // :
                        _roomProvider.reset();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Phd(
                              roomId: roomid ?? 0,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          currentindex == -1
                              ? SizedBox()
                              : Text(
                                  "Next",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 18,
                                        color: lightColor.withOpacity(.9),
                                      ),
                                ),
                          currentindex == -1
                              ? SizedBox()
                              : Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: AppTheme.white,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

// // ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable, deprecated_member_use, use_key_in_widget_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, non_constant_identifier_names

// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/customer/start_project/rooms.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// int? roomid;
// List<int> listRoomId = [];

// class CreateProject extends ConsumerStatefulWidget {
//   @override
//   ConsumerState createState() => _CreateProjectState();
// }

// class _CreateProjectState extends ConsumerState<CreateProject> {
//   bool isloading = true;
//   @override
//   void initState() {
//     super.initState();
//     loaddata();
//   }

//   loaddata() async {
//     isloading = true;
//     await ref.read(customernotifier).getRooms();
//     final _roomProvider = ref.read(customerRoomsProvider);
//     _roomProvider.reset();
//     if (mounted) {
//       setState(() {
//         isloading = false;
//       });
//     }
//   }

//   // Set select = {};
//   int currentindex = -1;

//   @override
//   Widget build(BuildContext context) {
//     final _roomsNotifier = ref.read(customernotifier);
//     final _roomProvider = ref.read(customerRoomsProvider);
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       // appBar: AppBar(
//       //   leading: Container(),
//       //   elevation: 0,
//       // ),
//       body: isloading
//           ? LoadingWidget()
//           : Container(
//               child: Column(
//                 children: [
//                   CommonHeader(title: "Select Room", isback: false),
//                   // SizedBox(
//                   //   height: size.height * 0.02,
//                   // ),
//                   Expanded(
//                     child: Container(
//                       color: AppTheme.white,
//                       margin: EdgeInsets.only(
//                         // top: size.height * 0.02,
//                         left: 10,
//                         right: 10,
//                         top: 10,
//                         // bottom: size.height * 0.01
//                       ),
//                       child: GridView.builder(
//                           padding: EdgeInsets.zero,
//                           itemCount: _roomsNotifier.listOfRoom.length,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   crossAxisSpacing: 10,
//                                   mainAxisSpacing: 10),
//                           itemBuilder: (context, index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   if (currentindex == index) {
//                                     currentindex = -1;
//                                   } else
//                                     currentindex = index;
//                                   // listRoomId.add(
//                                   roomid = _roomsNotifier.listOfRoom[index].id;
//                                   // );
//                                 });
//                               },
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: currentindex == index
//                                           ? AppTheme.shadowcolor
//                                           : AppTheme.light_grey,
//                                       boxShadow: [
//                                         currentindex == index
//                                             ? BoxShadow(
//                                                 color: AppTheme.colorPrimary
//                                                     .withOpacity(0.5),
//                                                 spreadRadius: 2,
//                                                 // blurRadius: 3
//                                               )
//                                             : BoxShadow(),
//                                       ]),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       // _roomsNotifier.listOfRoom[index].image ==
//                                       //         ""
//                                       //     ? Image.asset(
//                                       //         'assets/images/noimage.png',
//                                       //         width: 70,
//                                       //         color: primaryColor,
//                                       //       )
//                                       //     : Image.network(
//                                       //         _roomsNotifier
//                                       //             .listOfRoom[index].image
//                                       //             .toString(),
//                                       //         width: 50,
//                                       //         color: primaryColor,
//                                       //       ),
//                                       // SizedBox(
//                                       //   height: 8,
//                                       // ),
//                                       Center(
//                                         child: Text(
//                                           _roomsNotifier.listOfRoom[index].name,
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyText1!
//                                               .copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16,
//                                                 color: primaryColor,
//                                               ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     height: size.height * 0.09,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                         color: AppTheme.colorPrimary),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 20.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.arrow_back_ios,
//                                   size: 20,
//                                   color: AppTheme.white,
//                                 ),
//                                 Text(
//                                   "Previous",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1!
//                                       .copyWith(
//                                         fontSize: 18,
//                                         color: lightColor.withOpacity(.9),
//                                       ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _roomProvider.reset();

//                               currentindex == -1
//                                   ? SizedBox()
//                                   : Navigator.of(context)
//                                       .push(MaterialPageRoute(
//                                           builder: (context) => CustomerRooms(
//                                                 roomId: roomid ?? 0,
//                                                 // roomId: listRoomId ?? [0],
//                                               )));

//                               // Navigator.of(context).push(MaterialPageRoute(
//                               //     builder: (context) => NeedAttention()));
//                               _roomsNotifier.listOfoption.clear();
//                               _roomsNotifier.listOfissues.clear();
//                             },
//                             child: Row(
//                               children: [
//                                 currentindex == -1
//                                     ? SizedBox()
//                                     : Text(
//                                         "Next",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyText1!
//                                             .copyWith(
//                                               fontSize: 18,
//                                               color: lightColor.withOpacity(.9),
//                                             ),
//                                       ),
//                                 currentindex == -1
//                                     ? SizedBox()
//                                     : Icon(
//                                         Icons.arrow_forward_ios,
//                                         size: 20,
//                                         color: AppTheme.white,
//                                       ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// class CreatePlan {
//   String image;
//   // String name;
//   CreatePlan({
//     required this.image,
//     //required this.name
//   });
// }

// List<CreatePlan> CreatePlans = [
//   CreatePlan(
//     image: "assets/images/kitchen.png",
//   ),
//   CreatePlan(
//     image: "assets/images/bedroom.png",
//   ),
//   CreatePlan(
//     image: "assets/images/bath_room.png",
//   ),
//   CreatePlan(
//     image: "assets/images/kitchen.png",
//   ),
//   CreatePlan(
//     image: "assets/images/living_room.png",
//   ),
//   CreatePlan(
//     image: "assets/images/bath_room.png",
//   ),
//   CreatePlan(
//     image: "assets/images/dinnertable.png",
//   ),
//   CreatePlan(
//     image: "assets/images/dinnertable.png",
//   ),
//   CreatePlan(
//     image: "assets/images/bedroom.png",
//   ),
//   CreatePlan(
//     image: "assets/images/dinnertable.png",
//   ),
//   CreatePlan(
//     image: "assets/images/dinnertable.png",
//   ),
//   CreatePlan(
//     image: "assets/images/dinnertable.png",
//   ),
//   CreatePlan(
//     image: "assets/images/dinnertable.png",
//   ),
// ];

// Remove above Code After 26/4/2025

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/rooms.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateProject extends ConsumerStatefulWidget {
  const CreateProject({Key? key});

  @override
  ConsumerState<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends ConsumerState<CreateProject> {
  bool isloading = true;
  late RoomProvider roomProvider;
  late CustomerNotifier customerNotifier;
  int currentindex = -1;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    roomProvider = ref.read(customerRoomsProvider);
    customerNotifier = ref.read(customernotifier);

    isloading = true;

    await customerNotifier.getRooms();
    isloading = false;
    setState(() {});
  }

  // Set select = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isloading
          ? LoadingWidget()
          : Container(
              child: Column(
                children: [
                  CommonHeader(title: "Select Room", isback: false),
                  Expanded(
                    child: Container(
                      color: AppTheme.white,
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: customerNotifier.listOfRoom.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentindex == index) {
                                    currentindex = -1;
                                    roomProvider.selectedRoom = null;
                                  } else {
                                    roomProvider.selectedRoom =
                                        customerNotifier.listOfRoom[index];
                                    currentindex = index;
                                  }
                                  roomProvider.roomId =
                                      customerNotifier.listOfRoom[index].id;
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
                                              )
                                            : BoxShadow(),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          customerNotifier
                                              .listOfRoom[index].name,
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
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * 0.09,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: AppTheme.colorPrimary),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 18,
                                        color: lightColor.withOpacity(.9),
                                      ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // _roomProvider.reset();
                              roomProvider.changeTabIndex(newTabIndex: 0);

                              currentindex == -1 &&
                                      roomProvider.selectedRoom != null
                                  ? 
                                    toastShowError(context,'Please Select Room' )
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //         content: Text('Please Select Room')))
                                  : {
                                      currentindex = -1,
                                      if (mounted) setState(() {}),
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerRooms(
                                                    roomId: roomProvider
                                                        .selectedRoom!,
                                                  ))),
                                    };

                              customerNotifier.listOfoption.clear();
                              customerNotifier.listOfissues.clear();
                            },
                            child: Row(
                              children: [
                                currentindex == -1
                                    ? SizedBox()
                                    : Text(
                                        "Next",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
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
  }
}

// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
// import 'package:dazllapp/UI/homepage/realtor/Start_project/rooms.dart';
// import 'package:dazllapp/UI/homepage/realtor/provider/roomsProvider.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class Start_project extends ConsumerStatefulWidget {
//   final int? customerid;
//   // String? customeremail;
//   Start_project({
//     this.customerid,
//     // this.customeremail,
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState<Start_project> createState() => _Start_projectState();
// }

// class _Start_projectState extends ConsumerState<Start_project> {
//   late RoomProvider roomProvider;

//   bool isloading = true;
//   void initState() {
//     super.initState();
//     loaddata();
//   }

//   loaddata() async {
//     roomProvider = ref.read(customerRoomsProvider);
//     isloading = true;
//     RealtorRoomProvider _roomProvider = ref.read(realtorRoomsProvider);
//     _roomProvider.reset();
//     await ref.read(customernotifier).getRooms();
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
//     final _roomProvider = ref.read(realtorRoomsProvider);
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//           ),
//         ),
//         backgroundColor: primaryColor,
//         centerTitle: true,
//         leading: SizedBox(),
//         title: Text(
//           "Create a Project",
//           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                 fontSize: 16,
//                 color: lightColor.withOpacity(.9),
//               ),
//         ),
//       ),
//       body: isloading
//           ? LoadingWidget()
//           : Container(
//               child: Column(
//                 children: [
//                   // Container(
//                   //   height: size.height * 0.12,
//                   //   decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.only(
//                   //         bottomLeft: Radius.circular(20),
//                   //         bottomRight: Radius.circular(20),
//                   //       ),
//                   //       color: AppTheme.colorPrimary),
//                   //   child: SafeArea(
//                   //     child: Center(
//                   //       child: Text(
//                   //         "Create a Project",
//                   //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                   //               fontSize: 16,
//                   //               color: lightColor.withOpacity(.9),
//                   //             ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: AppTheme.white,
//                       margin: EdgeInsets.only(
//                         // top: size.height * 0.02,
//                         left: 10,
//                         right: 10,
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
//                                 roomProvider.roomId = _roomsNotifier.listOfRoom[index].id;
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
//                                       SizedBox(
//                                         height: 8,
//                                       ),
//                                       Center(
//                                         child: Text(
//                                           _roomsNotifier.listOfRoom[index].name,
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyLarge!
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
//                                       .bodyLarge!
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
//                               currentindex == -1;
//                               // ? SizedBox()
//                               // :
//                               // Navigator.of(context).push(MaterialPageRoute(
//                               //     builder: (context) => Select_feature(
//                               //           // customeremail: widget.customeremail,
//                               //           cutomerid: widget.customerid,
//                               //         )));
//                               _roomProvider.reset();
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => RealtorRooms(
//                                         roomId: roomProvider.roomId ?? 0,
//                                         // roomId: listRoomId ?? [0],
//                                       )));
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
//                                             .bodyLarge!
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

// delete this above code after 20/4/2025

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/rooms.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/roomsProvider.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Start_project extends ConsumerStatefulWidget {
  final String? projectid;
  final bool? customer;
  const Start_project( {Key? key,this.projectid , this.customer});

  @override
  ConsumerState<Start_project> createState() => _Start_projectState();
}

class _Start_projectState extends ConsumerState<Start_project> {
  late RoomProvider roomProvider;
  late RealtorRoomProvider realtorRoomProvider;

  bool isloading = true;
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    roomProvider = ref.read(customerRoomsProvider);
    realtorRoomProvider = ref.read(realtorRoomsProvider);
    isloading = true;
    await ref.read(customernotifier).getRooms();
    if (mounted) {
      setState(() {
        isloading = false;
      });
    }
  }

  // Set select = {};
  int currentindex = -1;
  @override
  Widget build(BuildContext context) {
    final _roomsNotifier = ref.read(customernotifier);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: SizedBox(),
        title: Text(
          "Create a Project",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 16,
                color: lightColor.withOpacity(.9),
              ),
        ),
      ),
      body: isloading
          ? LoadingWidget()
          : Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      color: AppTheme.white,
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: _roomsNotifier.listOfRoom.length,
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
                                    currentindex = index;
                                    realtorRoomProvider.selectedRoom =
                                        _roomsNotifier.listOfRoom[index];
                                  }
                                  roomProvider.roomId =
                                      _roomsNotifier.listOfRoom[index].id;
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
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Center(
                                        child: Text(
                                          _roomsNotifier.listOfRoom[index].name,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
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
                                      .bodyLarge!
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
                              realtorRoomProvider.changeTabIndex(
                                  newTabIndex: 0);

                              currentindex == -1 &&
                                      realtorRoomProvider.selectedRoom != null
                                  ? toastShowError(
                                      context, 'Please Select Room')
                                  :
                                  //  ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //         content: Text('Please Select Room')))
                                  // :
                                  {
                                      currentindex = -1,
                                      if (mounted) setState(() {}),
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RealtorRooms(
                                                    passedRoom:
                                                        realtorRoomProvider
                                                            .selectedRoom!,
                                                            projectid: widget.projectid,customer: widget.customer,
                                                  ))),
                                    };

                              _roomsNotifier.listOfoption.clear();
                              _roomsNotifier.listOfissues.clear();
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

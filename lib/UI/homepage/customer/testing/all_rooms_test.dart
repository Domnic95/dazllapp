// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
// import 'package:dazllapp/UI/homepage/customer/start_project/rooms.dart';
// import 'package:dazllapp/UI/homepage/customer/testing/project_provider_test.dart';
// import 'package:dazllapp/UI/homepage/customer/testing/tabs_screen_test.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class AllRooms extends ConsumerStatefulWidget {
//   const AllRooms({Key? key}) : super(key: key);

//   @override
//   ConsumerState<AllRooms> createState() => _AllRoomsState();
// }

// class _AllRoomsState extends ConsumerState<AllRooms> {
//   bool isloading = true;
//   late ProfileTestProvider profileTestProvider;
//   late CustomerNotifier customerNotifier;
//   int currentindex = -1;

//   @override
//   void initState() {
//     super.initState();
//     loaddata();
//   }

//   loaddata() async {
//     profileTestProvider = ref.read(profileTestProviders);
//     customerNotifier = ref.read(customernotifier);

//     isloading = true;

//     await customerNotifier.getRooms();
//     isloading = false;
//     setState(() {});
//     // final _roomProvider = ref.read(customerRoomsProvider);
//     // _roomProvider.reset();
//     // if (mounted) {
//     //   setState(() {
//     //     isloading = false;
//     //   });
//     // }
//   }

//   // Set select = {};

//   @override
//   Widget build(BuildContext context) {
//     // final _roomsNotifier = ref.read(customernotifier);
//     // final _roomProvider = ref.read(customerRoomsProvider);
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
//                   CommonHeader(title: "Test Select Room", isback: false),
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
//                           itemCount: customerNotifier.listOfRoom.length,
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
//                                     profileTestProvider.selectedRoom = null;
//                                   } else {
//                                     profileTestProvider.selectedRoom =
//                                         customerNotifier.listOfRoom[index];
//                                     currentindex = index;
//                                   }
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
//                                           customerNotifier
//                                               .listOfRoom[index].name,
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
//                               // _roomProvider.reset();

//                               currentindex == -1 &&
//                                       profileTestProvider.selectedRoom != null
//                                   ? ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text('Please Select Room')))
//                                   : {
//                                       currentindex = -1,
//                                       // if (mounted) setState(() {}),
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   TabsTestScreen(
//                                                     roomId: profileTestProvider
//                                                         .selectedRoom!,
//                                                     // roomId: listRoomId ?? [0],
//                                                   ))),
//                                     };

//                               // Navigator.of(context).push(MaterialPageRoute(
//                               //     builder: (context) => NeedAttention()));
//                               customerNotifier.listOfoption.clear();
//                               customerNotifier.listOfissues.clear();
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
// Remove above Code After 26/4/2025


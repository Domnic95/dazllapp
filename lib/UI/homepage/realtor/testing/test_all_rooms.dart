// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
// import 'package:dazllapp/UI/homepage/realtor/testing/tab_screen.dart';
// import 'package:dazllapp/UI/homepage/realtor/testing/test_provider.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class AllRooms extends ConsumerStatefulWidget {
//   const AllRooms({Key? key});

//   @override
//   ConsumerState<AllRooms> createState() => _AllRoomsState();
// }

// class _AllRoomsState extends ConsumerState<AllRooms> {
//   late RoomProvider roomProvider;
//   late TestProvider testProvider;

//   bool isloading = true;
//   void initState() {
//     super.initState();
//     loaddata();
//   }

//   loaddata() async {
//     roomProvider = ref.read(customerRoomsProvider);
//     testProvider = ref.read(testProvidersValue);
//     isloading = true;
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
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: AppTheme.white,
//                       margin: EdgeInsets.only(
//                         left: 10,
//                         right: 10,
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
//                                     roomProvider.selectedRoom = null;
//                                   } else {
//                                     currentindex = index;
//                                     testProvider.selectedRoom =
//                                         _roomsNotifier.listOfRoom[index];
//                                   }
//                                   roomProvider.roomId =
//                                       _roomsNotifier.listOfRoom[index].id;
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
//                                               )
//                                             : BoxShadow(),
//                                       ]),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
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
//                               testProvider.changeTabIndex(newTabIndex: 0);

//                               currentindex == -1 &&
//                                       testProvider.selectedRoom != null
//                                   ? ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text('Please Select Room')))
//                                   : {
//                                       currentindex = -1,
//                                       if (mounted) setState(() {}),
//                                       Navigator.of(context)
//                                           .push(MaterialPageRoute(
//                                               builder: (context) => TabScreen(
//                                                     passedRoom: testProvider
//                                                         .selectedRoom!,
//                                                   ))),
//                                     };

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

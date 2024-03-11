// import 'dart:developer';

// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/realtor/Start_project/realtor_project.dart';
// import 'package:dazllapp/UI/homepage/realtor/testing/test_provider.dart';
// import 'package:dazllapp/UI/homepage/realtor/testing/test_single_tab.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class TabScreen extends ConsumerStatefulWidget {
//   final Room passedRoom;

//   TabScreen({Key? key, required this.passedRoom});

//   @override
//   ConsumerState<TabScreen> createState() => _TabScreenState();
// }

// class _TabScreenState extends ConsumerState<TabScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   late TestProvider testProvider;
//   late CustomerNotifier _roomsNotifier;
//   List<Widget> _tabs = [];
//   List<Widget> _tabviews = [];
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   loadData() async {
//     _roomsNotifier = ref.read(customernotifier);
//     testProvider = ref.read(testProvidersValue);
//     await testProvider.addSeletedRoom(
//         addRoom: widget.passedRoom, tabIndex: _tabs.length);

//     buildTabController();

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   buildTabController() {
//     log("build Tab Controller");
//     _tabController = TabController(
//       length: testProvider.selectedAllRooms.length,
//       // testProvider.rooms.length == 0 ? 0 : testProvider.rooms.length - 1,
//       vsync: this,
//     );
//   }

//   List<Widget> buildTabs() {
//     _tabs.clear();
//     for (var i = 0; i < testProvider.selectedAllRooms.length; i++) {
//       _tabs.insert(
//           0,
//           Tab(
//             text: testProvider.selectedAllRooms[i].name.toString(),
//           ));
//     }

//     return _tabs;
//   }

//   List<Widget> buildTabView() {
//     _tabviews.clear();
//     for (var i = 0; i < testProvider.selectedAllRooms.length; i++) {
//       _tabviews.insert(0, SingleTab());
//     }
//     return _tabviews;
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     // final testProvider = ref.watch(realtorRoomsProvider);
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: testProvider.isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   CommonHeader(title: "Create a project", isback: false),
//                   TabBar(
//                       unselectedLabelStyle: TextStyle(color: blackColor),
//                       unselectedLabelColor: blackColor,
//                       onTap: (value) {
//                         testProvider.changeTabIndex(newTabIndex: value);

//                         testProvider.selectedRoom = testProvider
//                                 .selectedAllRooms[
//                             testProvider.selectedAllRooms.length - 1 - value];
//                       },
//                       tabAlignment: TabAlignment.start,
//                       indicatorPadding: EdgeInsets.all(3),
//                       labelColor: lightColor,
//                       automaticIndicatorColorAdjustment: true,
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: primaryColor),
//                       isScrollable: true,
//                       controller: _tabController,
//                       tabs: buildTabs()),
//                   Divider(),
//                   Expanded(
//                       child: TabBarView(
//                           controller: _tabController,
//                           children: buildTabView())),
//                 ],
//               ),
//         floatingActionButton: testProvider.isLoading
//             ? SizedBox()
//             : FloatingActionButton.extended(
//                 backgroundColor: primaryColor,
//                 onPressed: () {
//                   showModalBottomSheet<void>(
//                       isScrollControlled: true,
//                       shape: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                       context: context,
//                       builder: (BuildContext context) {
//                         return StatefulBuilder(
//                           builder: (context, setState1) {
//                             return Container(
//                               height: size.height * 0.55,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(15))),
//                               child: Column(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: IconButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         icon: Icon(Icons.close)),
//                                   ),
//                                   Expanded(
//                                     child: ListView.builder(
//                                       shrinkWrap: true,
//                                       itemCount:
//                                           _roomsNotifier.listOfRoom.length,
//                                       itemBuilder: (context, index) {
//                                         return InkWell(
//                                           onTap: () async {
//                                             testProvider.selectedRoom =
//                                                 _roomsNotifier
//                                                     .listOfRoom[index];
//                                             testProvider.addSeletedRoom(
//                                                 addRoom: _roomsNotifier
//                                                     .listOfRoom[index],
//                                                 tabIndex: _tabs.length);

//                                             buildTabController();
//                                             testProvider.changeTabIndex(
//                                                 newTabIndex: 0);

//                                             testProvider.changeLoadingState(
//                                                 value: false);

//                                             setState1(() {});

//                                             setState(() {});
//                                             Navigator.pop(context);
//                                           },
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8.0, vertical: 6),
//                                             child: Card(
//                                               color: AppTheme.light_grey,
//                                               // shape: OutlineInputBorder(
//                                               //     borderRadius:
//                                               //         BorderRadius.circular(8)),
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 12.0,
//                                                         vertical: 15.0),
//                                                 child: Align(
//                                                   alignment:
//                                                       Alignment.centerLeft,
//                                                   child: Text(
//                                                     "${_roomsNotifier.listOfRoom[index].name}",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyLarge!
//                                                         .copyWith(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 16,
//                                                           color: primaryColor,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       });
//                 },
//                 label: Text('Finalize Report'),
//               ),
//         bottomNavigationBar: testProvider.isLoading
//             ? SizedBox()
//             : Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 height: size.height * 0.09,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                     color: AppTheme.colorPrimary),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                           testProvider.restartProject();
//                         },
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.arrow_back_ios,
//                               size: 20,
//                               color: AppTheme.white,
//                             ),
//                             Text(
//                               "Previous",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge!
//                                   .copyWith(
//                                     fontSize: 18,
//                                     color: lightColor.withOpacity(.9),
//                                   ),
//                             )
//                           ],
//                         ),
//                       ),
//                       testProvider.allRoomFeature.isNotEmpty
//                           ? GestureDetector(
//                               onTap: () async {
//                                 Utils.loaderDialog(context, true);
//                                 await testProvider.loadData();
//                                 if (!testProvider.dataListItemIsEmpty) {
//                                   Utils.loaderDialog(context, false);
//                                   await testProvider.createproject();
//                                   Navigator.pushAndRemoveUntil(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               Realtor_project()),
//                                       (route) => false);
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content:
//                                         Text('Project created sucessfully'),
//                                     backgroundColor: teamColor,
//                                   ));
//                                 } else {
//                                   Utils.loaderDialog(context, false);
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(
//                                         'please Add Atleast one feature note and Add one Images!'),
//                                     backgroundColor: primaryColor,
//                                   ));
//                                 }
//                               },
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Next Area",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge!
//                                         .copyWith(
//                                           fontSize: 18,
//                                           color: lightColor.withOpacity(.9),
//                                         ),
//                                   ),
//                                   Icon(
//                                     Icons.arrow_forward_ios,
//                                     size: 20,
//                                     color: AppTheme.white,
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : SizedBox(),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }

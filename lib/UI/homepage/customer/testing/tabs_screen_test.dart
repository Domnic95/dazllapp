// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/customer/my_project/myproject.dart';
// import 'package:dazllapp/UI/homepage/customer/testing/project_provider_test.dart';
// import 'package:dazllapp/UI/homepage/customer/testing/single_tabview_test.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class TabsTestScreen extends ConsumerStatefulWidget {
//   const TabsTestScreen({Key? key, required this.roomId});
//   final Room roomId;

//   @override
//   ConsumerState<TabsTestScreen> createState() => _TabTestsScreenState();
// }

// class _TabTestsScreenState extends ConsumerState<TabsTestScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   // late RoomProvider _roomProvider;
//   late ProfileTestProvider profileTestProvider;
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
//     profileTestProvider = ref.read(profileTestProviders);
//     await profileTestProvider.addSeletedRoom(
//         addRoom: widget.roomId, tabIndex: _tabs.length);

//     // for (int i = 0; i < widget.roomId.length; i++) {
//     // _roomProvider.init(roomid: widget.roomId, roomsNotifier: _roomsNotifier);
//     // }
//     buildTabController();
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   buildTabController() {
//     // _roomProvider.loaddata(context, _roomProvider.roomIdList[0], ref);
//     _tabController = TabController(
//       length: profileTestProvider.selectedAllRooms.length,
//       vsync: this,
//       // initialIndex: _roomProvider.rooms.length - 1 > 0
//       //     ? _roomProvider.rooms.length - 1
//       //     : 0,
//     );
//   }

//   List<Widget> buildTabs() {
//     _tabs.clear();
//     // for (var i = 0; i < _phdProvider.rooms.length; i++) {
//     for (var i = 0; i < profileTestProvider.selectedAllRooms.length; i++) {
//       //  if (i - 1 == _tabs.length) {
//       _tabs.insert(
//           0,
//           Tab(
//             text: profileTestProvider.selectedAllRooms[i].name.toString(),
//           ));
//       // }
//     }
//     return _tabs;
//   }

//   List<Widget> buildTabView() {
//     _tabviews.clear();
//     for (var i = 0; i < profileTestProvider.selectedAllRooms.length; i++) {
//       _tabviews.insert(0, SingleTabviewTest());
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
//     // _roomProvider = ref.watch(customerRoomsProvider);
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: profileTestProvider.isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   CommonHeader(title: "Create a Project", isback: false),
//                   TabBar(
//                       unselectedLabelStyle: TextStyle(color: blackColor),
//                       unselectedLabelColor: blackColor,
//                       onTap: (value) {
//                         profileTestProvider.changeTabIndex(newTabIndex: value);
//                         profileTestProvider.selectedRoom =
//                             profileTestProvider.selectedAllRooms[
//                                 profileTestProvider.selectedAllRooms.length -
//                                     1 -
//                                     value];
//                         // _roomProvider.setTabIndex(tabIndex: value);
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
//                           physics: const NeverScrollableScrollPhysics(),
//                           controller: _tabController,
//                           children: buildTabView())),
//                 ],
//               ),
//         floatingActionButton: FloatingActionButton.extended(
//           backgroundColor: primaryColor,
//           onPressed: () {
//             showModalBottomSheet<void>(
//                 isScrollControlled: true,
//                 shape:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                 context: context,
//                 builder: (BuildContext context) {
//                   return StatefulBuilder(
//                     builder: (context, setState1) {
//                       return Container(
//                         height: size.height * 0.55,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(15))),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 6.0, left: 14.0, right: 6.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Add Room',
//                                     style: TextStyle(
//                                       color: primaryColor,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   IconButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       icon: Icon(Icons.close)),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: _roomsNotifier.listOfRoom.length,
//                                 itemBuilder: (context, index) {
//                                   return InkWell(
//                                     onTap: () {
//                                       profileTestProvider.selectedRoom =
//                                           _roomsNotifier.listOfRoom[index];
//                                       profileTestProvider.addSeletedRoom(
//                                           addRoom:
//                                               _roomsNotifier.listOfRoom[index],
//                                           tabIndex: _tabs.length);

//                                       buildTabController();
//                                       // buildTabs();
//                                       // buildTabView();
//                                       profileTestProvider.changeTabIndex(
//                                           newTabIndex: 0);

//                                       profileTestProvider.changeLoadingState(
//                                           value: false);

//                                       setState1(() {});

//                                       setState(() {});
//                                       Navigator.pop(context);
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0, vertical: 6.0),
//                                       child: Card(
//                                         color: AppTheme.light_grey,
//                                         // shape: OutlineInputBorder(
//                                         //     borderRadius:
//                                         //         BorderRadius.circular(8)),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 12.0, vertical: 15.0),
//                                           child: Align(
//                                             alignment: Alignment.centerLeft,
//                                             child: Text(
//                                               "${_roomsNotifier.listOfRoom[index].name}",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyLarge!
//                                                   .copyWith(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 16,
//                                                     color: primaryColor,
//                                                   ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 });
//           },
//           label: Text('Add Room'),
//         ),
//         bottomNavigationBar: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           height: size.height * 0.09,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               color: AppTheme.colorPrimary),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     profileTestProvider.restartProject();
//                     // Navigator.of(context).pop();
//                   },
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.arrow_back_ios,
//                         size: 20,
//                         color: AppTheme.white,
//                       ),
//                       Text(
//                         "Previous",
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                               fontSize: 18,
//                               color: lightColor.withOpacity(.9),
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 profileTestProvider.allRoomFeature.isNotEmpty
//                     ? GestureDetector(
//                         onTap: () async {
//                           Utils.loaderDialog(context, true);
//                           await profileTestProvider.load();
//                           if (!profileTestProvider.dataListItemIsEmpty) {
//                             // Utils.loaderDialog(context, false);
//                             await profileTestProvider.createproject();
//                             Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => myproject()),
//                                 (route) => false);
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text('Project created sucessfully'),
//                               backgroundColor: teamColor,
//                             ));
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text(
//                                   'please Add Atleast one feature note and Add one Images!'),
//                               backgroundColor: primaryColor,
//                             ));
//                             Utils.loaderDialog(context, false);
//                           }
//                         },
//                         child:
//                             //  featureissueid[indexs] == 0
//                             //     ? SizedBox()
//                             //     :
//                             Row(
//                           children: [
//                             Text(
//                               "Finish",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge!
//                                   .copyWith(
//                                     fontSize: 18,
//                                     color: lightColor.withOpacity(.9),
//                                   ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios,
//                               size: 20,
//                               color: AppTheme.white,
//                             ),
//                           ],
//                         ),
//                       )
//                     : SizedBox()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Remove above Code After 26/4/2025


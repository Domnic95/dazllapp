// import 'dart:developer';
// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/Select_Feature.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/test_phd/phd_test_provider.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/test_phd/test_phd_single_tab.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/config/providers/realtor_notifier.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class TestTabPhd extends ConsumerStatefulWidget {
//   final Room room;
//   const TestTabPhd({Key? key, required this.room}) : super(key: key);

//   @override
//   ConsumerState<TestTabPhd> createState() => _TestTabPhdState();
// }

// class _TestTabPhdState extends ConsumerState<TestTabPhd>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   late CustomerNotifier _roomsfeature;
//   late RealtorNotifier _realtorProvider;
//   late TestPhdProvider testProvider;
//   List<Widget> _tabs = [];
//   List<Widget> _tabviews = [];
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     loaddata();
//   }

//   loaddata() async {
//     isLoading = true;
//     _roomsfeature = ref.read(customernotifier);
//     _realtorProvider = ref.read(realtorprovider);
//     testProvider = ref.read(testphdProvider);
//     // testProvider.restartProject();
//     // for (int i = 0; i < widget.roomId.length; i++) {
//     await testProvider.addSeletedRoom(
//       addRoom: widget.room,
//       tabIndex: testProvider.tabIndex,
//     );
//     // }
//     buildTabController();
//     // log("build Tab Controller");
//     isLoading = false;
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
//           i,
//           Tab(
//             text: testProvider.selectedAllRooms[i].name.toString(),
//           ));
//     }

//     return _tabs;
//   }

//   List<Widget> buildTabView() {
//     _tabviews.clear();
//     for (var i = 0; i < testProvider.selectedAllRooms.length; i++) {
//       _tabviews.insert(i, TestSingleTab());
//     }
//     return _tabviews;
//   }

//   @override
//   Widget build(BuildContext context) {

//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Consumer(builder: (context, ref, child) {
//         testProvider = ref.watch(testphdProvider);
//         return isLoading
//             ? LoadingWidget()
//             : Column(
//                 children: [
//                   CommonHeader(title: 'Create a Phd', isback: false),
//                   TabBar(
//                     unselectedLabelStyle: TextStyle(color: blackColor),
//                     unselectedLabelColor: blackColor,
//                     onTap: (value) {
//                       testProvider.changeTabIndex(newTabIndex: value);
//                       log("message====  ${_tabController.index}");
//                       // setState(() {});
//                     },
//                     tabAlignment: TabAlignment.start,
//                     // automaticIndicatorColorAdjustment: true,
//                     indicatorPadding: EdgeInsets.all(3),
//                     labelColor: lightColor,
//                     automaticIndicatorColorAdjustment: true,
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicator: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: primaryColor),
//                     isScrollable: true,
//                     // labelStyle: TextStyle(color: lightColor),
//                     controller: _tabController,
//                     tabs: buildTabs(),
//                   ),
//                   Divider(),
//                   Expanded(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: buildTabView(),
//                     ),
//                   ),
//                 ],
//               );
//       }),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: primaryColor,
//         onPressed: () {
//           showModalBottomSheet<void>(
//               isScrollControlled: true,
//               shape:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//               context: context,
//               builder: (BuildContext context) {
//                 return StatefulBuilder(
//                   builder: (context, setState1) {
//                     return Container(
//                       height: size.height * 0.55,
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(15))),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 6.0, left: 14.0, right: 6.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Add Room',
//                                   style: TextStyle(
//                                     color: primaryColor,
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     icon: Icon(Icons.close)),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: _roomsfeature.listOfRoom.length,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () async {
//                                     testProvider.changeTabIndex(newTabIndex: 0);
//                                     testProvider.addSeletedRoom(
//                                       addRoom: _roomsfeature.listOfRoom[index],
//                                       tabIndex: testProvider.tabIndex,
//                                     );

//                                     buildTabController();
//                                     buildTabs();
//                                     buildTabView();
//                                     setState1(() {});

//                                     setState(() {});

//                                     log("adjslasdjs ${testProvider.tabIndex}");
//                                     setState(() {});
//                                     Navigator.pop(context);
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8.0, vertical: 6.0),
//                                     child: Card(
//                                       color: AppTheme.light_grey,
//                                       // shape: OutlineInputBorder(
//                                       //     borderRadius:
//                                       //         BorderRadius.circular(8)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 12.0, vertical: 15.0),
//                                         child: Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "${_roomsfeature.listOfRoom[index].name}",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyLarge!
//                                                 .copyWith(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 16,
//                                                   color: primaryColor,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               });
//         },
//         label: Text('Add Room'),
//         // child: Icon(
//         //   Icons.add,
//         //   color: lightColor,
//         // ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: size.height * 0.09,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             color: AppTheme.colorPrimary),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   testProvider.selectedAllRooms.clear();
//                   Navigator.of(context).pop();
//                   _realtorProvider.reset();

//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.arrow_back_ios,
//                       size: 20,
//                       color: AppTheme.white,
//                     ),
//                     Text(
//                       "Previous",
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 18,
//                             color: lightColor.withOpacity(.9),
//                           ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   Utils.loaderDialog(context, true);
//                   await testProvider.loadData(
//                       context: context, realtorProvider: _realtorProvider);
//                   testProvider.selectedAllRooms.clear();

//                   if (!testProvider.dataListItemIsEmpty) {
//                     await testProvider.createPhdReport(context: context);
//                   } else {
//                     Utils.loaderDialog(context, false);
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           'please Add Atleast one feature note and Add one Images!'),
//                       backgroundColor: primaryColor,
//                     ));
//                   }
//                 },
//                 child: Row(
//                   children: [
//                     Text(
//                       "Finish",
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 18,
//                             color: lightColor.withOpacity(.9),
//                           ),
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       size: 20,
//                       color: AppTheme.white,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

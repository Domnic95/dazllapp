// import 'dart:developer';

// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/customer/my_project/myproject.dart';
// import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
// import 'package:dazllapp/UI/homepage/customer/start_project/needs_attention.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CustomerRooms extends ConsumerStatefulWidget {
//   final int roomId;
//   // final List<int> roomId;
//   const CustomerRooms({Key? key, required this.roomId}) : super(key: key);

//   @override
//   ConsumerState<CustomerRooms> createState() => _CustomerRoomsState();
// }

// class _CustomerRoomsState extends ConsumerState<CustomerRooms>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   late RoomProvider _roomProvider;
//   late CustomerNotifier _roomsNotifier;
//   List<Widget> _tabs = [];
//   List<Widget> _tabviews = [];
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   loadData() {
//     _roomsNotifier = ref.read(customernotifier);
//     _roomProvider = ref.read(customerRoomsProvider);

//     // for (int i = 0; i < widget.roomId.length; i++) {
//     _roomProvider.init(roomid: widget.roomId, roomsNotifier: _roomsNotifier);
//     // }
//     buildTabController();
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   buildTabController() {
//     log("build Tab Controller");
//     _roomProvider.loaddata(context, _roomProvider.roomIdList[0], ref);
//     _tabController = TabController(
//       length: _roomProvider.rooms.length,
//       vsync: this,
//       // initialIndex: _roomProvider.rooms.length - 1 > 0
//       //     ? _roomProvider.rooms.length - 1
//       //     : 0,
//     );
//   }

//   List<Widget> buildTabs() {
//     // for (var i = 0; i < _phdProvider.rooms.length; i++) {

//     if (_roomProvider.roomIdList.length - 1 == _tabs.length) {
//       _tabs.insert(
//           0,
//           Tab(
//             text: _roomProvider.rooms[0].name.toString(),
//           ));
//     }
//     // }
//     return _tabs;
//   }

//   List<Widget> buildTabView() {
//     if (_roomProvider.roomIdList.length - 1 == _tabviews.length) {
//       _tabviews.insert(0, NeedAttention());
//     }
//     return _tabviews;
//   }

//   // buildTabController() {
//   //   _tabController =
//   //       TabController(length: _roomProvider.rooms.length, vsync: this);
//   // }

//   // List<Widget> buildTabs() {

//   //   // for (var i = 0; i < _roomProvider.rooms.length; i++) {
//   //  if (_roomProvider.roomIdList.length - 1 == _tabs.length) {
//   //     _tabs.add(Tab(
//   //       text: _roomProvider.rooms[_roomProvider.rooms.length - 1].name.toString(),
//   //       // child: Text(
//   //       //   _roomProvider.rooms[i].name.toString(),
//   //       //   overflow: TextOverflow.ellipsis,
//   //       //   maxLines: 2,
//   //       //   style: TextStyle(color: Colors.black),
//   //       // ),
//   //       // icon: Icon(Icons.cloud_outlined),
//   //     ));}
//   //   // }
//   //   return _tabs;
//   // }

//   // List<Widget> buildTabView() {
//   //   List<Widget> _tabviews = [];
//   //   for (var i = 0; i < _roomProvider.rooms.length; i++) {
//   //     _roomProvider.loaddata(context,ref);
//   //     _tabviews.add(NeedAttention());
//   //   }
//   //   return _tabviews;
//   // }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     _roomProvider = ref.watch(customerRoomsProvider);
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         // appBar: AppBar(
//         //   title: Container(
//         //     height: size.height * 0.08,
//         //     decoration: BoxDecoration(
//         //         borderRadius: BorderRadius.only(
//         //           bottomLeft: Radius.circular(20),
//         //           bottomRight: Radius.circular(20),
//         //         ),
//         //         color: AppTheme.colorPrimary),
//         //     child: Center(
//         //       child: Text(
//         //         "What items in this room would you like to dazl up ?",
//         //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
//         //               fontSize: 12,
//         //               color: lightColor.withOpacity(.9),
//         //             ),
//         //       ),
//         //     ),
//         //   ),
//         //   bottom:
//         //   TabBar(
//         //       unselectedLabelStyle: TextStyle(color: blackColor),
//         //       unselectedLabelColor: blackColor,
//         //       // automaticIndicatorColorAdjustment: true,
//         //       indicatorPadding: EdgeInsets.all(4),
//         //       indicator: BoxDecoration(
//         //           borderRadius: BorderRadius.circular(8), color: darkRed),
//         //       isScrollable: true,
//         //       controller: _tabController,
//         //       tabs: buildTabs()),
//         // ),
//         body: Column(
//           children: [
//             CommonHeader(title: "Create a Project", isback: false),
//             TabBar(
//                 unselectedLabelStyle: TextStyle(color: blackColor),
//                 unselectedLabelColor: blackColor,
//                 onTap: (value) {
//                   _roomProvider.setTabIndex(tabIndex: value);
//                 },
//                 tabAlignment: TabAlignment.start,
//                 indicatorPadding: EdgeInsets.all(3),
//                 labelColor: lightColor,
//                 automaticIndicatorColorAdjustment: true,
//                 indicatorSize: TabBarIndicatorSize.tab,
//                 indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: primaryColor),
//                 isScrollable: true,
//                 controller: _tabController,
//                 tabs: buildTabs()),
//             Divider(),
//             Expanded(
//                 child: TabBarView(
//                     controller: _tabController, children: buildTabView())),
//           ],
//         ),
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
//                                       _roomProvider.init(
//                                           roomid: _roomsNotifier
//                                               .listOfRoom[index].id,
//                                           roomsNotifier: _roomsNotifier);

//                                       buildTabController();
//                                       _roomProvider.setTabIndex(
//                                         tabIndex: 0,
//                                       );
//                                       // _roomProvider.setTabIndex(
//                                       //   tabIndex:
//                                       //       _roomProvider.rooms.length - 1 > 0
//                                       //           ? _roomProvider.rooms.length - 1
//                                       //           : 0,
//                                       // );
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
//                                     // child: Padding(
//                                     //   padding: const EdgeInsets.symmetric(
//                                     //       horizontal: 8.0, vertical: 4),
//                                     //   child: Card(
//                                     //     shape: OutlineInputBorder(
//                                     //         borderRadius:
//                                     //             BorderRadius.circular(8)),
//                                     //     child: Padding(
//                                     //       padding: const EdgeInsets.all(8.0),
//                                     //       child: ListTile(
//                                     //         contentPadding: EdgeInsets.zero,
//                                     //         // leading: _roomsNotifier
//                                     //         //             .listOfRoom[index]
//                                     //         //             .image ==
//                                     //         //         ""
//                                     //         //     ? Image.asset(
//                                     //         //         'assets/images/noimage.png',
//                                     //         //         width: 70,
//                                     //         //         color: primaryColor,
//                                     //         //       )
//                                     //         //     : Image.network(
//                                     //         //         _roomsNotifier
//                                     //         //             .listOfRoom[index].image
//                                     //         //             .toString(),
//                                     //         //         width: 50,
//                                     //         //         color: primaryColor,
//                                     //         //       ),
//                                     //         title: Text(
//                                     //           "${_roomsNotifier.listOfRoom[index].name}",
//                                     //           style: Theme.of(context)
//                                     //               .textTheme
//                                     //               .bodyText1!
//                                     //               .copyWith(
//                                     //                 fontWeight: FontWeight.bold,
//                                     //                 fontSize: 16,
//                                     //                 color: primaryColor,
//                                     //               ),
//                                     //         ),
//                                     //       ),
//                                     //     ),
//                                     //   ),
//                                     // ),
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
//           // child: Icon(
//           //   Icons.add,
//           //   color: lightColor,
//           // ),
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
//                     _roomProvider.reset();
//                     Navigator.of(context).pop();
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
//                 GestureDetector(
//                   onTap: () async {
//                     Utils.loaderDialog(context, true);
//                     log("api Call" +
//                         _roomProvider.featureId
//                             .toString()); // _roomProvider.featureId for Tab Index
//                     for (int i = 0; i < _roomProvider.featureId.length; i++) {
//                       _roomProvider.set(false, i);
//                       if (_roomProvider.featureId[i].isNotEmpty) {
//                         // _roomProvider.featureId[i] == in one tab How many Items(check box)
//                         for (int j = 0;
//                             j < _roomProvider.featureId[i].length;
//                             j++) {
//                           if (_roomProvider.featureId[i][j] != 0) {
//                             if (_roomProvider.DescrptionController[i][j].text
//                                     .isNotEmpty &&
//                                 _roomProvider.imgFile[i][j].isNotEmpty) {
//                               // for (var k = 0;
//                               //     k < _roomProvider.imgFile[i][j].length;
//                               //     k++) {
//                               //   await _roomProvider.getImage(context, i, j, k, ref);
//                               // }
//                               _roomProvider.set(true, i);
//                             } else if (_roomProvider
//                                     .DescrptionController[i][j].text.isEmpty ||
//                                 _roomProvider.imgFile[i][j].isEmpty) {
//                               // for (var k = 0;
//                               //     k < _roomProvider.imgFile[i][j].length;
//                               //     k++) {
//                               //   await _roomProvider.getImage(context, i, j, k, ref);
//                               // }
//                               // _roomProvider.set(false, i);
//                               // break;
//                             }
//                           }
//                         }
//                       }
//                     }
//                     // // print("jkldn" + select.toString());
//                     // // print("jkldn" + _description.toString());
//                     // List<bool> desempty = [];
//                     // List<bool> featureissueempty = [];
//                     // for (int i = 0; i < select.length; i++) {
//                     //   if (_description[select[i]].isEmpty) {
//                     //     desempty.add(false);
//                     //     ScaffoldMessenger.of(context).showSnackBar(
//                     //         SnackBar(
//                     //             content: Text(
//                     //                 'Add Description of ${_roomsfeature.listOfFeature[select[i]].name}')));
//                     //     break;
//                     //   } else {
//                     //     //  print("jkldn = " + i.toString());
//                     //     desempty.add(true);
//                     //   }
//                     //   // if (FeatureissueId[select[i]].isEmpty) {
//                     //   //   featureissueempty.add(false);
//                     //   //   ScaffoldMessenger.of(context).showSnackBar(
//                     //   //       SnackBar(
//                     //   //           content: Text(
//                     //   //               'Select issue ${_roomsfeature.listOfFeature[select[i]].name}')));
//                     //   //   break;
//                     //   // }
//                     //   // else {
//                     //   //   featureissueempty.add(true);
//                     //   // }
//                     // }
//                     // //  print("jkldn" + desempty.toString());

//                     // if (!desempty.contains(false) &&
//                     //     !featureissueempty.contains(false)) {
//                     //   removeempty();
//                     //   Navigator.of(context).pushReplacement(
//                     //     MaterialPageRoute(
//                     //       builder: (context) => TellusMore(
//                     //         featureid: featureId,
//                     //         featureoptionid: featureoptionid,
//                     //         // featureissueid: FeatureissueId,
//                     //         imgFile: imgFile,
//                     //         // addphotodescription:
//                     //         //     _addphotodescription,
//                     //         Descrption: _description,
//                     //       ),
//                     //     ),
//                     //   );
//                     // }
//                     // log("api Call" + _roomProvider.isSet.toString());
//                     // if (!_roomProvider.isSet.contains(false)) {
//                     // _roomProvider.tempclick
//                     //     ? {
//                     for (int i = 0; i < _roomProvider.featureId.length; i++) {
//                       if (_roomProvider.featureId[i].isNotEmpty) {
//                         _roomProvider.removeempty();
//                         _roomProvider.images(i);
//                         _roomProvider.load(i);
//                         if (_roomProvider.listData.isNotEmpty &&
//                             _roomProvider.file.isNotEmpty) {
//                           // log("data === = == ${_roomProvider.listData}");
//                         }
//                       }
//                     }
//                     // }
//                     // : {};

//                     // final projectId =
//                     await ref
//                         .read(customernotifier)
//                         .createproject(_roomProvider.listData);
//                     // await ref
//                     //     .read(customernotifier)
//                     //     .uploadimages(projectId, _roomProvider.file);
//                     Utils.loaderDialog(context, false);
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text('Project created sucessfully'),
//                       backgroundColor: teamColor,
//                     ));

//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => myproject()),
//                         (route) => false);
//                     _roomProvider.reset();
//                     if (!_roomProvider.isSet.contains(false)) {
//                       // await ref
//                       //     .read(customernotifier)
//                       //     .createproject(_roomProvider.listData);
//                       // // await ref
//                       // //     .read(customernotifier)
//                       // //     .uploadimages(projectId, _roomProvider.file);
//                       // Utils.loaderDialog(context, false);
//                       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       //   content: Text('Project created sucessfully'),
//                       //   backgroundColor: teamColor,
//                       // ));

//                       // Navigator.pushAndRemoveUntil(
//                       //     context,
//                       //     MaterialPageRoute(builder: (context) => myproject()),
//                       //     (route) => false);

//                       // _roomProvider.tempclick = true;
//                       // _roomProvider.reset();
//                     } else {
//                       // _roomProvider.tempclick = false;
//                       // _roomProvider.notifyListeners();
//                       Utils.loaderDialog(context, false);
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text(
//                             'please Add Atleast one feature note and Add one Images!'),
//                         backgroundColor: primaryColor,
//                       ));
//                     }

//                     // setState(() {
//                     //   loading = false;
//                     // });

//                     // log(_file.toString());
//                   },
//                   child:
//                       //  featureissueid[indexs] == 0
//                       //     ? SizedBox()
//                       //     :
//                       Row(
//                     children: [
//                       Text(
//                         "Finish",
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                               fontSize: 18,
//                               color: lightColor.withOpacity(.9),
//                             ),
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         size: 20,
//                         color: AppTheme.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Remove above Code After 26/4/2025

import 'dart:developer';

import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/customer/my_project/myproject.dart';
import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/needs_attention.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerRooms extends ConsumerStatefulWidget {
  const CustomerRooms({Key? key, required this.roomId});
  final Room roomId;

  @override
  ConsumerState<CustomerRooms> createState() => _CustomerRoomsState();
}

class _CustomerRoomsState extends ConsumerState<CustomerRooms>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // late RoomProvider _roomProvider;
  late RoomProvider roomProvider;
  late CustomerNotifier _roomsNotifier;
  List<Widget> _tabs = [];
  List<Widget> _tabviews = [];

  @override
  void initState() {
    super.initState();

    log('widget.roomId ${widget.roomId}');
    loadData();
  }

  loadData() async {
    _roomsNotifier = ref.read(customernotifier);
    roomProvider = ref.read(customerRoomsProvider);
    await roomProvider.addSeletedRoom(
        addRoom: widget.roomId, tabIndex: _tabs.length);

    await buildTabController();
    if (mounted) {
      setState(() {});
    }
  }

  buildTabController() {
    _tabController = TabController(
      length: roomProvider.selectedAllRooms.length,
      vsync: this,
    );
  }

  List<Widget> buildTabs() {
    _tabs.clear();
    for (var i = 0; i < roomProvider.selectedAllRooms.length; i++) {
      _tabs.insert(
          i,
          Tab(
            text: roomProvider.selectedAllRooms[i].name.toString(),
          ));
      // }
    }
    return _tabs;
  }

  List<Widget> buildTabView() {
    _tabviews.clear();
    for (var i = 0; i < roomProvider.selectedAllRooms.length; i++) {
      _tabviews.insert(i, NeedAttention());
    }
    return _tabviews;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: roomProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  CommonHeader(title: "Create a Project", isback: false),
                  TabBar(
                      unselectedLabelStyle: TextStyle(color: blackColor),
                      unselectedLabelColor: blackColor,
                      onTap: (value) {
                        roomProvider.changeTabIndex(newTabIndex: value);

                        roomProvider.selectedRoom = roomProvider
                                .selectedAllRooms[
                            roomProvider.selectedAllRooms.length - 1 - value];
                      },
                      tabAlignment: TabAlignment.start,
                      indicatorPadding: EdgeInsets.all(3),
                      labelColor: lightColor,
                      automaticIndicatorColorAdjustment: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primaryColor),
                      isScrollable: true,
                      controller: _tabController,
                      tabs: buildTabs()),
                  Divider(),
                  Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: buildTabView())),
                ],
              ),
        floatingActionButton: roomProvider.isLoading
            ? SizedBox()
            : FloatingActionButton.extended(
                backgroundColor: primaryColor,
                onPressed: () {
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState1) {
                            return Container(
                              height: size.height * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0, left: 14.0, right: 6.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Add Room',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          _roomsNotifier.listOfRoom.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () async {
                                            roomProvider.selectedRoom =
                                                _roomsNotifier
                                                    .listOfRoom[index];
                                            roomProvider.addSeletedRoom(
                                                addRoom: _roomsNotifier
                                                    .listOfRoom[index],
                                                tabIndex:
                                                    roomProvider.tabIndex);

                                            buildTabController();

                                            roomProvider.changeTabIndex(
                                                newTabIndex: 0);

                                            roomProvider.changeLoadingState(
                                                value: false);

                                            setState1(() {});

                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 6.0),
                                            child: Card(
                                              color: AppTheme.light_grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 15.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${_roomsNotifier.listOfRoom[index].name}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: primaryColor,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      });
                },
                label: Text('Add Room'),
              ),
        bottomNavigationBar: roomProvider.isLoading
            ? SizedBox()
            : Container(
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
                          roomProvider.restartProject();
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
                      roomProvider.allRoomFeature.isNotEmpty
                          ? GestureDetector(
                              onTap: () async {
                                Utils.loaderDialog(context, true);
                                await roomProvider.load();
                                if (!roomProvider.dataListItemIsEmpty) {
                                  Utils.loaderDialog(context, false);
                                  await roomProvider.createproject();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => myproject()),
                                      (route) => false);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Project created sucessfully'),
                                    backgroundColor: teamColor,
                                  ));
                                } else {
                                  Utils.loaderDialog(context, false);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'please Add Atleast one feature note and Add one Images!'),
                                    backgroundColor: primaryColor,
                                  ));
                                }
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Finish",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 18,
                                          color: lightColor.withOpacity(.9),
                                        ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: AppTheme.white,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:dazllapp/UI/homepage/customer/home/customer_homepage.dart';
import 'package:dazllapp/UI/homepage/customer/my_project/myproject.dart';
import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/needs_attention.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/realtor_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/select_feature.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/roomsProvider.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RealtorRooms extends StatefulHookWidget {
  final int roomId;
  // final List<int> roomId;
  const RealtorRooms({Key? key, required this.roomId}) : super(key: key);

  @override
  State<RealtorRooms> createState() => _RealtorRoomsState();
}

class _RealtorRoomsState extends State<RealtorRooms>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late RealtorRoomProvider _roomProvider;
  late CustomerNotifier _roomsNotifier;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    _roomsNotifier = context.read(customernotifier);
    _roomProvider = context.read(realtorRoomsProvider);
    log("roomId == ${widget.roomId}");
    // for (int i = 0; i < widget.roomId.length; i++) {
    _roomProvider.init(roomid: widget.roomId, roomsNotifier: _roomsNotifier);
    // }
    buildTabController();

    if (mounted) {
      setState(() {});
    }
  }

  buildTabController() {
    _tabController =
        TabController(length: _roomProvider.rooms.length, vsync: this);
  }

  List<Widget> buildTabs() {
    List<Widget> _tabs = [];
    for (var i = 0; i < _roomProvider.rooms.length; i++) {
      _tabs.add(Tab(
        text: _roomProvider.rooms[i].name.toString(),
        // child: Text(
        //   _roomProvider.rooms[i].name.toString(),
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 2,
        //   style: TextStyle(color: Colors.black),
        // ),
        // icon: Icon(Icons.cloud_outlined),
      ));
    }
    return _tabs;
  }

  List<Widget> buildTabView() {
    List<Widget> _tabviews = [];
    for (var i = 0; i < _roomProvider.rooms.length; i++) {
      _roomProvider.loaddata(context);
      _tabviews.add(Select_feature());
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     height: size.height * 0.08,
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(20),
      //           bottomRight: Radius.circular(20),
      //         ),
      //         color: AppTheme.colorPrimary),
      //     child: Center(
      //       child: Text(
      //         "What items in this room would you like to dazl up ?",
      //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
      //               fontSize: 12,
      //               color: lightColor.withOpacity(.9),
      //             ),
      //       ),
      //     ),
      //   ),
      //   bottom:
      //   TabBar(
      //       unselectedLabelStyle: TextStyle(color: blackColor),
      //       unselectedLabelColor: blackColor,
      //       // automaticIndicatorColorAdjustment: true,
      //       indicatorPadding: EdgeInsets.all(4),
      //       indicator: BoxDecoration(
      //           borderRadius: BorderRadius.circular(8), color: darkRed),
      //       isScrollable: true,
      //       controller: _tabController,
      //       tabs: buildTabs()),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppTheme.colorPrimary),
              child: Center(
                child: Text(
                  "What items in this room would you like to dazl up ?",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            TabBar(
                unselectedLabelStyle: TextStyle(color: blackColor),
                unselectedLabelColor: blackColor,
                onTap: (value) {
                  _roomProvider.setTabIndex(tabIndex: value);
                },
                // automaticIndicatorColorAdjustment: true,
                indicatorPadding: EdgeInsets.all(4),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: darkRed),
                isScrollable: true,
                controller: _tabController,
                tabs: buildTabs()),
            Divider(),
            Expanded(
                child: TabBarView(
                    controller: _tabController, children: buildTabView())),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkRed,
        onPressed: () {
          showModalBottomSheet<void>(
              isScrollControlled: true,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState1) {
                    return Container(
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close)),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _roomsNotifier.listOfRoom.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _roomProvider.init(
                                        roomid:
                                            _roomsNotifier.listOfRoom[index].id,
                                        roomsNotifier: _roomsNotifier);

                                    buildTabController();
                                    buildTabs();
                                    buildTabView();
                                    setState1(() {});

                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: _roomsNotifier
                                                      .listOfRoom[index]
                                                      .image ==
                                                  ""
                                              ? Image.asset(
                                                  'assets/images/noimage.png',
                                                  width: 70,
                                                  color: teamRed,
                                                )
                                              : Image.network(
                                                  _roomsNotifier
                                                      .listOfRoom[index].image
                                                      .toString(),
                                                  width: 50,
                                                  color: teamRed,
                                                ),
                                          title: Text(
                                            "${_roomsNotifier.listOfRoom[index].name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: teamRed,
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
        child: Icon(
          Icons.add,
          color: lightColor,
        ),
      ),
      
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: size.height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: AppTheme.colorPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _roomProvider.reset();
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
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                          color: lightColor.withOpacity(.9),
                        ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                Utils.loaderDialog(context, true);
                log("api Call" + _roomProvider.featureId.toString());
                for (int i = 0; i < _roomProvider.featureId.length; i++) {
                  _roomProvider.set(false, i);
                  if (_roomProvider.featureId[i].isNotEmpty) {
                    for (int j = 0;
                        j < _roomProvider.featureId[i].length;
                        j++) {
                      if (_roomProvider.featureId[i][j] != 0 &&
                          _roomProvider
                              .DescrptionController[i][j].text.isNotEmpty &&
                          _roomProvider.imgFile[i][j].isNotEmpty) {
                        for (var k = 0;
                            k < _roomProvider.imgFile[i][j].length;
                            k++) {
                          await _roomProvider.getImage(context, i, j, k);
                        }

                        _roomProvider.set(true, i);
                      }
                    }
                  }
                }
                // // print("jkldn" + select.toString());
                // // print("jkldn" + _description.toString());
                // List<bool> desempty = [];
                // List<bool> featureissueempty = [];
                // for (int i = 0; i < select.length; i++) {
                //   if (_description[select[i]].isEmpty) {
                //     desempty.add(false);
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //             content: Text(
                //                 'Add Description of ${_roomsfeature.listOfFeature[select[i]].name}')));
                //     break;
                //   } else {
                //     //  print("jkldn = " + i.toString());
                //     desempty.add(true);
                //   }
                //   // if (FeatureissueId[select[i]].isEmpty) {
                //   //   featureissueempty.add(false);
                //   //   ScaffoldMessenger.of(context).showSnackBar(
                //   //       SnackBar(
                //   //           content: Text(
                //   //               'Select issue ${_roomsfeature.listOfFeature[select[i]].name}')));
                //   //   break;
                //   // }
                //   // else {
                //   //   featureissueempty.add(true);
                //   // }
                // }
                // //  print("jkldn" + desempty.toString());

                // if (!desempty.contains(false) &&
                //     !featureissueempty.contains(false)) {
                //   removeempty();
                //   Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(
                //       builder: (context) => TellusMore(
                //         featureid: featureId,
                //         featureoptionid: featureoptionid,
                //         // featureissueid: FeatureissueId,
                //         imgFile: imgFile,
                //         // addphotodescription:
                //         //     _addphotodescription,
                //         Descrption: _description,
                //       ),
                //     ),
                //   );
                // }
                log("api Call" + _roomProvider.isSet.toString());
                if (!_roomProvider.isSet.contains(false)) {
                  for (int i = 0; i < _roomProvider.featureId.length; i++) {
                    if (_roomProvider.featureId[i].isNotEmpty) {
                      _roomProvider.removeempty();
                      _roomProvider.images(i);
                      _roomProvider.load(i);
                      log("imagesList == ${_roomProvider.imagesList}");
                      if (_roomProvider.listData.isNotEmpty &&
                          _roomProvider.file.isNotEmpty) {
                        final projectId = await context
                            .read(realtorprovider)
                            .createprojectrealtor(_roomProvider.listData);
                        await context
                            .read(realtorprovider)
                            .uploadimagesrealtor(projectId, _roomProvider.file);
                      }
                    }
                  }
                }
                if (!_roomProvider.isSet.contains(false)) {
                  Utils.loaderDialog(context, false);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Project created sucessfully'),
                    backgroundColor: teamColor,
                  ));
                  _roomProvider.reset();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Realtor_project()));
                } else {
                  Utils.loaderDialog(context, false);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'please Add Atleast one feature note and Add one Images!'),
                    backgroundColor: teamRed,
                  ));
                }

                // setState(() {
                //   loading = false;
                // });

                // log(_file.toString());
              },
              child:
                  //  featureissueid[indexs] == 0
                  //     ? SizedBox()
                  //     :
                  Row(
                children: [
                  Text(
                    "Next",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
            ),
          ],
        ),
      ),
    );
  }
}

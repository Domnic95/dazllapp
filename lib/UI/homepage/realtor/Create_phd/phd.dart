import 'dart:developer';

import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/Select_Feature.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/phdProvider.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Phd extends StatefulHookWidget {
  final int roomId;
  const Phd({Key? key, required this.roomId}) : super(key: key);

  @override
  State<Phd> createState() => _PhdState();
}

class _PhdState extends State<Phd> with TickerProviderStateMixin {
  late TabController _tabController;
  late CustomerNotifier _roomsfeature;
  late RealtorNotifier _realtorProvider;
  late PhdProvider _phdProvider;
  List<Widget> _tabs = [];
  List<Widget> _tabviews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() {
    _roomsfeature = context.read(customernotifier);
    _realtorProvider = context.read(realtorprovider);
    _phdProvider = context.read(phdProvider);
    _phdProvider.resetData();
    // for (int i = 0; i < widget.roomId.length; i++) {
    _phdProvider.init(roomid: widget.roomId, roomsNotifier: _roomsfeature);
    // }
    buildTabController();
    // log("build Tab Controller");
    if (mounted) {
      setState(() {});
    }
  }

  buildTabController() {
    log("build Tab Controller");
    _phdProvider.loaddata(
        context, _phdProvider.roomIdList[_phdProvider.rooms.length - 1]);
    _tabController =
        TabController(length: _phdProvider.rooms.length, vsync: this);
  }

  List<Widget> buildTabs() {
    // for (var i = 0; i < _phdProvider.rooms.length; i++) {

    if (_phdProvider.roomIdList.length - 1 == _tabs.length) {
      _tabs.add(Tab(
        text: _phdProvider.rooms[_phdProvider.rooms.length - 1].name.toString(),
        // child: Text(
        //   _roomProvider.rooms[i].name.toString(),
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 2,
        //   style: TextStyle(color: Colors.black),
        // ),
        // icon: Icon(Icons.cloud_outlined),
      ));
    }
    // }
    return _tabs;
  }

  List<Widget> buildTabView() {
    // List<Widget> _tabviews = [];
    // for (var i = 0; i < _phdProvider.rooms.length; i++) {

    if (_phdProvider.roomIdList.length - 1 == _tabviews.length) {
      _tabviews.add(SelectFeature(
        setState: () {
          setState(() {});
        },
      ));
    }
    // }
    return _tabviews;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                  "Create a Phd",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            TabBar(
                unselectedLabelStyle: TextStyle(color: blackColor),
                unselectedLabelColor: blackColor,
                onTap: (value) {
                  _phdProvider.setTabIndex(tabIndex: value);
                  // setState(() {});
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
                              itemCount: _roomsfeature.listOfRoom.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _phdProvider.init(
                                        roomid:
                                            _roomsfeature.listOfRoom[index].id,
                                        roomsNotifier: _roomsfeature);

                                    buildTabController();
                                    // buildTabs();
                                    // buildTabView();
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
                                          leading: _roomsfeature
                                                      .listOfRoom[index]
                                                      .image ==
                                                  ""
                                              ? Image.asset(
                                                  'assets/images/noimage.png',
                                                  width: 70,
                                                  color: teamRed,
                                                )
                                              : Image.network(
                                                  _roomsfeature
                                                      .listOfRoom[index].image
                                                      .toString(),
                                                  width: 50,
                                                  color: teamRed,
                                                ),
                                          title: Text(
                                            "${_roomsfeature.listOfRoom[index].name}",
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
                Navigator.of(context).pop();
                _realtorProvider.reset();
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
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>selectRoom()));
                Utils.loaderDialog(context, true);
                log("api Call" + _phdProvider.featureId.toString());
                for (int i = 0; i < _phdProvider.mainImgFile.length; i++) {
                  _phdProvider.set(false, i);
                  for (int j = 0; j < _phdProvider.mainImgFile[i].length; j++) {
                    await _phdProvider.getImage(
                        context, i, j, _phdProvider.mainImgFile[i][j], true);
                  }
                  _phdProvider.set(true, i);
                }
                for (int i = 0; i < _phdProvider.featureId.length; i++) {
                  _phdProvider.set(false, i);
                  if (_phdProvider.featureId[i].isNotEmpty) {
                    for (int j = 0; j < _phdProvider.featureId[i].length; j++) {
                      if (_phdProvider.featureId[i][j] != 0 &&
                          _phdProvider
                              .DescrptionController2[i][j].text.isNotEmpty &&
                          _phdProvider.imgFile[i][j].isNotEmpty) {
                        for (var k = 0;
                            k < _phdProvider.imgFile[i][j].length;
                            k++) {
                          await _phdProvider.getImage(context, i, j,
                              _phdProvider.imgFile[i][j][k], false);
                        }

                        _phdProvider.set(true, i);
                      }
                    }
                  }
                }
                log("mainimage == ${_phdProvider.mainImgList}");
                log("subimage == ${_phdProvider.imagesList}");
                Map<String, dynamic> data = {
                  'score': 100,
                  'address': _phdProvider.address,
                  'first_name': _phdProvider.firstName,
                  'last_name': _phdProvider.lastName,
                  'client_email': _phdProvider.clientEmail,
                  'type': _realtorProvider.housedata!.type,
                  "year_built": _realtorProvider.housedata!.yearBuilt,
                  "bedrooms": _realtorProvider.housedata!.bedrooms,
                  "bathrooms": _realtorProvider.housedata!.bathrooms,
                  "structure_type": _realtorProvider.housedata!.structureType,
                  "lot_size": _realtorProvider.housedata!.lotSize,
                  "location": _realtorProvider.housedata!.location,
                  "foundation_type": _realtorProvider.housedata!.foundationType,
                  "tax_accessed_value":
                      _realtorProvider.housedata!.taxAccessedValue,
                  "sale_date": _realtorProvider.housedata!.saleDate,
                  "lowest_price": _phdProvider.startRange,
//left:calc(-50% - 4px)
                  "highest_price": _phdProvider.endRange,
// true:true,
                  "room_id": _phdProvider.roomIdList[0],
                  'phd_description': _phdProvider
                      .DescrptionController[_phdProvider.tabIndex].text,
                  "images[0]": _phdProvider.mainImgList[0],
                  "rooms[${_phdProvider.roomIdList[0]}][feature_type][1]": 7,
                  "rooms[7][feature_type][82]": 121,
                  "rooms[7][additional][0]": 1,
                  "rooms[7][additional][1]": 4,
                  "rooms[7][status]": "NEEDS DAZL",
                  "rooms[7][feature_status][1]": "NEEDS DAZL",
                  "rooms[7][feature_issues_images][1][0]":
                      "https://res.cloudinary.com/dev-gnome/image/upload/v1679384263/oplhg0le3linv9uuszbi.svg",
                  "rooms[7][feature_issues_images_descr][1]": "test",
                  "rooms[7][feature_status][2]": "NEEDS DAZL",
                  "rooms[7][feature_issues_images][2][0]":
                      "https://res.cloudinary.com/dev-gnome/image/upload/v1679384273/jcwbxoykbh8xw2lpd6gk.svg",
                  "rooms[7][feature_issues_images_descr][2]": "teswt",
                  "rooms[3][feature_type][1]": 2,
                  "rooms[3][additional][1]": 12,
                  "rooms[3][status]": "MARKET READY",
                  "rooms[3][feature_status][2]": "NEEDS DAZL",
                  "rooms[3][feature_issues_images][2][0]":
                      "https://res.cloudinary.com/dev-gnome/image/upload/v1679384298/gst9s0ravt26jon6kwvq.svg",
                  "rooms[3][feature_issues_images_descr][2]": "test",
                  "zip_code": "123456",
                  "house_id": 1,
                  "customer_id": 1,
                  "mid_price": 500,
                };
                _realtorProvider.reset();
              },
              child: Row(
                children: [
                  Text(
                    "Finish",
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

import 'dart:developer';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/Select_Feature.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/Select_room.dart';
import 'package:dazllapp/UI/homepage/realtor/complitedPhd.dart/selectCustomer.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/phdProvider.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Phd extends ConsumerStatefulWidget {
  final int roomId;
  const Phd({Key? key, required this.roomId}) : super(key: key);

  @override
  ConsumerState<Phd> createState() => _PhdState();
}

class _PhdState extends ConsumerState<Phd> with TickerProviderStateMixin {
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
    _roomsfeature = ref.read(customernotifier);
    _realtorProvider = ref.read(realtorprovider);
    _phdProvider = ref.read(phdProvider);
    _phdProvider.resetData();
    // for (int i = 0; i < widget.roomId.length; i++) {
    _phdProvider.init(roomid: widget.roomId, roomsNotifier: _roomsfeature);
    // }
    buildTabController(0);
    // log("build Tab Controller");
    if (mounted) {
      setState(() {});
    }
  }

  buildTabController(int index) {
    log("build Tab Controller   ");
    _phdProvider.loaddata(
        context, _phdProvider.roomIdList[_phdProvider.rooms.length - 1], ref);
    _tabController = TabController(
        length: _phdProvider.rooms.length,
        initialIndex: _phdProvider.rooms.length - 1,
        vsync: this);
    log("tab index === ${_tabController.index}");
    _tabController.animateTo(_tabController.index);
    if (mounted) {
      setState(() {});
    }
  }

  List<Widget> buildTabs() {
    // for (var i = 0; i < _phdProvider.rooms.length; i++) {
    // log("tab index === ${_tabController.index}");
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

    // _tabController.index = _phdProvider.rooms.length - 1;
    return _tabviews;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        _phdProvider = ref.watch(phdProvider);
        return Column(
          children: [
            CommonHeader(title: 'Create a Phd', isback: false),
            TabBar(
              unselectedLabelStyle: TextStyle(color: blackColor),
              unselectedLabelColor: blackColor,
              onTap: (value) {
                _phdProvider.setTabIndex(tabIndex: _tabController.index);
                log("message====  ${_tabController.index}");
                // setState(() {});
              },
              // automaticIndicatorColorAdjustment: true,
              indicatorPadding: EdgeInsets.all(3),
              labelColor: lightColor,
              automaticIndicatorColorAdjustment: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: primaryColor),
              isScrollable: true,
              // labelStyle: TextStyle(color: lightColor),
              controller: _tabController,
              tabs: buildTabs(),
            ),
            Divider(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: buildTabView(),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
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
                                    _phdProvider.setTabIndex(
                                        tabIndex:
                                            _phdProvider.rooms.length - 1);
                                    buildTabController(_phdProvider.tabIndex);
                                    // buildTabs();
                                    // buildTabView();
                                    setState1(() {});

                                    setState(() {});

                                    log("adjslasdjs ${_phdProvider.tabIndex}");
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 6.0),
                                    child: Card(
                                      color: AppTheme.light_grey,
                                      // shape: OutlineInputBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 15.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${_roomsfeature.listOfRoom[index].name}",
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
        // child: Icon(
        //   Icons.add,
        //   color: lightColor,
        // ),
      ),
      bottomNavigationBar: Container(
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
                  _realtorProvider.reset();
                  // _phdProvider.setTabIndex(tabIndex: 0);
                  // _realtorProvider.reset();
                  // log('chjsdkbvkjkfj');
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (context) => selectRoom()));
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

                  // for (int i = 0; i < _phdProvider.mainImgFile.length; i++) {
                  //   _phdProvider.set(false, i);
                  //   for (int j = 0; j < _phdProvider.mainImgFile[i].length; j++) {
                  //     // await _phdProvider.getImage(context, i, j,
                  //     //     _phdProvider.mainImgFile[i][j], true, ref);
                  //     _phdProvider.set(true, i);
                  //   }

                  // }
                  // for (int i = 0; i < _phdProvider.featureId.length; i++) {
                  //   _phdProvider.set(false, i);
                  //   if (_phdProvider.featureId[i].isNotEmpty) {
                  //     for (int j = 0; j < _phdProvider.featureId[i].length; j++) {
                  //       if (_phdProvider.featureId[i][j] != 0 &&
                  //           _phdProvider
                  //               .DescrptionController2[i][j].text.isNotEmpty &&
                  //           _phdProvider.imgFile[i][j].isNotEmpty) {
                  //         // for (var k = 0;
                  //         //     k < _phdProvider.imgFile[i][j].length;
                  //         //     k++) {
                  //         //   // await _phdProvider.getImage(context, i, j,
                  //         //       // _phdProvider.imgFile[i][j][k], false, ref);
                  //         // }

                  //         _phdProvider.set(true, i);
                  //       }
                  //     }
                  //   }
                  // }
                  List<String> phdDes = [];
                  for (var i = 0;
                      i < _phdProvider.DescrptionController.length;
                      i++) {
                    phdDes.add(_phdProvider.DescrptionController[i].text);
                  }
                  // log("message===${_phdProvider.clientEmail}}");
                  // log("message===${_realtorProvider.housedata!.taxAccessedValue}");
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
                    "foundation_type":
                        _realtorProvider.housedata!.foundationType,
                    "tax_accessed_value":
                        _realtorProvider.housedata!.taxAccessedValue!.isEmpty
                            ? "1"
                            : _realtorProvider.housedata!.taxAccessedValue,
                    "sale_date": _realtorProvider.housedata!.saleDate!.isEmpty
                        ? "01-11-2021"
                        : _realtorProvider.housedata!.saleDate,
                    "lowest_price": _phdProvider.startRange,
                    //left:calc(-50% - 4px)
                    "highest_price": _phdProvider.endRange.toString(),
                    // "zip_code": _phdProvider.zipCode,
                    "zip_code": "123456",
                    "house_id": '',
                    // "customer_id": 1,
                    "mid_price": '500',
                    "true": 'true',
                    // "tr
                    //ue": 'true',
                    // "phd_description": phdDes.toString(),
                  };

                  log("phd descreption == ${phdDes}");
                  for (var i = 0; i < _phdProvider.roomIdList.length; i++) {
                    _phdProvider.set(false, i);
                    phdDes.add(_phdProvider.DescrptionController[i].text);
                    data["room_id"] = _phdProvider.roomIdList[i].toString();

                    if (phdDes[i].isNotEmpty) {
                      data["phd_description"] = phdDes[i].toString();
                    }
                    if (_phdProvider.mainImgList[i].isNotEmpty) {
                      for (var j = 0;
                          j < _phdProvider.mainImgList[i].length;
                          j++) {
                        if (_phdProvider.mainImgList[i][j].isNotEmpty) {
                          data['images[$j]'] =
                              _phdProvider.mainImgList[i][j].toString();
                          log("main image === ${_phdProvider.mainImgList[i][j]}");
                        }
                      }
                    }
                    // else {
                    //   data['images[0]'] = "";
                    // }

                    if (_phdProvider
                        .selectedFristImpressionList[i].isNotEmpty) {
                      data["rooms[${_phdProvider.roomIdList[i]}][status]"] =
                          _phdProvider.selectedFristImpressionList[i];
                    }
                    // for (int j = 0;
                    //     j < _phdProvider.mainImgList[i].length;
                    //     j++) {}
                    // data = {
                    //   //
                    //   // "rooms[7][feature_type][82]": 121,
                    //   // "rooms[7][additional][0]": 1,
                    //   // "rooms[7][additional][1]": 4,
                    //   // "rooms[7][status]": "NEEDS DAZL",
                    //   // "rooms[7][feature_status][1]": "NEEDS DAZL",
                    //   // "rooms[7][feature_issues_images][1][0]":
                    //   //     "https://res.cloudinary.com/dev-gnome/image/upload/v1679384263/oplhg0le3linv9uuszbi.svg",
                    //   // "rooms[7][feature_issues_images_descr][1]": "test",
                    //   // "rooms[7][feature_status][2]": "NEEDS DAZL",
                    //   // "rooms[7][feature_issues_images][2][0]":
                    //   //     "https://res.cloudinary.com/dev-gnome/image/upload/v1679384273/jcwbxoykbh8xw2lpd6gk.svg",
                    //   // "rooms[7][feature_issues_images_descr][2]": "teswt",
                    //   // "rooms[3][feature_type][1]": 2,
                    //   // "rooms[3][additional][1]": 12,
                    //   // "rooms[3][status]": "MARKET READY",
                    //   // "rooms[3][feature_status][2]": "NEEDS DAZL",
                    //   // "rooms[3][feature_issues_images][2][0]":
                    //   //     "https://res.cloudinary.com/dev-gnome/image/upload/v1679384298/gst9s0ravt26jon6kwvq.svg",
                    //   // "rooms[3][feature_issues_images_descr][2]": "test",
                    // };

                    // log("roomType ==== ${_realtorProvider.roomTypes[i].toString()}");
                    // log("selectRoomTypeFeature ==== ${_phdProvider.selectRoomTypeFeature[i].toString()}");
                    for (var j = 0;
                        j < _phdProvider.selectRoomTypeFeature[i].length;
                        j++) {
                      if (_phdProvider.selectRoomTypeFeature[i][j] != null) {
                        data["rooms[${_phdProvider.roomIdList[i]}][feature_type][${_realtorProvider.roomTypes[i][j].type!.id}]"] =
                            _phdProvider.selectRoomTypeFeature[i][j]!.id ?? 0;
                      }
                    }
                    for (var j = 0;
                        j < _phdProvider.selectedaddValueData[i].length;
                        j++) {
                      if (_phdProvider.selectedaddValueData[i][j]) {
                        data["rooms[${_phdProvider.roomIdList[i]}][additional][$j]"] =
                            _realtorProvider.addValueData[i][j].id ?? 0;
                      }
                    }

                    if (_phdProvider.featureId[i].isNotEmpty) {
                      for (int j = 0;
                          j < _phdProvider.featureId[i].length;
                          j++) {
                        if (_phdProvider.featureId[i][j] != 0 &&
                            // _phdProvider
                            //     .DescrptionController2[i][j].text.isNotEmpty &&
                            _phdProvider.imagesList[i][j].isNotEmpty) {
                          data["rooms[${_phdProvider.roomIdList[i]}][feature_status][${_phdProvider.featureId[i][j]}]"] =
                              _phdProvider.selectedFristImpressionList[i];
                          data["rooms[${_phdProvider.roomIdList[i]}][feature_issues_images_descr][${_phdProvider.featureId[i][j]}]"] =
                              _phdProvider.DescrptionController2[i][j].text;

                          for (var k = 0;
                              k < _phdProvider.imagesList[i][j].length;
                              k++) {
                            data["rooms[${_phdProvider.roomIdList[i]}][feature_issues_images][${_phdProvider.featureId[i][j]}][$k]"] =
                                _phdProvider.imagesList[i][j][k];
                          }

                          _phdProvider.set(true, i);
                        } else if (_phdProvider.featureId[i][j] != 0) {
                          log("message for empty");
                          data["rooms[${_phdProvider.roomIdList[i]}][feature_status][${_phdProvider.featureId[i][j]}]"] =
                              'DAZLING';
                          data["rooms[${_phdProvider.roomIdList[i]}][feature_issues_images_descr][${_phdProvider.featureId[i][j]}]"] =
                              _phdProvider.DescrptionController2[i][j].text;

                          data["rooms[${_phdProvider.roomIdList[i]}][feature_issues_images][${_phdProvider.featureId[i][j]}][0]"] =
                              '';
                        }
                      }
                    }
                  }
                  log("data === $data");
                  // if (!_phdProvider.isSet.contains(false)) {
                  //  if(_phdProvider.isSet.contains(false)){
                  await _realtorProvider.createPhdReport(data).then((value) {
                    Utils.loaderDialog(context, false);
                    log("value.statusCode  === ${value.statusCode}");
                    if (value.statusCode == 200) {
                      // if (i == _phdProvider.roomIdList.length - 1) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('PHD created sucessfully'),
                        backgroundColor: teamColor,
                      ));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectCustomer(),
                          ),
                          (route) => false);

                      _realtorProvider.reset();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Something went wrong'),
                        backgroundColor: Colors.red.shade400,
                      ));
                    }
                    // }
                    phdDes.clear();
                  });
                  // }
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text('Something Missing'),
                  //     backgroundColor: teamColor,
                  //   ));
                  // }
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
      ),
    );
  }
}

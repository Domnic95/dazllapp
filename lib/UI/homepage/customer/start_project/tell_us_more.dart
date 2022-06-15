// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/home/customer_homepage.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/needs_attention.dart';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TellusMore extends StatefulHookWidget {
  File? image;
  List<int> featureid;
  List<int> featureoptionid;
  List<int> featureissueid;
  List<List<File>> imgFile;
  List<List<String>> addphotodescription;
  List<String> Descrption;
  TellusMore(
      {required this.featureid,
      required this.featureoptionid,
      required this.featureissueid,
      required this.imgFile,
      required this.Descrption,
      required this.addphotodescription,
      required this.image});

  @override
  _TellusMoreState createState() => _TellusMoreState();
}

class _TellusMoreState extends State<TellusMore> {
  List<Map<String, dynamic>> listData = [];
  List<File> _file = [];
  bool loading = false;
  TextEditingController _cabinetController = TextEditingController();
  TextEditingController _inspectionController = TextEditingController();

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  loaddata() {
    for (int i = 0; i < widget.featureid.length; i++) {
      widget.imgFile.add([]);
    }
    for (int i = 0; i < widget.featureid.length; i++) {
      widget.addphotodescription.add([]);
    }
    for (int i = 0; i < widget.featureid.length; i++) {
      widget.Descrption.add('');
    }
  }

  load() {
    for (int i = 0; i < widget.featureid.length; i++) {
      Map<String, dynamic> _map = {
        "featureOption": widget.featureoptionid[i].toString(),
        "featureOptionIssues": widget.featureissueid[i].toString(),
        "features": widget.featureid[i].toString(),
        "inspectionNotes":
            //"test",
            widget.Descrption[i].isNotEmpty
                ? widget.Descrption[i].toString()
                : "",
        "issuetext": "test",
        "roomId": roomid
      };
      listData.add(_map);
    }
    setState(() {
      loading = true;
    });
  }

  images() {
    for (int i = 0; i < widget.imgFile.length; i++) {
      for (int j = 0; j < widget.imgFile[i].length; j++) {
        _file.add(widget.imgFile[i][j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //  log('message' + widget.Descrption.toString());
    final _roomsNotifier = useProvider(roomsprovider);
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NeedAttention()));
        return true;
      },
      child: SafeArea(
          child: loading
              ? LoadingWidget()
              : Scaffold(
                  body: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "Tell Us More",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 16,
                                    color: lightColor.withOpacity(.9),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Room id = " + roomid.toString()),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: widget.featureid.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Featureid = " +
                                            widget.featureid[index].toString(),
                                        style: TextStyle(),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          // widget.featureoptionid[index] == 0
                                          //     ? Text("FeatureOptionid = null")
                                          //     :
                                          Text(
                                            "FeatureOptionid = " +
                                                widget.featureoptionid[index]
                                                    .toString(),
                                            style: TextStyle(),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          // widget.featureissueid == []
                                          //     ? Text('null')
                                          //     :
                                          Text(
                                              "FeatureIssueid = " +
                                                  widget.featureissueid[index]
                                                      .toString(),
                                              style: TextStyle()),
                                        ],
                                      ),
                                      widget.imgFile == [[]]
                                          ? Text('No photo selected')
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  widget.imgFile[index].length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int subIndex) {
                                                return Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    ListTile(
                                                      leading: widget.imgFile[
                                                                  index] ==
                                                              []
                                                          ? Text(
                                                              'No Photo selected')
                                                          : Container(
                                                              height: 60,
                                                              width: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      FileImage(
                                                                    widget.imgFile[
                                                                            index]
                                                                        [
                                                                        subIndex],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                      title: widget.addphotodescription[
                                                                  index] ==
                                                              []
                                                          ? Text('null')
                                                          : Text(widget
                                                                  .addphotodescription[
                                                              index][subIndex]),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      widget.Descrption[index] == ''
                                          ? Text('')
                                          : Text(
                                              "Description = " +
                                                  widget.Descrption[index]
                                                      .toString(),
                                              style: TextStyle()),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: Colors.black,
                              );
                            },
                          ),
                        ),
                        Container(
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
                                  // Navigator.of(context).pop();
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NeedAttention()));
                                  _roomsNotifier.listOfoption.clear();
                                  _roomsNotifier.listOfissues.clear();
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
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 18,
                                            color: lightColor.withOpacity(.9),
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  removeempty();
                                  load();
                                  images();
                                  final projectId = await context
                                      .read(roomsprovider)
                                      .createproject(listData);

                                  await context
                                      .read(roomsprovider)
                                      .uploadimages(projectId, _file);
                                  setState(() {
                                    loading = false;
                                  });

                                  // log(_file.toString());
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomerHomepage()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Finish & Save",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  void removeempty() {
    widget.Descrption.removeWhere((element) => ["", 0].contains(element));
    widget.imgFile.removeWhere((element) => element.length == 0);
    widget.addphotodescription.removeWhere((element) => element.length == 0);
  }
}

List images = [
  "https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1513584684374-8bab748fbf90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
];
// child: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     ListView.builder(
                          //       itemCount: 2,
                          //       itemBuilder: (BuildContext context, int index) {
                          //         return Text(
                          //           widget.currentoptionselected[index],
                          //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //                 fontSize: 20,
                          //                 fontWeight: FontWeight.w600,
                          //                 color: darkTextColor,
                          //               ),
                          //         );
                          //       },
                          //     ),
                          //     SizedBox(
                          //       height: 10,
                          //     ),
                          //     SizedBox(
                          //       height: 10,
                          //     ),
                          //     Container(
                          //       height: size.height * 0.07,
                          //       padding: EdgeInsets.symmetric(horizontal: 15),
                          //       decoration: BoxDecoration(
                          //           border: Border.all(
                          //               color: AppTheme.grey.withOpacity(0.5), width: 2),
                          //           // boxShadow: [
                          //           //   BoxShadow(
                          //           //       color: AppTheme.grey.withOpacity(0.3),
                          //           //       blurRadius: 3,
                          //           //       spreadRadius: 1,
                          //           //       offset: Offset(3, 3))
                          //           // ],
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: Colors.white),
                          //       child: TextFormField(
                          //         controller: _cabinetController,
                          //         minLines: 2,
                          //         maxLines: 100,
                          //         textInputAction: TextInputAction.done,
                          //         cursorColor: AppTheme.colorPrimary,
                          //         decoration: InputDecoration(
                          //             hintText: "Add note to inspection report",
                          //             focusedBorder: UnderlineInputBorder(
                          //                 borderSide:
                          //                     BorderSide(color: Colors.transparent)),
                          //             enabledBorder: UnderlineInputBorder(
                          //                 borderSide:
                          //                     BorderSide(color: Colors.transparent)),
                          //             border: UnderlineInputBorder(
                          //                 borderSide:
                          //                     BorderSide(color: Colors.transparent))),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 25,
                          //     ),
                          //     Container(
                          //       height: size.height * 0.25,
                          //       padding: EdgeInsets.symmetric(horizontal: 15),
                          //       decoration: BoxDecoration(
                          //           border: Border.all(
                          //               color: AppTheme.grey.withOpacity(0.5), width: 2),
                          //           // boxShadow: [
                          //           //   BoxShadow(
                          //           //       color: AppTheme.grey.withOpacity(0.3),
                          //           //       blurRadius: 3,
                          //           //       spreadRadius: 1,
                          //           //       offset: Offset(3, 3))
                          //           // ],
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: Colors.white),
                          //       child: TextFormField(
                          //         controller: _inspectionController,
                          //         minLines: 2,
                          //         maxLines: 100,
                          //         textInputAction: TextInputAction.done,
                          //         cursorColor: AppTheme.colorPrimary,
                          //         decoration: InputDecoration(
                          //             hintText: "add note to inspection report",
                          //             focusedBorder: UnderlineInputBorder(
                          //                 borderSide:
                          //                     BorderSide(color: Colors.transparent)),
                          //             enabledBorder: UnderlineInputBorder(
                          //                 borderSide:
                          //                     BorderSide(color: Colors.transparent)),
                          //             border: UnderlineInputBorder(
                          //                 borderSide:
                          //                     BorderSide(color: Colors.transparent))),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 20,
                          //     ),
                          //     Text(
                          //       "Upload Image",
                          //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.w600,
                          //             color: darkTextColor,
                          //           ),
                          //     ),
                          //     SizedBox(
                          //       height: 20,
                          //     ),
                          //     Container(
                          //         height: size.height * 0.35,
                          //         child: GridView.builder(
                          //             itemCount: images.length,
                          //             gridDelegate:
                          //                 SliverGridDelegateWithFixedCrossAxisCount(
                          //                     // mainAxisExtent: 10,
                          //                     crossAxisSpacing: 10,
                          //                     mainAxisSpacing: 10,
                          //                     crossAxisCount: 3),
                          //             itemBuilder: (context, index) {
                          //               return index == 0
                          //                   ? Container(
                          //                       decoration: BoxDecoration(
                          //                         color: AppTheme.white,
                          //                         borderRadius: BorderRadius.circular(20),
                          //                         boxShadow: [
                          //                           BoxShadow(
                          //                             color: AppTheme.grey.withOpacity(0.5),
                          //                             blurRadius: 3,
                          //                             offset: Offset(3, 3),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       child: Center(
                          //                         child: Icon(
                          //                           Icons.add_circle_outline,
                          //                           color: AppTheme.colorPrimary
                          //                               .withOpacity(0.7),
                          //                           size: 50,
                          //                         ),
                          //                       ),
                          //                     )
                          //                   : Container(
                          //                       decoration: BoxDecoration(
                          //                         color: AppTheme.white,
                          //                         borderRadius: BorderRadius.circular(20),
                          //                         boxShadow: [
                          //                           BoxShadow(
                          //                             color: AppTheme.grey.withOpacity(0.5),
                          //                             blurRadius: 3,
                          //                             offset: Offset(3, 3),
                          //                           ),
                          //                         ],
                          //                         image: DecorationImage(
                          //                           image: NetworkImage(images[index]),
                          //                           fit: BoxFit.cover,
                          //                         ),
                          //                       ),
                          //                     );
                          //             })),
                          //   ],
                          // ),
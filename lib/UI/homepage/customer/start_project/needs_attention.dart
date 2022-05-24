// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_if_null_operators, prefer_typing_uninitialized_variables, sized_box_for_whitespace, unnecessary_null_comparison, unused_import, unnecessary_import, use_key_in_widget_constructors, non_constant_identifier_names, prefer_final_fields

import 'dart:developer';

import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/tell_us_more.dart';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NeedAttention extends StatefulHookWidget {
  @override
  _NeedAttentionState createState() => _NeedAttentionState();
}

class _NeedAttentionState extends State<NeedAttention> {
  List<int> featureId = <int>[];
  List<int> featureoptionid = <int>[];
  bool immediate = false;
  bool immediate1 = false;
  bool immediate2 = false;
  int currentindex = -1;
  bool cabinets = false;
  bool floors = false;
  List<String> currentoptionselected = <String>[];
  List<int> currentoptionselectedid = <int>[];
  List<String> currentissueselected = <String>[];
  List<int> c = <int>[];
  List<int> select = [];

  TextEditingController _Attentioncontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await context.read(roomsprovider).getRoomsFeature(roomid);
    await context.read(roomsprovider).getFeatureOptionIssues();
  }

  bool view = false;

  @override
  Widget build(BuildContext context) {
    final _roomsfeature = useProvider(roomsprovider);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  view = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    elevation: 0.3,
                    backgroundColor: Colors.transparent,
                    dismissDirection: DismissDirection.none,
                    duration: Duration(days: 5),
                    content: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              setState(() {
                                view = false;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          height: size.height * 0.12,
                          padding: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.grey.withOpacity(0.5),
                                  width: 2),
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: AppTheme.grey.withOpacity(0.3),
                              //       blurRadius: 3,
                              //       spreadRadius: 1,
                              //       offset: Offset(3, 3))
                              // ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: _Attentioncontroller,
                                minLines: 2,
                                maxLines: 100,
                                textInputAction: TextInputAction.done,
                                cursorColor: AppTheme.colorPrimary,
                                decoration: InputDecoration(
                                    hintText: "Add note to inspection report",
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyText1,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppTheme.colorPrimary,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      setState(() {
                                        view = false;
                                      });
                                    },
                                  ),
                                  width: 50,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )));
              },
              backgroundColor: view == true
                  ? Colors.transparent.withOpacity(0)
                  : AppTheme.colorPrimary,
              elevation: 0,
              label: Text(
                'Want to Add Comment?',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        //  resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   leading: Container(),
        //   elevation: 0,
        // ),
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
                    "What needs attention?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: lightColor.withOpacity(.9),
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                // height: size.height * 0.63,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _roomsfeature.listOfFeature.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    for (int i = 0; i < 20; i++) {
                      currentoptionselected.add('');
                    }
                    for (int i = 0; i < 20; i++) {
                      c.add(0);
                    }
                    for (int i = 0; i < 1; i++) {
                      featureId.add(0);
                    }
                    for (int i = 0; i < 1; i++) {
                      featureoptionid.add(0);
                    }
                    for (int i = 0; i < 20; i++) {
                      currentissueselected.add('');
                    }
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                activeColor: AppTheme.colorPrimary,
                                value: select.contains(index),
                                onChanged: (val) {
                                  setState(() {
                                    if (select.contains(index)) {
                                      select.remove(index);
                                      currentoptionselected[index] = '';
                                      currentissueselected[index] = '';
                                      // currentindex = index;
                                    } else {
                                      select.add(index);
                                      featureId[index] =
                                          _roomsfeature.listOfFeature[index].id;
                                    }
                                  });
                                }),
                            Text(
                              _roomsfeature.listOfFeature[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppTheme.darkerText,
                                  ),
                            )
                          ],
                        ),
                        select.contains(index)
                            ? Container(
                                padding: currentoptionselected[index] != ''
                                    ? null
                                    : EdgeInsets.only(left: 15),
                                //color: Colors.amber,
                                child: Row(
                                  mainAxisAlignment:
                                      currentoptionselected[index] != ''
                                          ? MainAxisAlignment.spaceAround
                                          : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width / 2.3,
                                      decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          // borderRadius:
                                          //     BorderRadius.circular(20)
                                          ),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        borderRadius: BorderRadius.circular(20),
                                        hint: currentoptionselected[index] == ''
                                            ? Text('Select Option')
                                            : Text(
                                                currentoptionselected[index]),
                                        items: _roomsfeature.listOfoption
                                            .where((c) =>
                                                c.featureId == featureId[index])
                                            .map((dropdownselect) {
                                          return DropdownMenuItem<String>(
                                            child: Text(dropdownselect.name),
                                            value: dropdownselect.name,
                                            onTap: () {
                                              c[index] = dropdownselect.id;
                                            },
                                          );
                                        }).toList(),
                                        onChanged: (newselectedvalue) async {
                                          currentoptionselected[index] =
                                              newselectedvalue!;
                                          featureoptionid[index] = c[index];
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    currentoptionselected[index] != ''
                                        ? Container(
                                            width: size.width / 2.3,
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                // borderRadius:
                                                //     BorderRadius.circular(20)
                                                ),
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              hint:
                                                  currentissueselected[index] ==
                                                          ''
                                                      ? Text('Select issue')
                                                      : Text(
                                                          currentissueselected[
                                                              index]),
                                              items: _roomsfeature.listOfissues
                                                  .where((e) =>
                                                      e.featureOptionId ==
                                                      c[index])
                                                  .map((dropdownselect) {
                                                return DropdownMenuItem<String>(
                                                  child:
                                                      Text(dropdownselect.name),
                                                  value: dropdownselect.name,
                                                );
                                              }).toList(),
                                              onChanged: (newselectedvalue) {
                                                currentissueselected[index] =
                                                    newselectedvalue!;
                                                setState(() {});
                                              },
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TellusMore()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Next",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

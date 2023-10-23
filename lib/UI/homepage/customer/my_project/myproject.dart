import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/customTextfield.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/customer/home/customer_homepage.dart';
import 'package:dazllapp/UI/homepage/customer/my_project/my_project_details.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class myproject extends ConsumerStatefulWidget {
  myproject({Key? key}) : super(key: key);

  @override
  ConsumerState<myproject> createState() => _myprojectState();
}

class _myprojectState extends ConsumerState<myproject> {
  bool loading = true;

  CustomerNotifier? projectprovider;
  List<String> list = [];
  bool isLoading = true;
  List<List<List<bool>>> isBtnLoading = [];
  List<List<List<bool>>> isDeleteBtnLoading = [];

  List<List<List<TextEditingController>>> _editCommetController = [];
  List<List<List<bool>>> isEdit = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void loadData(index) async {
    await projectprovider!.setCustomerModel();
    for (int i = 0;
        i < projectprovider!.listofproject[index].roominfo!.length;
        i++) {
      for (int j = 0;
          j <
              projectprovider!
                  .listofproject[index].roominfo![i].feature!.length;
          j++) {
        // _editCommetController.add(TextEditingController(
        //     text: projectprovider!.listofproject[index].roominfo![i].feature![j]
        //         .inspectionNotes));
        // isEdit.add(false);
      }
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  load() async {
    await ref.read(customernotifier).myproject();
    projectprovider = ref.read(customernotifier);
    await ref.read(customernotifier).setCustomerModel();
    for (var index = 0;
        index < projectprovider!.listofproject.length;
        index++) {
      _editCommetController.add([]);
      isEdit.add([]);
      isBtnLoading.add([]);
      isDeleteBtnLoading.add([]);
      // projectprovider!.listofproject[index].roominfo!.isEmpty
      //     ? _editCommetController[index][0].add(TextEditingController(text: ""))
      //     : null;
      for (int i = 0;
          i < projectprovider!.listofproject[index].roominfo!.length;
          i++) {
        _editCommetController[index].add([]);
        isEdit[index].add([]);
        isBtnLoading[index].add([]);
        isDeleteBtnLoading[index].add([]);
        for (int j = 0;
            j <
                projectprovider!
                    .listofproject[index].roominfo![i].feature!.length;
            j++) {
          log("bvhjv  " + i.toString());
          _editCommetController[index][i].add(TextEditingController(
              text: projectprovider!.listofproject[index].roominfo![i]
                  .feature![j].inspectionNotes));

          isEdit[index][i].add(false);
          isBtnLoading[index][i].add(false);
          isDeleteBtnLoading[index][i].add(false);
        }
      }
    }
    //  log("isedit " + isEdit.toString());
    //         log("_editCommetController " +
    //             _editCommetController[2].text.toString());
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final projectprovider = ref.watch(customernotifier);
    log('messagemkxsmkcd ----' + projectprovider.toString());
    return loading
        ? LoadingWidget()
        : WillPopScope(
            onWillPop: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerHomepage(),
                  ));
              return false;
            },
            child: Scaffold(
              body: projectprovider!.listofproject.isEmpty
                  ? Center(child: Text("No Projects Found"))
                  : Container(
                      child: Column(
                        children: [
                          CommonHeader(title: "My Project", isback: false),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: ListView.builder(
                                // reverse: true,
                                padding: EdgeInsets.zero,
                                itemCount:
                                    projectprovider!.listofproject.length,
                                itemBuilder:
                                    (BuildContext context, int widgetIndex) {
                                  // loadData(widgetIndex);
                                  return projectprovider!
                                          .listofproject[widgetIndex]
                                          .roominfo!
                                          .isEmpty
                                      ? SizedBox()
                                      : GestureDetector(
                                          onTap: () {
                                            // projectprovider
                                            //         .listofproject[widgetIndex]
                                            //         .roominfo!
                                            //         .isEmpty
                                            //     ? null
                                            //     : Navigator.of(context).push(
                                            //         MaterialPageRoute(
                                            //           builder: (context) =>
                                            //               Project_Details(
                                            //             index: widgetIndex,
                                            //           ),
                                            //         ),
                                            //       );
                                          },
                                          child: Container(
                                            // height: 80,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .colorPrimary,
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          10))),
                                                      child: ListTile(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        8),
                                                        title: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // Padding(
                                                            //   padding:
                                                            //       const EdgeInsets
                                                            //               .only(
                                                            //           right: 8),
                                                            //   child: ClipRRect(
                                                            //     borderRadius:
                                                            //         BorderRadius
                                                            //             .circular(
                                                            //                 10),
                                                            //     child:
                                                            //         CachedNetworkImage(
                                                            //       height: 50,
                                                            //       width: 50,
                                                            //       imageUrl: projectprovider
                                                            //               .listofproject[
                                                            //                   index]
                                                            //               .roominfo!
                                                            //               .isEmpty
                                                            //           ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                            //           : projectprovider
                                                            //                   .listofproject[
                                                            //                       index]
                                                            //                   .roominfo!
                                                            //                   .first
                                                            //                   .feature!
                                                            //                   .isEmpty
                                                            //               ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                            //               : projectprovider
                                                            //                       .listofproject[
                                                            //                           index]
                                                            //                       .roominfo!
                                                            //                       .first
                                                            //                       .feature!
                                                            //                       .first
                                                            //                       .images!
                                                            //                       .isEmpty
                                                            //                   ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                            //                   : projectprovider
                                                            //                       .listofproject[index]
                                                            //                       .roominfo!
                                                            //                       .first
                                                            //                       .feature!
                                                            //                       .first
                                                            //                       .images!
                                                            //                       .first
                                                            //                       .toString(),
                                                            //       // placeholder: (context,
                                                            //       //         url) =>
                                                            //       //     CircularProgressIndicator(),
                                                            //       errorWidget: (context,
                                                            //               url,
                                                            //               error) =>
                                                            //           Image.network(
                                                            //               "https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75"),
                                                            //     ),
                                                            //     // Image(
                                                            //     //     height: 50,
                                                            //     //     width: 50,
                                                            //     //     image:
                                                            //     //      NetworkImage(
                                                            //     //       ),
                                                            //     //     fit: BoxFit
                                                            //     //         .fitWidth),
                                                            //   ),
                                                            // ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    'Project No : ' +
                                                                        projectprovider!
                                                                            .listofproject[
                                                                                widgetIndex]
                                                                            .projectId
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    )),
                                                                SizedBox(
                                                                    height: 5),
                                                                projectprovider!
                                                                        .listofproject[
                                                                            widgetIndex]
                                                                        .roominfo!
                                                                        .isEmpty
                                                                    ? Text(
                                                                        "No Data",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.grey,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ))
                                                                    : Text(
                                                                        'Room Name : ' +
                                                                            projectprovider!.listofproject[widgetIndex].roominfo!.first.roomName
                                                                                .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(height: 5),
                                                          SizedBox(
                                                            width: size.width,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  // width: size.width,
                                                                  decoration: BoxDecoration(
                                                                      // color:
                                                                      //     primaryColor,
                                                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                                                                  child: Text(
                                                                      "Customer Details :-",
                                                                      style: TextStyle(
                                                                          color:
                                                                              blackColor,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              18)),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          2.0,
                                                                      horizontal:
                                                                          8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Homeowners Name",
                                                                          value:
                                                                              "${projectprovider!.customerUserModel!.data!.firstName ?? ''} ${projectprovider!.customerUserModel!.data!.lastName ?? ''}"),
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Email Address",
                                                                          value:
                                                                              "${projectprovider!.customerUserModel!.data!.email ?? ""}"),
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Phone Number",
                                                                          value:
                                                                              "${projectprovider!.customerUserModel!.data!.phoneNumber ?? "Unknown"}"),
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Zip Code",
                                                                          value:
                                                                              "${projectprovider!.customerUserModel!.data!.zipCode ?? "Unknown"}"),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "Features",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: AppTheme
                                                                  .colorPrimary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          ListView.builder(
                                                            shrinkWrap: true,
                                                            padding: EdgeInsets.zero,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount: projectprovider!
                                                                .listofproject[
                                                                    widgetIndex]
                                                                .roominfo!
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            12.0),
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        " ${projectprovider!.listofproject[widgetIndex].roominfo![index].roomName}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              AppTheme.colorPrimary,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      ListView
                                                                          .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemCount: projectprovider!
                                                                            .listofproject[widgetIndex]
                                                                            .roominfo![index]
                                                                            .feature!
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                subIndex) {
                                                                          return Card(
                                                                            child:
                                                                                Theme(
                                                                              data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
                                                                              child: ExpansionTile(
                                                                                iconColor: primaryColor,
                                                                                childrenPadding: EdgeInsets.only(left: 15, bottom: 15),
                                                                                expandedAlignment: Alignment.topLeft,
                                                                                title: Text(projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureName!, style: TextStyle(color: AppTheme.colorPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                                                                                children: [
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].images == null || projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].images!.isEmpty
                                                                                          ? SizedBox()
                                                                                          : SizedBox(
                                                                                              height: 80,
                                                                                              child: ListView.builder(
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].images!.length,
                                                                                                itemBuilder: (context, expansionTileIndex) {
                                                                                                  return InkWell(
                                                                                                    onTap: () {
                                                                                                      Utils.imageInfoDialog(context: context, url: projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].images![expansionTileIndex], description: "");
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 80,
                                                                                                      height: 80,
                                                                                                      padding: const EdgeInsets.only(right: 3),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                                        child: Image.network(
                                                                                                          projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].images![expansionTileIndex],
                                                                                                          fit: BoxFit.fill,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                      projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureoption == null || projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureoption!.isEmpty
                                                                                          ? SizedBox()
                                                                                          : projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureoption != null
                                                                                              ? propertyDetailIteams(key: "Feature Option", value: projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureoption!)
                                                                                              : SizedBox(),
                                                                                      SizedBox(
                                                                                        height: 5,
                                                                                      ),
                                                                                      isEdit[widgetIndex][index][subIndex]
                                                                                          ? Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text("Comments :"),
                                                                                                SizedBox(height: 8),
                                                                                                CustomTextField(controller: _editCommetController[widgetIndex][index][subIndex], label: "Enter inspection notes"),
                                                                                              ],
                                                                                            )
                                                                                          : projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].inspectionNotes != null
                                                                                              ? propertyDetailIteams(key: "Comments", value: projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].inspectionNotes!)
                                                                                              : SizedBox(),
                                                                                      SizedBox(
                                                                                        height: 5,
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Center(
                                                                                            child: ElevatedButton(
                                                                                                style: ButtonStyle(backgroundColor: isEdit[widgetIndex][index][subIndex] ? MaterialStateProperty.all(saveColor) : MaterialStateProperty.all(editColor)),
                                                                                                onPressed: () async {
                                                                                                  for (int i = 0; i < projectprovider!.listofproject[widgetIndex].roominfo![index].feature!.length; i++) {
                                                                                                    if (i != subIndex) {
                                                                                                      isEdit[widgetIndex][index][i] = false;
                                                                                                    }
                                                                                                  }
                                                                                                  log("====fff    " + (widgetIndex).toString());
                                                                                                  isEdit[widgetIndex][index][subIndex] = !isEdit[widgetIndex][index][subIndex];
                                                                                                  if (!isEdit[widgetIndex][index][subIndex]) {
                                                                                                    isEdit[widgetIndex][index][subIndex] = !isEdit[widgetIndex][index][subIndex];
                                                                                                    isBtnLoading[widgetIndex][index][subIndex] = true;
                                                                                                    setState(() {});
                                                                                                    log("djxfjdlgjlfdj    " + isEdit[widgetIndex].toString());
                                                                                                    await projectprovider!.updateReport(data: {
                                                                                                      "inspectionNotes": _editCommetController[widgetIndex][index][subIndex].text,
                                                                                                      "feature_id": projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureId,
                                                                                                      "images": projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].images ?? <String>[]
                                                                                                    }, projectId: projectprovider!.listofproject[widgetIndex].projectId!).then((value) {
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${value["message"]}")));
                                                                                                    });
                                                                                                    await ref.read(customernotifier).myproject();
                                                                                                    loadData(widgetIndex);

                                                                                                    log("djxfjdlgjlfdj    " + isEdit[widgetIndex].toString());

                                                                                                    isBtnLoading[widgetIndex][index][subIndex] = false;
                                                                                                    isEdit[widgetIndex][index][subIndex] = false;
                                                                                                  }

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: isBtnLoading[widgetIndex][index][subIndex]
                                                                                                    ? SizedBox(
                                                                                                        height: 25,
                                                                                                        width: 25,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          color: lightColor,
                                                                                                        ))
                                                                                                    : Row(
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            isEdit[widgetIndex][index][subIndex] ? Icons.save : Icons.edit,
                                                                                                            size: 18,
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            width: 8,
                                                                                                          ),
                                                                                                          Text(isEdit[widgetIndex][index][subIndex] ? "Save" : "Edit"),
                                                                                                        ],
                                                                                                      )),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 15,
                                                                                          ),
                                                                                          Center(
                                                                                            child: ElevatedButton(
                                                                                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                                                                                                onPressed: () async {
                                                                                                  isDeleteBtnLoading[widgetIndex][index][subIndex] = true;
                                                                                                  setState(() {});
                                                                                                  var data = {
                                                                                                    "inspectionNotes": "",
                                                                                                    "feature_id": projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureId,
                                                                                                    "images": <String>[]
                                                                                                  };
                                                                                                  log("gsdjjsdfjhf === $data");
                                                                                                  await projectprovider!.updateReport(data: {
                                                                                                    "inspectionNotes": "",
                                                                                                    "feature_id": projectprovider!.listofproject[widgetIndex].roominfo![index].feature![subIndex].featureId,
                                                                                                    "images": <String>[]
                                                                                                  }, projectId: projectprovider!.listofproject[widgetIndex].projectId!).then((value) {
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${value["message"]}")));
                                                                                                  });
                                                                                                  await ref.read(customernotifier).myproject();
                                                                                                  loadData(widgetIndex);
                                                                                                  isEdit[widgetIndex][index][subIndex] = false;

                                                                                                  isDeleteBtnLoading[widgetIndex][index][subIndex] = false;
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: isDeleteBtnLoading[widgetIndex][index][subIndex]
                                                                                                    ? SizedBox(
                                                                                                        height: 25,
                                                                                                        width: 25,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          color: lightColor,
                                                                                                        ))
                                                                                                    : Row(
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.delete,
                                                                                                            size: 18,
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            width: 8,
                                                                                                          ),
                                                                                                          Text("Delete"),
                                                                                                        ],
                                                                                                      )),
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerHomepage(),
                                            ));
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
                                                  color: lightColor
                                                      .withOpacity(.9),
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          );
  }

  Widget propertyDetailIteams({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$key : ",
            style: TextStyle(color: secondaryTextColor),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Text(value,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}

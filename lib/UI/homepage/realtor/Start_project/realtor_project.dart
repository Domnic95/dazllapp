import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/customTextfield.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/start_project.dart';
import 'package:dazllapp/UI/homepage/realtor/realtor_homepage.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Realtor_project extends ConsumerStatefulWidget {
  Realtor_project({Key? key}) : super(key: key);
  @override
  ConsumerState<Realtor_project> createState() => _Realtor_projectState();
}

class _Realtor_projectState extends ConsumerState<Realtor_project> {
  bool loading = true;
  void initState() {
    super.initState();
    load();
  }

  bool isLoading = true;
  List<List<List<bool>>> isBtnLoading = [];
  List<List<List<bool>>> isDeleteBtnLoading = [];
  List<List<List<TextEditingController>>> _editCommetController = [];
  List<List<List<bool>>> isEdit = [];

  // bool isLoading = true;
  // CustomerNotifier? projectprovider;
  // List<List<List<bool>>> isBtnLoading = [];
  // List<List<List<bool>>> isDeleteBtnLoading = [];
  void loadData(index) async {
    // await projectprovider!.setCustomerModel();
    for (int i = 0;
        i < projectprovider!.listofrealtorproject[index].roominfo!.length;
        i++) {
      for (int j = 0;
          j <
              projectprovider!
                  .listofrealtorproject[index].roominfo![i].feature!.length;
          j++) {
        // _editCommetController.add(TextEditingController(
        //     text: projectprovider!.listofrealtorproject[index].roominfo![i].feature![j]
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

  @override
  void dispose() {
    // TODO: implement dispose
    images.clear();
    super.dispose();
  }

  bool edit = false;

  List<List<List<List<String>>>> images = [];
  RealtorNotifier? projectprovider;
  load() async {
    await ref.read(realtorprovider).getrealtorproject(context);
    projectprovider = ref.read(realtorprovider);
    final Detailsprovider = ref.read(realtorprovider);

    // projectprovider = ref.read(customernotifier);
    // await ref.read(customernotifier).setCustomerModel();

    images = List.generate(
      projectprovider!.listofrealtorproject.length,
      (_) => [],
    );

    for (var index = 0;
        index < projectprovider!.listofrealtorproject.length;
        index++) {
      _editCommetController.add([]);
      isEdit.add([]);
      isBtnLoading.add([]);
      isDeleteBtnLoading.add([]);
      // projectprovider!.images!.add([]);
      images[index] = List.generate(
        projectprovider!.listofrealtorproject[index].roominfo!.length,
        (_) => [],
      );

      // projectprovider!.listofrealtorproject[index].roominfo!.isEmpty
      //     ? _editCommetController[index][0].add(TextEditingController(text: ""))
      //     : null;
      for (int i = 0;
          i < projectprovider!.listofrealtorproject[index].roominfo!.length;
          i++) {
        _editCommetController[index].add([]);
        isEdit[index].add([]);
        isBtnLoading[index].add([]);
        isDeleteBtnLoading[index].add([]);
        // projectprovider!.images![index].add([]);
        images[index][i] = List.generate(
          projectprovider!
              .listofrealtorproject[index].roominfo![i].feature!.length,
          (_) => [],
        );

        for (int j = 0;
            j <
                projectprovider!
                    .listofrealtorproject[index].roominfo![i].feature!.length;
            j++) {
          // log("---->.>.> " + i.toString());

          _editCommetController[index][i].add(TextEditingController(
              text: projectprovider!.listofrealtorproject[index].roominfo![i]
                  .feature![j].inspectionNotes));

          isEdit[index][i].add(false);
          isBtnLoading[index][i].add(false);
          isDeleteBtnLoading[index][i].add(false);

          for (int k = 0;
              k <
                  projectprovider!.listofrealtorproject[index].roominfo![i]
                      .feature![j].images!.length;
              k++) {
            // Ensure the element is a String
            String image = Detailsprovider.listofrealtorproject[index]
                .roominfo![i].feature![j].images![k] as String;

            // Add the image to the correct place in the list
            images[index][i][j].add(image);
          }
        }
      }
    }
    //  log("isedit " + isEdit.toString());

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _realtorprovider = ref.watch(realtorprovider);
    // log("length ${_realtorprovider.listofrealtorproject.length}");
    final Detailsprovider = ref.read(realtorprovider);
    return loading
        ? LoadingWidget()
        : WillPopScope(
            onWillPop: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RealtorHomePage(),
                  ));
              return false;
            },
            child: Scaffold(
              body:
                  // _realtorprovider.listofrealtorproject.isEmpty
                  //     ? Center(child: Text("No Project Found"))
                  //     :
                  Container(
                child: Column(
                  children: [
                    CommonHeader(title: "My Project", isback: false),
                    _realtorprovider.listofrealtorproject.isEmpty
                        ? Expanded(
                            child: Center(child: Text("No Project Found")))
                        : Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                reverse: true,
                                itemCount: _realtorprovider
                                    .listofrealtorproject.length,
                                itemBuilder:
                                    (BuildContext context, int widgetIndex) {
                                  return _realtorprovider
                                          .listofrealtorproject[widgetIndex]
                                          .roominfo!
                                          .isEmpty
                                      ? Column(
                                        children: [
                                           SizedBox(height: 10,),
                                          Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                      SizedBox(height: 20,),
                                                       Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          // width: 300,
                                                          margin: EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5),
                                                            color: primaryColor,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(5),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => Start_project(
                                                                        projectid: projectprovider!
                                                                            .listofrealtorproject[
                                                                                widgetIndex]
                                                                            .projectId!
                                                                            .toString(),
                                                                        customer:
                                                                            false),
                                                                  ),
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize.min,
                                                                children: [
                                                                  Text(
                                                                      " Add Another Room ",
                                                                      style: TextStyle(
                                                                          color: AppTheme
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontSize:
                                                                              14)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          // width: 300,
                                                          margin: EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5),
                                                            color: primaryColor,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(5),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                setState(() {});
                                                                // await projectprovider!.deletePhdReport(
                                                                //     projectprovider!
                                                                //         .listofrealtorproject[
                                                                //             widgetIndex]
                                                                //         .projectId!,
                                                                //     context);
                                                                deleteProjectDilouge(
                                                                    context,
                                                                    projectprovider!
                                                                        .listofrealtorproject[
                                                                            widgetIndex]
                                                                        .projectId!);
                                                                // await load();
                                              
                                                                setState(() {});
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize.min,
                                                                children: [
                                                                  Text(
                                                                      " Delete Project ",
                                                                      style: TextStyle(
                                                                          color: AppTheme
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  Icon(
                                                                    Icons.delete,
                                                                    color:
                                                                        AppTheme.white,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                 SizedBox(height: 10,),
                                                  Text("  Project No : ${_realtorprovider
                                          .listofrealtorproject[widgetIndex].projectId}",style: TextStyle(color: blackColor,fontWeight: FontWeight.normal,fontSize: 16),),
                                                         
                                                    Card(child: Padding(
                                                      padding: const EdgeInsets.all(20),
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                          Text("Service Pro Replies:",style: TextStyle(color: primaryColor,fontWeight: FontWeight.normal,fontSize: 16),),
                                                          Text("You have 0 replies",style: TextStyle(color: blackColor,fontWeight: FontWeight.normal,fontSize: 16),),
                                                        ],),
                                                      ),
                                                    )),
                                                      SizedBox(height: 10,),
                                                  ],
                                                ),
                                            ),
                                          ),
                               
                                        ],
                                      )

                                  
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  // width: 300,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: primaryColor,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => Start_project(
                                                                projectid: projectprovider!
                                                                    .listofrealtorproject[
                                                                        widgetIndex]
                                                                    .projectId!
                                                                    .toString(),
                                                                customer:
                                                                    false),
                                                          ),
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              " Add Another Room ",
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // width: 300,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: primaryColor,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() {});
                                                        // await projectprovider!.deletePhdReport(
                                                        //     projectprovider!
                                                        //         .listofrealtorproject[
                                                        //             widgetIndex]
                                                        //         .projectId!,
                                                        //     context);
                                                        deleteProjectDilouge(
                                                            context,
                                                            projectprovider!
                                                                .listofrealtorproject[
                                                                    widgetIndex]
                                                                .projectId!);
                                                        // await load();

                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              " Delete Project ",
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14)),
                                                          Icon(
                                                            Icons.delete,
                                                            color:
                                                                AppTheme.white,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                // height: 80,
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
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          8),
                                                          title: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
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
                                                                          _realtorprovider
                                                                              .listofrealtorproject[
                                                                                  widgetIndex]
                                                                              .projectId
                                                                              .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color:
                                                                            lightColor,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  _realtorprovider
                                                                          .listofrealtorproject[
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
                                                                              _realtorprovider.listofrealtorproject[widgetIndex].roominfo!.first.roomName.toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                lightColor,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            // width: size.width,
                                                            decoration:
                                                                BoxDecoration(
                                                                    // color: primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.vertical(
                                                                            top:
                                                                                Radius.circular(10))),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Customer Details :- ",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                // InkWell(
                                                                //   onTap:
                                                                //       () async {
                                                                //     setState(
                                                                //         () {});
                                                                //     // await projectprovider!.deletePhdReport(
                                                                //     //     projectprovider!
                                                                //     //         .listofrealtorproject[
                                                                //     //             widgetIndex]
                                                                //     //         .projectId!,
                                                                //     //     context);
                                                                //     deleteProjectDilouge(
                                                                //         context,
                                                                //         projectprovider!
                                                                //             .listofrealtorproject[widgetIndex]
                                                                //             .projectId!);
                                                                //     // await load();

                                                                //     setState(
                                                                //         () {});
                                                                //   },
                                                                //   child: Row(
                                                                //     children: [
                                                                //       Text(
                                                                //           "Delete Project ",
                                                                //           style: TextStyle(
                                                                //               color: primaryColor,
                                                                //               fontWeight: FontWeight.bold,
                                                                //               fontSize: 16)),
                                                                //       Icon(
                                                                //         Icons
                                                                //             .delete,
                                                                //         color:
                                                                //             primaryColor,
                                                                //       )
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10.0,
                                                                    vertical:
                                                                        4.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                propertyDetailIteams(
                                                                    key:
                                                                        "Homeowners Name",
                                                                    value:
                                                                        "${Detailsprovider.listofrealtorproject[widgetIndex].customer!.firstName} ${Detailsprovider.listofrealtorproject[widgetIndex].customer!.lastName}"),
                                                                propertyDetailIteams(
                                                                    key:
                                                                        "Email Address",
                                                                    value:
                                                                        "${Detailsprovider.listofrealtorproject[widgetIndex].customer!.email}"),
                                                                propertyDetailIteams(
                                                                    key:
                                                                        "Phone Number",
                                                                    value:
                                                                        "${Detailsprovider.listofrealtorproject[widgetIndex].customer?.phoneNumber ?? "Unknown"}"),
                                                                propertyDetailIteams(
                                                                    key:
                                                                        "Zip Code",
                                                                    value:
                                                                        "${Detailsprovider.listofrealtorproject[widgetIndex].customer?.zipCode ?? "Unknown"}"),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Center(
                                                            child: Text(
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
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          ListView.builder(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.0,
                                                                    vertical:
                                                                        10.0),
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: Detailsprovider
                                                                .listofrealtorproject[
                                                                    widgetIndex]
                                                                .roominfo!
                                                                .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Container(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].roomName}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: AppTheme
                                                                            .colorPrimary,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    ListView
                                                                        .builder(
                                                                      shrinkWrap:
                                                                          true,
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      physics:
                                                                          NeverScrollableScrollPhysics(),
                                                                      itemCount: Detailsprovider
                                                                          .listofrealtorproject[
                                                                              widgetIndex]
                                                                          .roominfo![
                                                                              index]
                                                                          .feature!
                                                                          .length,
                                                                      itemBuilder:
                                                                          (BuildContext context,
                                                                              int subindex) {
                                                                        return Card(
                                                                          child:
                                                                              Theme(
                                                                            data:
                                                                                Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
                                                                            child:
                                                                                ExpansionTile(
                                                                              iconColor: primaryColor,
                                                                              childrenPadding: EdgeInsets.only(left: 15, bottom: 15),
                                                                              expandedAlignment: Alignment.topLeft,
                                                                              title: Text(Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureName!, style: TextStyle(color: AppTheme.colorPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                                                                              children: [
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (!isEdit[widgetIndex][index][subindex])
                                                                                      Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].images!.length == 0
                                                                                          ? SizedBox()
                                                                                          : SizedBox(
                                                                                              height: 80,
                                                                                              child: ListView.builder(
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].images!.length,
                                                                                                itemBuilder: (context, imgindex) {
                                                                                                  return InkWell(
                                                                                                    onTap: () {
                                                                                                      Utils.imageInfoDialog(context: context, url: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].images![imgindex], description: "");
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 100,
                                                                                                      height: 100,

                                                                                                      padding: const EdgeInsets.only(right: 10),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                                        child: CachedNetworkImage(errorWidget: (context, url, error) => Image.asset("assets/images/noimage.png"), imageUrl: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].images![imgindex],fit: BoxFit.cover,),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                    if (isEdit[widgetIndex][index][subindex])
                                                                                      Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].images == File('').toString()
                                                                                          ? SizedBox()
                                                                                          : GridView.builder(
                                                                                              padding: EdgeInsets.zero,
                                                                                              physics: NeverScrollableScrollPhysics(),
                                                                                              shrinkWrap: true,
                                                                                              itemCount: (images[widgetIndex][index][subindex].length) + 1, // Include "Add Photo" button
                                                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                crossAxisCount: 4,
                                                                                                crossAxisSpacing: 4.0,
                                                                                                mainAxisSpacing: 4.0,
                                                                                              ),
                                                                                              itemBuilder: (context, subIndex) {
                                                                                                if (subIndex == 0) {
                                                                                                  // Add photo button
                                                                                                  return Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      border: Border.all(color: Colors.black),
                                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                                    ),
                                                                                                    child: IconButton(
                                                                                                      onPressed: () {
                                                                                                        showOptionsDialog(context, widgetIndex, index, subindex, subIndex);
                                                                                                      },
                                                                                                      icon: Icon(Icons.add_a_photo),
                                                                                                    ),
                                                                                                  );
                                                                                                }

                                                                                                // Display existing images
                                                                                                String image = images[widgetIndex][index][subindex][subIndex - 1];
                                                                                                if (image.isEmpty) {
                                                                                                  return SizedBox();
                                                                                                }

                                                                                                return Container(
                                                                                                  height: 100,
                                                                                                   width: 100,
                                                                                                  decoration: BoxDecoration(
                                                                                                    border: Border.all(color: Colors.black),
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                
                                                                                                  ),
                                                                                                  child: Stack(
                                                                                                    alignment: Alignment.center,
                                                                                                    children: [
                                                                                                      ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                        child: CachedNetworkImage(
                                                                                                          imageUrl: image,
                                                                                                          height: 100,
                                                                                                          width: 100,
                                                                                                          placeholder: (context, url) => CircularProgressIndicator(),
                                                                                                          errorWidget: (context, url, error) => Image.asset("assets/images/noimage.png"),
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Positioned(
                                                                                                        top: -10,
                                                                                                        right: -5,
                                                                                                        child: IconButton(
                                                                                                          onPressed: () {
                                                                                                            setState(() {
                                                                                                              images[widgetIndex][index][subindex].removeAt(subIndex - 1);
                                                                                                            });
                                                                                                          },
                                                                                                          icon: Icon(
                                                                                                            Icons.cancel,
                                                                                                            size: 25,
                                                                                                            color: AppTheme.white,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),

                                                                                    Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureoption!.isNotEmpty ? propertyDetailIteams(key: "Feature Option ", value: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureoption!) : SizedBox(),

                                                                                    SizedBox(
                                                                                      height: 5,
                                                                                    ),
                                                                                    isEdit[widgetIndex][index][subindex]
                                                                                        ? Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text("Comments :"),
                                                                                              SizedBox(height: 8),
                                                                                              CustomTextField(controller: _editCommetController[widgetIndex][index][subindex], label: "Enter inspection notes"),
                                                                                            ],
                                                                                          )
                                                                                        : projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].inspectionNotes != null
                                                                                            ? propertyDetailIteams(key: "Project Notes ", value: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].inspectionNotes!)
                                                                                            : SizedBox(),

                                                                                    // propertyDetailIteams(key: "Project Notes ", value: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].inspectionNotes!),

                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Center(
                                                                                          child: ElevatedButton(
                                                                                              style: ButtonStyle(backgroundColor: isEdit[widgetIndex][index][subindex] ? MaterialStateProperty.all(saveColor) : MaterialStateProperty.all(editColor)),
                                                                                              onPressed: () async {
                                                                                                for (int i = 0; i < projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].feature!.length; i++) {
                                                                                                  if (i != subindex) {
                                                                                                    isEdit[widgetIndex][index][i] = false;
                                                                                                  }
                                                                                                }
                                                                                                log("====fff    " + (widgetIndex).toString());
                                                                                                isEdit[widgetIndex][index][subindex] = !isEdit[widgetIndex][index][subindex];

                                                                                                if (!isEdit[widgetIndex][index][subindex]) {
                                                                                                  isEdit[widgetIndex][index][subindex] = !isEdit[widgetIndex][index][subindex];
                                                                                                  isBtnLoading[widgetIndex][index][subindex] = true;
                                                                                                  setState(() {});
                                                                                                  log("djxfjdlgjlfdj    " + images[widgetIndex][index][subindex].toString());
                                                                                                  log("room id    " + projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].roomId.toString());
                                                                                                  await projectprovider!.updateprojectrealtor({
                                                                                                    "inspectionNotes": _editCommetController[widgetIndex][index][subindex].text,
                                                                                                    "feature_id": projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureId,
                                                                                                    "images": images[widgetIndex][index][subindex].isEmpty ? [] : images[widgetIndex][index][subindex],
                                                                                                    "room_id": projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].roomId.toString()
                                                                                                  },
                                                                                                  
                                                                                                      // {
                                                                                                      //   'data': [
                                                                                                      //     {
                                                                                                      //       "inspectionNotes": _editCommetController[widgetIndex][index][subindex].text,
                                                                                                      //       "feature_id": projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureId,
                                                                                                      //       "images": images[widgetIndex][index][subindex].isEmpty ? [] : images[widgetIndex][index][subindex],
                                                                                                      //       "roomId": projectprovider!.listofrealtorproject[widgetIndex].roominfo![index].roomId.toString()
                                                                                                      //     }
                                                                                                      //   ],
                                                                                                      //   "name": "",
                                                                                                      //   'projectID': projectprovider!.listofrealtorproject[widgetIndex].projectId.toString()
                                                                                                      // },

                                                                                                      //  projectId: projectprovider!.listofrealtorproject[widgetIndex].projectId!).then((value) {
                                                                                                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("${value["message"]}")));
                                                                                                      // }
                                                                                                      projectprovider!.listofrealtorproject[widgetIndex].projectId!,


                                                                                                      
                                                                                                      );
                                                                                                  // await ref.read(realtorprovider).getrealtorproject(context);
                                                                                                  load();

                                                                                                  log("isEdit    " + isEdit[widgetIndex].toString());

                                                                                                  isBtnLoading[widgetIndex][index][subindex] = false;
                                                                                                  isEdit[widgetIndex][index][subindex] = false;
                                                                                                }

                                                                                                setState(() {});
                                                                                              },
                                                                                              child: isBtnLoading[widgetIndex][index][subindex]
                                                                                                  ? SizedBox(
                                                                                                      height: 25,
                                                                                                      width: 25,
                                                                                                      child: CircularProgressIndicator(
                                                                                                        color: lightColor,
                                                                                                      ))
                                                                                                  : Row(
                                                                                                      children: [
                                                                                                        Icon(
                                                                                                          isEdit[widgetIndex][index][subindex] ? Icons.save : Icons.edit,
                                                                                                          color: lightColor,
                                                                                                          size: 18,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: 8,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          isEdit[widgetIndex][index][subindex] ? "Save" : "Edit",
                                                                                                          style: TextStyle(
                                                                                                            color: lightColor,
                                                                                                            fontWeight: FontWeight.w700,
                                                                                                          ),
                                                                                                        ),
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
                                                                                                //     isDeleteBtnLoading[widgetIndex][index][subindex] = true;
                                                                                                //           setState(() {});
                                                                                                //   await projectprovider!.deletePhdReport(projectprovider!.listofrealtorproject[widgetIndex].projectId!, context);
                                                                                                //  await load();
                                                                                                isEdit[widgetIndex][index][subindex] = false;

                                                                                                //         isDeleteBtnLoading[widgetIndex][index][subindex] = false;
                                                                                                // setState(() {});
                                                                                              },
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.delete,
                                                                                                    color: lightColor,
                                                                                                    size: 18,
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 8,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    "Delete",
                                                                                                    style: TextStyle(
                                                                                                      color: lightColor,
                                                                                                      fontWeight: FontWeight.w700,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                    // propertyDetailIteams(key: "Inspection Notes : ", value: Detailsprovider
                                                                                    //           .listofrealtorproject[
                                                                                    //               widget.index]
                                                                                    //           .roominfo![index]
                                                                                    //           .feature![subindex]
                                                                                    //           .inspectionNotes!),
                                                                                    // Text(
                                                                                    //   "Issue text : " +
                                                                                    //       Detailsprovider
                                                                                    //           .listofrealtorproject[
                                                                                    //               widget.index]
                                                                                    //           .roominfo![index]
                                                                                    //           .feature![subindex]
                                                                                    //           .featureissue!,
                                                                                    // )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RealtorHomePage(),
                                    ),
                                    (route) => false,
                                  );
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

  Future<void> showOptionsDialog(BuildContext context, int widgetindex,
      int index, int subIndex, int subindex) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Select Option",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * .08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 40,
                        ),
                        Text('Camera')
                      ],
                    ),
                    onTap: () {
                      openCamera(widgetindex, index, subIndex, subindex);
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo,
                          size: 40,
                        ),
                        Text('Gallery')
                      ],
                    ),
                    onTap: () {
                      openGallery(widgetindex, index, subindex, subindex);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  late var imgCamera;
  void openCamera(
      int widgetIndex, int index, int subIndex, int subSubIndex) async {
    // Pick an image from the camera
    imgCamera =
        await projectprovider!.imgPicker.pickImage(source: ImageSource.camera);

    if (imgCamera != null) {
      Navigator.of(context).pop();
      await photocamera(widgetIndex, index, subIndex, subSubIndex);
    }
  }

  late var imgGallery;

  // Declare imgCamera as a field (if used)

  void openGallery(
      int widgetIndex, int index, int subIndex, int subSubIndex) async {
    // Pick an image from the gallery
    imgGallery =
        await projectprovider!.imgPicker.pickImage(source: ImageSource.gallery);

    if (imgGallery != null) {
      Navigator.of(context).pop();
      await textphoto(widgetIndex, index, subIndex, subSubIndex);
    }
  }

  Future<void> textphoto(
      int widgetIndex, int index, int subIndex, int subSubIndex) async {
    Utils.loaderDialog(context, true);

    if (imgGallery == null) {
      Utils.loaderDialog(context, false);
      toastShowError(context, 'Please add a photo!');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Please add a photo!')),
      // );
      return;
    }

    try {
      // Upload the image and get the URL
      String image =
          await projectprovider!.getImage1(context, File(imgGallery.path), ref);

      // Add the image URL to the images list
      if (images.length > widgetIndex &&
          images[widgetIndex].length > index &&
          images[widgetIndex][index].length > subIndex) {
        images[widgetIndex][index][subIndex].add(image);
      }

      imgGallery = null;
    } catch (e) {
      print('Error uploading image from gallery: $e');
    }

    Utils.loaderDialog(context, false);
    setState(() {});
  }

  Future<void> photocamera(
      int widgetIndex, int index, int subIndex, int subSubIndex) async {
    Utils.loaderDialog(context, true);

    if (imgCamera == null) {
      Utils.loaderDialog(context, false);
      toastShowError(context, 'Please add a photo!');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Please add a photo!')),
      // );
      return;
    }

    try {
      // Upload the image and get the URL
      String image =
          await projectprovider!.getImage1(context, File(imgCamera.path), ref);

      // Add the image URL to the images list
      if (images.length > widgetIndex &&
          images[widgetIndex].length > index &&
          images[widgetIndex][index].length > subIndex) {
        images[widgetIndex][index][subIndex].add(image);
      }

      imgCamera = null;
    } catch (e) {
      print('Error uploading image from camera: $e');
    }

    Utils.loaderDialog(context, false);
    setState(() {});
  }

  deleteProjectDilouge(BuildContext context, int projectId) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete Projesct',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Are you sure you want to delete this project ?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actionsPadding: EdgeInsets.all(8),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () async {
              await projectprovider!.deletePhdReport(projectId, context);
              await load();
              setState(() {});
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => RealtorHomePage(),
                ),
                (route) => false,
              );
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

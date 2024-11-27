import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/customTextfield.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/professional_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/model/Professional/projectOppourtunites.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class ProjectOpportunities extends ConsumerStatefulWidget {
  const ProjectOpportunities({Key? key}) : super(key: key);

  @override
  ConsumerState<ProjectOpportunities> createState() =>
      _ProjectOpportunitiesState();
}

class _ProjectOpportunitiesState extends ConsumerState<ProjectOpportunities> {
  ProfessionalNotifier? _professionalNotifier;
  bool isLoading = true;
  bool? isInterested = false;
  TextEditingController _controller = TextEditingController();
  final PagingController<int, Final> pagingController =
      PagingController(firstPageKey: 1);
  @override
  void initState() {
    _professionalNotifier = ref.read(professionaltifier);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    load();
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      // if (pageKey == 1) {
      //   isLoading = true;
      //   if (mounted) {
      //     setState(() {});
      //   }
      // }
      List<Final> projectList =
          await _professionalNotifier!.getProjectOpportunitiesWithPagination(
        pageKey,
      );
      final isLastPage = _professionalNotifier!.projectList.length >
          _professionalNotifier!.pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(projectList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(projectList, nextPageKey);
      }
      // isLoading = false;
      // if (pageKey == 1) {
      //   isLoading = false;
      //   if (mounted) {
      //     setState(() {});
      //   }
      // }
    } catch (error) {
      print("error --> $error");
      pagingController.error = error;
    }
  }

  void load() async {
    isLoading = true;
    if (mounted) {
      setState(() {});
    }
    await _professionalNotifier!.getProjectOpportunities();
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  void showDialogeForSendResponse(
      {required int customerId,
      required int projectId,
      required String email,
      required String homeOwnerName}) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, dialogeState) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Your Response",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                visualDensity: VisualDensity.compact,
                                splashRadius: 5,
                                value: isInterested ?? false,
                                onChanged: (value) {
                                  isInterested = value;
                                  dialogeState(() {});
                                },
                              ),
                              Text("I'M INTERESTED"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                splashRadius: 5,
                                visualDensity: VisualDensity.compact,
                                value: isInterested == null
                                    ? false
                                    : !isInterested!,
                                onChanged: (value) {
                                  isInterested = !value!;
                                  dialogeState(() {});
                                },
                              ),
                              Text("I'M NOT INTERESTED"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  Message :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextField(
                        minLine: 5, controller: _controller, label: ""),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty &&
                            isInterested != null) {
                          _professionalNotifier!.sendProjectOpportunities({
                            "homeOwnerMail": email,
                            "homeOwnerName": homeOwnerName,
                            'isInterested': isInterested,
                            'projectId': projectId,
                            'message': _controller.text,
                            // 'interest_date':
                            //     DateFormat("yyyy-MM-dd").format(DateTime.now()),
                            // 'customer_id': customerId,
                            // 'professional_id':
                            //     SpHelpers.getString(SharedPrefsKeys.Prof_id)
                          }).then((value) {
                            if (value != null) {
                              Navigator.of(context).pop();
                              toastShowSuccess(
                                  context, 'message send succefully');
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //         content:
                              //             Text('message send succefully')));
                            } else {
                              toastShowError(
                                  context, "Something went to wrong!");
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //         content:
                              //             Text("Something went to wrong!")));
                            }
                          });
                        } else if (isInterested == null) {
                          toastShowError(context,
                              "Please select you are interested or not");
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text(
                          //         "Please select you are interested or not")));
                        } else if (_controller.text.isEmpty) {
                          toastShowError(context, "Message is reqired");
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text("Message is reqired")));
                        }
                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Send",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor)),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.send,
                              color: primaryColor,
                            )
                          ]))
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget propertyDetailIteams({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$key :",
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

  @override
  Widget build(BuildContext context) {
    _professionalNotifier = ref.watch(professionaltifier);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? LoadingWidget()
          : Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonHeader(title: "Project Opportunities", isback: false),
                SizedBox(
                  height: 8,
                ),
                Text("WASHINGTON, SUITE 103 64105",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: blackColor.withOpacity(0.5))),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () =>
                        Future.sync(() => pagingController.refresh()),
                    child: PagedListView<int, Final>(
                      physics: ScrollPhysics(),
                      pagingController: pagingController,
                      shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate<Final>(
                        itemBuilder: (context, item, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}. Project No: ${item.projectId}",
                                      style: TextStyle(
                                          color: lightColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (item.createdAt != null)
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            "Created At: ",
                                                            style: TextStyle(
                                                                height: 2,
                                                                color: AppTheme
                                                                    .darkText),
                                                          ),
                                                        ),
                                                        Text(
                                                          "${f.format(item.createdAt!)}",
                                                          style: TextStyle(
                                                              color: AppTheme
                                                                  .colorPrimary),
                                                        ),
                                                      ],
                                                    ),
                                                  if (item.createdAt != null)
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  if (item.customer!.house!
                                                      .location.isNotEmpty)
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            "Location: ",
                                                            style: TextStyle(
                                                                height: 2,
                                                                color: AppTheme
                                                                    .darkText),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                              "${item.customer!.house!.location}",
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .colorPrimary),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      ],
                                                    ),
                                                  if (item.customer!.house!
                                                      .location.isNotEmpty)
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  if (item.customer!.firstName!
                                                          .isNotEmpty ||
                                                      item.customer!.lastName!
                                                          .isNotEmpty)
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            "Homeowners Name: ",
                                                            style: TextStyle(
                                                                height: 2,
                                                                color: AppTheme
                                                                    .darkText),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 150,
                                                            child: Text(
                                                              "${item.customer!.firstName} ${item.customer!.lastName}",
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .colorPrimary),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      ],
                                                    ),
                                                  if (item.customer!.firstName!
                                                          .isNotEmpty ||
                                                      item.customer!.lastName!
                                                          .isNotEmpty)
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  if (item.customer!.email!
                                                      .isNotEmpty)
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            "Email Address: ",
                                                            style: TextStyle(
                                                                height: 2,
                                                                color: AppTheme
                                                                    .darkText),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 150,
                                                            child: Text(
                                                              "${item.customer!.email}",
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .colorPrimary),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      ],
                                                    ),
                                                  if (item.customer!.email!
                                                      .isNotEmpty)
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () async{
                                               await   deleteProjectDilouge(context,item.projectId!);
                                             
                                                Navigator.pop(context);
                                             
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: primaryColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: item.roominfo!.length,
                                        itemBuilder: (context, subIndex) {
                                          return Card(
                                            child: ExpansionTile(
                                              iconColor: primaryColor,
                                              childrenPadding: EdgeInsets.only(
                                                  left: 15, bottom: 15),
                                              expandedAlignment:
                                                  Alignment.topLeft,
                                              title: Text(
                                                  item.roominfo![subIndex]
                                                      .roomName!,
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.colorPrimary,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              children: [
                                                ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: item
                                                      .roominfo![subIndex]
                                                      .feature!
                                                      .length,
                                                  itemBuilder:
                                                      (context, subIndex2) {
                                                    return Column(
                                                      children: [
                                                        if (item
                                                                .roominfo![
                                                                    subIndex]
                                                                .feature![0]
                                                                .featureName !=
                                                            '')
                                                          Theme(
                                                            data: Theme.of(context).copyWith(
                                                                colorScheme: ColorScheme
                                                                        .fromSwatch()
                                                                    .copyWith(
                                                                        secondary:
                                                                            Colors.black)),
                                                            child:
                                                                ExpansionTile(
                                                              iconColor:
                                                                  primaryColor,
                                                              childrenPadding:
                                                                  EdgeInsets.only(
                                                                      left: 15,
                                                                      right: 15,
                                                                      bottom:
                                                                          15),
                                                              expandedAlignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              title: Text(
                                                                  item
                                                                      .roominfo![
                                                                          subIndex]
                                                                      .feature![
                                                                          subIndex2]
                                                                      .featureName!,
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .colorPrimary,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    item.roominfo![subIndex].feature![subIndex2].images ==
                                                                                null ||
                                                                            item.roominfo![subIndex].feature![subIndex2].images!.length ==
                                                                                0
                                                                        ? SizedBox()
                                                                        : SizedBox(
                                                                            height:
                                                                                80,
                                                                            child:
                                                                                ListView.builder(
                                                                              physics: NeverScrollableScrollPhysics(),
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: item.roominfo![subIndex].feature![subIndex2].images!.length,
                                                                              itemBuilder: (context, imgindex) {
                                                                                return InkWell(
                                                                                  onTap: () {
                                                                                    Utils.imageInfoDialog(context: context, url: item.roominfo![subIndex].feature![subIndex2].images![imgindex], description: "");
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 80,
                                                                                    height: 80,
                                                                                    padding: EdgeInsets.only(right: 3),
                                                                                    child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                        child: CachedNetworkImage(
                                                                                          errorWidget: (context, url, error) => SizedBox(),
                                                                                          imageUrl: item.roominfo![subIndex].feature![subIndex2].images![imgindex],
                                                                                        )),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                    propertyDetailIteams(
                                                                        key:
                                                                            "Feature Option ",
                                                                        value: item
                                                                            .roominfo![subIndex]
                                                                            .feature![subIndex2]
                                                                            .featureoption!),

                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    // ListView.builder(
                                                                    //   shrinkWrap: true,
                                                                    //   itemCount: Detailsprovider
                                                                    //       .listofrealtorproject[
                                                                    //           widget.index]
                                                                    //       .roominfo![index]
                                                                    //       .feature![subindex]
                                                                    //       .featureissue!
                                                                    //       .length,
                                                                    //   itemBuilder: (BuildContext context,
                                                                    //       int subsubindex) {
                                                                    //     return Column(
                                                                    //       crossAxisAlignment:
                                                                    //           CrossAxisAlignment.start,
                                                                    //       children: [
                                                                    //         Text("Feature Issue ${subsubindex + 1} : " +
                                                                    //             Detailsprovider
                                                                    //                 .listofrealtorproject[
                                                                    //                     widget.index]
                                                                    //                 .roominfo![index]
                                                                    //                 .feature![subindex]
                                                                    //                 .featureissue![
                                                                    //                     subsubindex]
                                                                    //                 .name),
                                                                    //         SizedBox(
                                                                    //           height: 5,
                                                                    //         )
                                                                    //       ],
                                                                    //     );
                                                                    //   },
                                                                    // ),
                                                                    propertyDetailIteams(
                                                                        key:
                                                                            "Feature Notes ",
                                                                        value: item
                                                                            .roominfo![subIndex]
                                                                            .feature![subIndex2]
                                                                            .inspectionNotes!),

                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Card(
                                                                      // shape:
                                                                      //     OutlineInputBorder(),
                                                                      child:
                                                                          Theme(
                                                                        data: Theme.of(context).copyWith(
                                                                            colorScheme:
                                                                                ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
                                                                        child:
                                                                            ExpansionTile(
                                                                          tilePadding:
                                                                              EdgeInsets.zero,
                                                                          iconColor:
                                                                              primaryColor,
                                                                          title:
                                                                              Text(
                                                                            "Feautre Issues",
                                                                            style:
                                                                                TextStyle(color: primaryColor),
                                                                          ),
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                              child: ListView.builder(
                                                                                physics: NeverScrollableScrollPhysics(),
                                                                                shrinkWrap: true,
                                                                                itemCount: item.roominfo![subIndex].feature![subIndex2].featureissue!.length,
                                                                                itemBuilder: (context, option) => Text(
                                                                                  "${item.roominfo![subIndex].feature![subIndex2].featureissue![option].name}",
                                                                                  style: TextStyle(color: darkTextColor),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
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
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      InkWell(
                                          onTap: () {
                                            isInterested = null;
                                            _controller.text = '';
                                            showDialogeForSendResponse(
                                              customerId: item.customer!.id!,
                                              projectId: item.projectId!,
                                              email:
                                                  item.customer!.email!.isEmpty
                                                      ? ''
                                                      : item.customer!.email!,
                                              homeOwnerName: item.customer!
                                                      .firstName!.isEmpty
                                                  ? ''
                                                  : item.customer!.firstName!,
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide.none),
                                              color: primaryColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Send Your Response",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lightColor),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     controller: _scrollcontroller,
                //     itemCount: _professionalNotifier!
                //         .projectOpportunities!.data!.dataFinal!.length,
                //     itemBuilder: (context, index) {
                //       return
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Card(
                //           shape: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide.none),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Container(
                //                 padding: const EdgeInsets.all(8.0),
                //                 decoration: BoxDecoration(
                //                     color: primaryColor,
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(10))),
                //                 child: Center(
                //                   child: Text(
                //                     "${index + 1}. Project No: ${_professionalNotifier!.projectOpportunities!.data!.dataFinal![index].projectId}",
                //                     style: TextStyle(
                //                         color: lightColor,
                //                         fontWeight: FontWeight.bold),
                //                   ),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Column(
                //                   children: [
                //                     ListView.builder(
                //                       shrinkWrap: true,
                //                       physics:
                //                           NeverScrollableScrollPhysics(),
                //                       itemCount: _professionalNotifier!
                //                           .projectOpportunities!
                //                           .data!
                //                           .dataFinal![index]
                //                           .roominfo!
                //                           .length,
                //                       itemBuilder: (context, subIndex) {
                //                         return ExpansionTile(
                //                           iconColor: primaryColor,
                //                           childrenPadding: EdgeInsets.only(
                //                               left: 15, bottom: 15),
                //                           expandedAlignment:
                //                               Alignment.topLeft,
                //                           title: Text(
                //                               _professionalNotifier!
                //                                   .projectOpportunities!
                //                                   .data!
                //                                   .dataFinal![index]
                //                                   .roominfo![subIndex]
                //                                   .roomName!,
                //                               style: TextStyle(
                //                                   color:
                //                                       AppTheme.colorPrimary,
                //                                   fontSize: 14,
                //                                   fontWeight:
                //                                       FontWeight.w600)),
                //                           children: [
                //                             ListView.builder(
                //                               physics:
                //                                   NeverScrollableScrollPhysics(),
                //                               shrinkWrap: true,
                //                               itemCount:
                //                                   _professionalNotifier!
                //                                       .projectOpportunities!
                //                                       .data!
                //                                       .dataFinal![index]
                //                                       .roominfo![subIndex]
                //                                       .feature!
                //                                       .length,
                //                               itemBuilder:
                //                                   (context, subIndex2) {
                //                                 return Column(
                //                                   children: [
                //                                     Card(
                //                                       child: Theme(
                //                                         data: Theme.of(context).copyWith(
                //                                             colorScheme: ColorScheme
                //                                                     .fromSwatch()
                //                                                 .copyWith(
                //                                                     secondary:
                //                                                         Colors.black)),
                //                                         child:
                //                                             ExpansionTile(
                //                                           iconColor:
                //                                               primaryColor,
                //                                           childrenPadding:
                //                                               EdgeInsets.only(
                //                                                   left: 15,
                //                                                   bottom:
                //                                                       15),
                //                                           expandedAlignment:
                //                                               Alignment
                //                                                   .topLeft,
                //                                           title: Text(
                //                                               _professionalNotifier!
                //                                                   .projectOpportunities!
                //                                                   .data!
                //                                                   .dataFinal![
                //                                                       index]
                //                                                   .roominfo![
                //                                                       subIndex]
                //                                                   .feature![
                //                                                       subIndex2]
                //                                                   .featureName!,
                //                                               style: TextStyle(
                //                                                   color: AppTheme
                //                                                       .colorPrimary,
                //                                                   fontSize:
                //                                                       14,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .w600)),
                //                                           children: [
                //                                             Column(
                //                                               crossAxisAlignment:
                //                                                   CrossAxisAlignment
                //                                                       .start,
                //                                               mainAxisSize:
                //                                                   MainAxisSize
                //                                                       .min,
                //                                               children: [
                //                                                 _professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].images ==
                //                                                             null ||
                //                                                         _professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].images!.length ==
                //                                                             0
                //                                                     ? SizedBox()
                //                                                     : SizedBox(
                //                                                         height:
                //                                                             80,
                //                                                         child:
                //                                                             ListView.builder(
                //                                                           physics: NeverScrollableScrollPhysics(),
                //                                                           shrinkWrap: true,
                //                                                           scrollDirection: Axis.horizontal,
                //                                                           itemCount: _professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].images!.length,
                //                                                           itemBuilder: (context, imgindex) {
                //                                                             return InkWell(
                //                                                               onTap: () {
                //                                                                 Utils.imageInfoDialog(context: context, url: _professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].images![imgindex], description: "");
                //                                                               },
                //                                                               child: Container(
                //                                                                 width: 80,
                //                                                                 height: 80,
                //                                                                 padding: const EdgeInsets.only(right: 3),
                //                                                                 child: ClipRRect(
                //                                                                     borderRadius: BorderRadius.circular(5),
                //                                                                     child: CachedNetworkImage(
                //                                                                       errorWidget: (context, url, error) => SizedBox(),
                //                                                                       imageUrl: _professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].images![imgindex],
                //                                                                     )),
                //                                                               ),
                //                                                             );
                //                                                           },
                //                                                         ),
                //                                                       ),
                //                                                 propertyDetailIteams(
                //                                                     key:
                //                                                         "Feature Option ",
                //                                                     value: _professionalNotifier!
                //                                                         .projectOpportunities!
                //                                                         .data!
                //                                                         .dataFinal![index]
                //                                                         .roominfo![subIndex]
                //                                                         .feature![subIndex2]
                //                                                         .featureoption!),

                //                                                 SizedBox(
                //                                                   height: 5,
                //                                                 ),
                //                                                 // ListView.builder(
                //                                                 //   shrinkWrap: true,
                //                                                 //   itemCount: Detailsprovider
                //                                                 //       .listofrealtorproject[
                //                                                 //           widget.index]
                //                                                 //       .roominfo![index]
                //                                                 //       .feature![subindex]
                //                                                 //       .featureissue!
                //                                                 //       .length,
                //                                                 //   itemBuilder: (BuildContext context,
                //                                                 //       int subsubindex) {
                //                                                 //     return Column(
                //                                                 //       crossAxisAlignment:
                //                                                 //           CrossAxisAlignment.start,
                //                                                 //       children: [
                //                                                 //         Text("Feature Issue ${subsubindex + 1} : " +
                //                                                 //             Detailsprovider
                //                                                 //                 .listofrealtorproject[
                //                                                 //                     widget.index]
                //                                                 //                 .roominfo![index]
                //                                                 //                 .feature![subindex]
                //                                                 //                 .featureissue![
                //                                                 //                     subsubindex]
                //                                                 //                 .name),
                //                                                 //         SizedBox(
                //                                                 //           height: 5,
                //                                                 //         )
                //                                                 //       ],
                //                                                 //     );
                //                                                 //   },
                //                                                 // ),
                //                                                 propertyDetailIteams(
                //                                                     key:
                //                                                         "Feature Notes ",
                //                                                     value: _professionalNotifier!
                //                                                         .projectOpportunities!
                //                                                         .data!
                //                                                         .dataFinal![index]
                //                                                         .roominfo![subIndex]
                //                                                         .feature![subIndex2]
                //                                                         .inspectionNotes!),

                //                                                 SizedBox(
                //                                                   height: 5,
                //                                                 ),
                //                                                 Card(
                //                                                   // shape:
                //                                                   //     OutlineInputBorder(),
                //                                                   child:
                //                                                       Theme(
                //                                                     data: Theme.of(context).copyWith(
                //                                                         colorScheme:
                //                                                             ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
                //                                                     child:
                //                                                         ExpansionTile(
                //                                                       tilePadding:
                //                                                           EdgeInsets.zero,
                //                                                       iconColor:
                //                                                           primaryColor,
                //                                                       title:
                //                                                           Text(
                //                                                         "Feautre Issues",
                //                                                         style:
                //                                                             TextStyle(color: primaryColor),
                //                                                       ),
                //                                                       children: [
                //                                                         Padding(
                //                                                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //                                                           child: ListView.builder(
                //                                                             physics: NeverScrollableScrollPhysics(),
                //                                                             shrinkWrap: true,
                //                                                             itemCount: _professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].featureissue!.length,
                //                                                             itemBuilder: (context, option) => Text(
                //                                                               "${_professionalNotifier!.projectOpportunities!.data!.dataFinal![index].roominfo![subIndex].feature![subIndex2].featureissue![option].name}",
                //                                                               style: TextStyle(color: darkTextColor),
                //                                                             ),
                //                                                           ),
                //                                                         )
                //                                                       ],
                //                                                     ),
                //                                                   ),
                //                                                 ),

                //                                                 // propertyDetailIteams(key: "Inspection Notes : ", value: Detailsprovider
                //                                                 //           .listofrealtorproject[
                //                                                 //               widget.index]
                //                                                 //           .roominfo![index]
                //                                                 //           .feature![subindex]
                //                                                 //           .inspectionNotes!),
                //                                                 // Text(
                //                                                 //   "Issue text : " +
                //                                                 //       Detailsprovider
                //                                                 //           .listofrealtorproject[
                //                                                 //               widget.index]
                //                                                 //           .roominfo![index]
                //                                                 //           .feature![subindex]
                //                                                 //           .featureissue!,
                //                                                 // )
                //                                               ],
                //                                             )
                //                                           ],
                //                                         ),
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 );
                //                               },
                //                             ),
                //                           ],
                //                         );
                //                       },
                //                     ),
                //                     InkWell(
                //                         onTap: () {
                //                           isInterested = null;
                //                           _controller.text = '';
                //                           showDialogeForSendResponse(
                //                               customerId:
                //                                   _professionalNotifier!
                //                                       .projectOpportunities!
                //                                       .data!
                //                                       .dataFinal![index]
                //                                       .customer!
                //                                       .id!,
                //                               projectId:
                //                                   _professionalNotifier!
                //                                       .projectOpportunities!
                //                                       .data!
                //                                       .dataFinal![index]
                //                                       .projectId!);
                //                         },
                //                         child: Padding(
                //                           padding:
                //                               const EdgeInsets.all(8.0),
                //                           child: Card(
                //                             shape: OutlineInputBorder(
                //                                 borderRadius:
                //                                     BorderRadius.circular(
                //                                         10),
                //                                 borderSide:
                //                                     BorderSide.none),
                //                             color: primaryColor,
                //                             child: Padding(
                //                               padding: const EdgeInsets.all(
                //                                   12.0),
                //                               child: Text(
                //                                 "Send Your Response",
                //                                 style: TextStyle(
                //                                     fontWeight:
                //                                         FontWeight.bold,
                //                                     color: lightColor),
                //                               ),
                //                             ),
                //                           ),
                //                         )),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );

                //     },
                //   ),
                // ),

                Container(
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
              ],
            ),
    );
  }

  final f = new DateFormat('yyyy-MM-dd');

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
              'Are you sure you want to \ndelete this project ?',
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
              _professionalNotifier!
                  .deleteProjectProfessional(projectId,);
                    toastShowSuccess(context,'Delete project sucessfully');

              setState(() {});
              Navigator.pop(context);
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

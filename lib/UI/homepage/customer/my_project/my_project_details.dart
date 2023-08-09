import 'package:carousel_slider/carousel_slider.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Project_Details extends ConsumerStatefulWidget {
  int index;
  Project_Details({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Project_Details> createState() => _Project_DetailsState();
}

class _Project_DetailsState extends ConsumerState<Project_Details> {
  CustomerNotifier? projectprovider;
  List<String> list = [];
  bool isLoading = true;

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

  @override
  void initState() {
    isLoading = true;
    super.initState();
    projectprovider = ref.read(customernotifier);
    loadData();
  }

  void loadData() async {
    await projectprovider!.setCustomerModel();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    projectprovider = ref.watch(customernotifier);
    return isLoading
        ? LoadingWidget()
        : SafeArea(
            child: Scaffold(
              body: Container(
                child: Column(
                  children: [
                    CommonHeader(title: "Project Details"),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width,
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // width: size.width,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(10))),
                                        child: Center(
                                          child: Text("Customer Details",
                                              style: TextStyle(
                                                  color: lightColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            propertyDetailIteams(
                                                key: "Homeowners Name",
                                                value:
                                                    "${projectprovider!.customerUserModel!.data!.firstName} ${projectprovider!.customerUserModel!.data!.lastName}"),
                                            propertyDetailIteams(
                                                key: "Email Address",
                                                value:
                                                    "${projectprovider!.customerUserModel!.data!.email}"),
                                            propertyDetailIteams(
                                                key: "Phone Number",
                                                value:
                                                    "${projectprovider!.customerUserModel!.data!.phoneNumber ?? "Unknown"}"),
                                            propertyDetailIteams(
                                                key: "Zip Code",
                                                value:
                                                    "${projectprovider!.customerUserModel!.data!.zipCode ?? "Unknown"}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Features",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: projectprovider!
                                    .listofproject[widget.index]
                                    .roominfo!
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${projectprovider!.listofproject[widget.index].roominfo![index].roomName}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppTheme.colorPrimary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: projectprovider!
                                              .listofproject[widget.index]
                                              .roominfo![index]
                                              .feature!
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int subindex) {
                                            return Card(
                                              child: Theme(
                                                data: Theme.of(context).copyWith(
                                                    colorScheme: ColorScheme
                                                            .fromSwatch()
                                                        .copyWith(
                                                            secondary:
                                                                Colors.black)),
                                                child: ExpansionTile(
                                                  iconColor: primaryColor,
                                                  childrenPadding:
                                                      EdgeInsets.only(
                                                          left: 15, bottom: 15),
                                                  expandedAlignment:
                                                      Alignment.topLeft,
                                                  title: Text(
                                                      projectprovider!
                                                          .listofproject[
                                                              widget.index]
                                                          .roominfo![index]
                                                          .feature![subindex]
                                                          .featureName!,
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .colorPrimary,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        projectprovider!
                                                                        .listofproject[widget
                                                                            .index]
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            subindex]
                                                                        .images ==
                                                                    null ||
                                                                projectprovider!
                                                                    .listofproject[
                                                                        widget
                                                                            .index]
                                                                    .roominfo![
                                                                        index]
                                                                    .feature![
                                                                        subindex]
                                                                    .images!
                                                                    .isEmpty
                                                            ? SizedBox()
                                                            : SizedBox(
                                                                height: 80,
                                                                child: ListView
                                                                    .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount: projectprovider!
                                                                      .listofproject[
                                                                          widget
                                                                              .index]
                                                                      .roominfo![
                                                                          index]
                                                                      .feature![
                                                                          subindex]
                                                                      .images!
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          imgindex) {
                                                                    return InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Utils.imageInfoDialog(
                                                                            context:
                                                                                context,
                                                                            url:
                                                                                projectprovider!.listofproject[widget.index].roominfo![index].feature![subindex].images![imgindex],
                                                                            description: "");
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            80,
                                                                        padding:
                                                                            const EdgeInsets.only(right: 3),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          child:
                                                                              Image.network(
                                                                            projectprovider!.listofproject[widget.index].roominfo![index].feature![subindex].images![imgindex],
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                        projectprovider!
                                                                        .listofproject[widget
                                                                            .index]
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            subindex]
                                                                        .featureoption ==
                                                                    null ||
                                                                projectprovider!
                                                                    .listofproject[
                                                                        widget
                                                                            .index]
                                                                    .roominfo![
                                                                        index]
                                                                    .feature![
                                                                        subindex]
                                                                    .featureoption!
                                                                    .isEmpty
                                                            ? SizedBox()
                                                            : propertyDetailIteams(
                                                                key:
                                                                    "Feature Option",
                                                                value: projectprovider!
                                                                    .listofproject[
                                                                        widget
                                                                            .index]
                                                                    .roominfo![
                                                                        index]
                                                                    .feature![
                                                                        subindex]
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
                                                        // projectprovider
                                                        //                 .listofproject[
                                                        //                     widget
                                                        //                         .index]
                                                        //                 .roominfo![
                                                        //                     index]
                                                        //                 .feature![
                                                        //                     subindex]
                                                        //                 .inspectionNotes ==
                                                        //             null ||
                                                        //         projectprovider
                                                        //             .listofproject[
                                                        //                 widget.index]
                                                        //             .roominfo![index]
                                                        //             .feature![subindex]
                                                        //             .inspectionNotes!
                                                        //             .isEmpty
                                                        //     ? SizedBox()
                                                        //     :
                                                        propertyDetailIteams(
                                                            key: "Comments",
                                                            value: projectprovider!
                                                                .listofproject[
                                                                    widget
                                                                        .index]
                                                                .roominfo![
                                                                    index]
                                                                .feature![
                                                                    subindex]
                                                                .inspectionNotes!),

                                                        SizedBox(
                                                          height: 5,
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
                              projectprovider!.listofproject[widget.index]
                                      .projectOpertunity!.isEmpty
                                  ? SizedBox()
                                  : SizedBox(
                                      width: size.width,
                                      child: Card(
                                        shape: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              // width: size.width,
                                              decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              10))),
                                              child: Center(
                                                child: Text(
                                                    "service pro replies",
                                                    style: TextStyle(
                                                        color: lightColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18)),
                                              ),
                                            ),
                                            projectprovider!
                                                    .listofproject[widget.index]
                                                    .projectOpertunity!
                                                    .isNotEmpty
                                                ? ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: projectprovider!
                                                        .listofproject[
                                                            widget.index]
                                                        .projectOpertunity!
                                                        .length,
                                                    itemBuilder: (context,
                                                        projectOppIndex) {
                                                      return Column(
                                                        children: [
                                                          Card(
                                                            child: Theme(
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
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            15),
                                                                expandedAlignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                title: Text(
                                                                    projectprovider!
                                                                        .listofproject[widget
                                                                            .index]
                                                                        .projectOpertunity![
                                                                            projectOppIndex]
                                                                        .professional!
                                                                        .companyName!,
                                                                    style: TextStyle(
                                                                        color: AppTheme
                                                                            .colorPrimary,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Address",
                                                                          value:
                                                                              "${projectprovider!.listofproject[widget.index].projectOpertunity![projectOppIndex].professional!.companyStreetAddress}"),
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Email",
                                                                          value:
                                                                              "${projectprovider!.listofproject[widget.index].projectOpertunity![projectOppIndex].professional!.email}"),
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Phone Number",
                                                                          value:
                                                                              "${projectprovider!.listofproject[widget.index].projectOpertunity![projectOppIndex].professional!.phoneNumber}"),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Card(
                                                            child: Theme(
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
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            15),
                                                                expandedAlignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                title: Text(
                                                                    "THE SERVICE PRO WROTE",
                                                                    style: TextStyle(
                                                                        color: AppTheme
                                                                            .colorPrimary,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            decoration: BoxDecoration(
                                                                                color: projectprovider!.listofproject[widget.index].projectOpertunity![projectOppIndex].isInterested == 1 ? teamColor : lightColor,
                                                                                borderRadius: BorderRadius.circular(3),
                                                                                border: Border.all(
                                                                                  color: blackColor,
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              "Yes ,i'm interested")
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            decoration: BoxDecoration(
                                                                                color: projectprovider!.listofproject[widget.index].projectOpertunity![projectOppIndex].isInterested == 0 ? teamColor : lightColor,
                                                                                borderRadius: BorderRadius.circular(3),
                                                                                border: Border.all(
                                                                                  color: blackColor,
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              "No ,i'm not interested")
                                                                        ],
                                                                      ),
                                                                      propertyDetailIteams(
                                                                          key:
                                                                              "Message",
                                                                          value:
                                                                              "${projectprovider!.listofproject[widget.index].projectOpertunity![projectOppIndex].message}"),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Center(
                                                            child: ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                    "Reply")),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
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

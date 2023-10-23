import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Realtor_project_details extends ConsumerStatefulWidget {
  final int index;
  Realtor_project_details({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Realtor_project_details> createState() =>
      _Realtor_project_detailsState();
}

class _Realtor_project_detailsState
    extends ConsumerState<Realtor_project_details> {
  List<String> list = [];
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
    final size = MediaQuery.of(context).size;
    final Detailsprovider = ref.read(realtorprovider);
    return Scaffold(
      body: Column(
        children: [
          CommonHeader(title: "My Projects", isback: true),
          SizedBox(
            height: 10,
          ),
          // Detailsprovider.listofrealtorproject[widget.index].roominfo!.first
          //         .feature!.first.images!.isEmpty
          //     ? SizedBox()
          //     : CarouselSlider.builder(
          //         itemCount: Detailsprovider
          //             .listofrealtorproject[widget.index]
          //             .roominfo!
          //             .first
          //             .feature!
          //             .first
          //             .images!
          //             .length,
          //         itemBuilder: (BuildContext context, int itemIndex,
          //                 int pageViewIndex) =>
          //             Container(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: NetworkImage(Detailsprovider
          //                       .listofrealtorproject[widget.index]
          //                       .roominfo!
          //                       .first
          //                       .feature!
          //                       .first
          //                       .images![itemIndex]
          //                       .url),
          //                   fit: BoxFit.cover),
          //               borderRadius: BorderRadius.circular(15),
          //               color: AppTheme.grey,
          //             ),
          //           ),
          //         ),
          //         options: CarouselOptions(
          //           aspectRatio: 16 / 9,
          //           viewportFraction: 0.8,
          //           initialPage: 0,
          //           enableInfiniteScroll: true,
          //           reverse: false,
          //           autoPlay: true,
          //           autoPlayInterval: Duration(seconds: 3),
          //           autoPlayAnimationDuration: Duration(milliseconds: 800),
          //           autoPlayCurve: Curves.fastOutSlowIn,
          //           enlargeCenterPage: true,
          //           scrollDirection: Axis.horizontal,
          //         ),
          //       ),
          // SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: size.width,
                      child: Card(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  propertyDetailIteams(
                                      key: "Homeowners Name",
                                      value:
                                          "${Detailsprovider.listofrealtorproject[widget.index].customer!.firstName} ${Detailsprovider.listofrealtorproject[widget.index].customer!.lastName}"),
                                  propertyDetailIteams(
                                      key: "Email Address",
                                      value:
                                          "${Detailsprovider.listofrealtorproject[widget.index].customer!.email}"),
                                  propertyDetailIteams(
                                      key: "Phone Number",
                                      value:
                                          "${Detailsprovider.listofrealtorproject[widget.index].customer?.phoneNumber ?? "Unknown"}"),
                                  propertyDetailIteams(
                                      key: "Zip Code",
                                      value:
                                          "${Detailsprovider.listofrealtorproject[widget.index].customer?.zipCode ?? "Unknown"}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Detailsprovider
                          .listofrealtorproject[widget.index].roominfo!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${Detailsprovider.listofrealtorproject[widget.index].roominfo![index].roomName}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: Detailsprovider
                                    .listofrealtorproject[widget.index]
                                    .roominfo![index]
                                    .feature!
                                    .length,
                                itemBuilder:
                                    (BuildContext context, int subindex) {
                                  return Card(
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.fromSwatch()
                                              .copyWith(
                                                  secondary: Colors.black)),
                                      child: ExpansionTile(
                                        iconColor: primaryColor,
                                        childrenPadding: EdgeInsets.only(
                                            left: 15, bottom: 15),
                                        expandedAlignment: Alignment.topLeft,
                                        title: Text(
                                            Detailsprovider
                                                .listofrealtorproject[
                                                    widget.index]
                                                .roominfo![index]
                                                .feature![subindex]
                                                .featureName!,
                                            style: TextStyle(
                                                color: AppTheme.colorPrimary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Detailsprovider
                                                          .listofrealtorproject[
                                                              widget.index]
                                                          .roominfo![index]
                                                          .feature![subindex]
                                                          .images!
                                                          .length ==
                                                      0
                                                  ? SizedBox()
                                                  : SizedBox(
                                                      height: 80,
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: Detailsprovider
                                                            .listofrealtorproject[
                                                                widget.index]
                                                            .roominfo![index]
                                                            .feature![subindex]
                                                            .images!
                                                            .length,
                                                        itemBuilder: (context,
                                                            imgindex) {
                                                          return InkWell(
                                                            onTap: () {
                                                              Utils.imageInfoDialog(
                                                                  context:
                                                                      context,
                                                                  url: Detailsprovider
                                                                      .listofrealtorproject[
                                                                          widget
                                                                              .index]
                                                                      .roominfo![
                                                                          index]
                                                                      .feature![
                                                                          subindex]
                                                                      .images![imgindex],
                                                                  description: "");
                                                            },
                                                            child: Container(
                                                              width: 80,
                                                              height: 80,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right: 3),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                child: CachedNetworkImage(
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        Image.asset(
                                                                            "assets/images/noimage.png"),
                                                                    imageUrl: Detailsprovider
                                                                        .listofrealtorproject[widget
                                                                            .index]
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            subindex]
                                                                        .images![imgindex]),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                              Detailsprovider
                                                      .listofrealtorproject[
                                                          widget.index]
                                                      .roominfo![index]
                                                      .feature![subindex]
                                                      .featureoption!
                                                      .isNotEmpty
                                                  ? propertyDetailIteams(
                                                      key: "Feature Option ",
                                                      value: Detailsprovider
                                                          .listofrealtorproject[
                                                              widget.index]
                                                          .roominfo![index]
                                                          .feature![subindex]
                                                          .featureoption!)
                                                  : SizedBox(),

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
                                                  key: "Inspection Notes ",
                                                  value: Detailsprovider
                                                      .listofrealtorproject[
                                                          widget.index]
                                                      .roominfo![index]
                                                      .feature![subindex]
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
                  ],
                ),
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
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }
}

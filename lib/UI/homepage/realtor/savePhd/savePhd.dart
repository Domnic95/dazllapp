import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/pdf_api.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/pdf_invoice_api.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/complitedPhdProvider.dart';
import 'package:dazllapp/UI/homepage/realtor/realtor_homepage.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/model/Realtor/getComplitedPhd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SavePhd extends ConsumerStatefulWidget {
  const SavePhd({Key? key}) : super(key: key);

  @override
  ConsumerState<SavePhd> createState() => _ComplitedPhdState();
}

class _ComplitedPhdState extends ConsumerState<SavePhd> {
  late ComplitedPhdProvider _complitedPhdProvider;
  late RealtorNotifier _realtorProvider;
  List<bool> loader = [];
  bool deleteProjectLoader = false;
  @override
  void initState() {
    _complitedPhdProvider = ref.read(complitedPhdProvider);
    load();
    super.initState();
  }

  List<Widget> buildAddValueDataText(List<FeatureOptionsElement> list) {
    return list.map((e) {
      return Text("${e.name},");
    }).toList();
  }

  List<Widget> buildRoomTypeData(List<Roomtypedatum> list) {
    return list
        .map((e) => Row(
              children: [
                Text(
                  _realtorProvider.singleComplitedPhdReport!.reports!.isEmpty
                      ? ""
                      : e.feature!.name!.indexOf('Type') == -1
                          ? '${e.feature!.name!} Type : '
                          : '${e.feature!.name!} : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(_realtorProvider.singleComplitedPhdReport!.reports!.isEmpty
                    ? ""
                    : "${e.featureOptions!.name!}"),
              ],
            ))
        .toList();
  }

  load() async {
    await _complitedPhdProvider.loadComplitedPhd(ref: ref);

    _complitedPhdProvider.loader(Loading.complited);
    if (_realtorProvider.singleComplitedPhdReport!.reports!.isNotEmpty) {
      for (var i = 0;
          i <
              _realtorProvider
                  .singleComplitedPhdReport!.reports!.first.roominfo!.length;
          i++) {
        for (var j = 0;
            j <
                _realtorProvider.singleComplitedPhdReport!.reports!.first
                    .roominfo![i].feature!.length;
            j++) {
          loader.add(false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _complitedPhdProvider = ref.watch(complitedPhdProvider);
    _realtorProvider = ref.watch(realtorprovider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonHeader(title: 'PHD Project-Summary', isback: true),
      body: _complitedPhdProvider.loading == Loading.loding
          ? LoadingWidget()
          : _realtorProvider.singleComplitedPhdReport!.reports!.isEmpty
              ? Container(
                  padding: EdgeInsets.all(10),
                  width: size.width,
                  child: Column(
                    children: [
                      Card(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                child: Text(
                                  "PHD Report Summary",
                                  style: TextStyle(
                                    color: lightColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  propertyDetailIteams(
                                      key: "Owners Name",
                                      value: _realtorProvider
                                              .singleComplitedPhdReport!
                                              .reports!
                                              .isEmpty
                                          ? "--"
                                          : "${_realtorProvider.singleComplitedPhdReport!.reports!.first.customer!.firstName} ${_realtorProvider.singleComplitedPhdReport!.reports!.first.customer!.lastName}"),
                                  propertyDetailIteams(
                                      key: "Email",
                                      value: _realtorProvider
                                              .singleComplitedPhdReport!
                                              .reports!
                                              .isEmpty
                                          ? "--"
                                          : "${_complitedPhdProvider.selectedCustomer?.email}"),
                                  propertyDetailIteams(
                                      key: "Property",
                                      value: _realtorProvider
                                              .singleComplitedPhdReport!
                                              .reports!
                                              .isEmpty
                                          ? "--"
                                          : "${_complitedPhdProvider.selectedCustomer?.location ?? "Unknown"}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          "No Data Available",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
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
                                    child: Text(
                                      "PHD Report Summary",
                                      style: TextStyle(
                                        color: lightColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      propertyDetailIteams(
                                          key: "Owners Name",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : "${_realtorProvider.singleComplitedPhdReport!.reports!.first.customer!.firstName} ${_realtorProvider.singleComplitedPhdReport!.reports!.first.customer!.lastName}"),
                                      propertyDetailIteams(
                                          key: "Email",
                                          value:
                                              "${_complitedPhdProvider.selectedCustomer?.email}"),
                                      propertyDetailIteams(
                                          key: "Property",
                                          value:
                                              "${_complitedPhdProvider.selectedCustomer?.location ?? "Unknown"}"),
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
                                    child: Text("Property Details",
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
                                          key: "Bed",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.bedrooms ?? 1}"),
                                      propertyDetailIteams(
                                          key: "House Size",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.grossSize ?? 2021}"),
                                      propertyDetailIteams(
                                          key: "Lot Size",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.lotSize ?? "1 "} sqft"),
                                      propertyDetailIteams(
                                          key: "Property Type",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.type ?? 1}"),
                                      propertyDetailIteams(
                                          key: "Date Updated",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${DateFormat("dd-MM-yyyy").format(_realtorProvider.singleComplitedPhdReport!.reports!.first.house!.updatedAt!)}"),
                                      propertyDetailIteams(
                                          key: "Bathrooms",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.bathrooms ?? 1}"),
                                      propertyDetailIteams(
                                          key: "Rooms", value: ""),
                                      propertyDetailIteams(
                                          key: "Year Built",
                                          value: _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .isEmpty
                                              ? ""
                                              : " ${DateFormat("dd-MM-yyyy").format(_realtorProvider.singleComplitedPhdReport!.reports!.first.house!.createdAt!)}"),
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
                        // progressWidget(
                        //     size: size,
                        //     title: "Preliminary Value/Score",
                        //     minLimit: "\$200k",
                        //     midleLimit: _realtorProvider
                        //             .singleComplitedPhdReport!.reports!.isEmpty
                        //         ? ""
                        //         : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.prePrice.toString()))}",
                        //     maxLimit: "\$2M",
                        //     percentag: (_realtorProvider
                        //                 .singleComplitedPhdReport!
                        //                 .reports!
                        //                 .isEmpty
                        //             ? 0.0
                        //             : int.parse(_realtorProvider
                        //                     .singleComplitedPhdReport!
                        //                     .reports!
                        //                     .first
                        //                     .prePrice!) /
                        //                 2000000) *
                        //         100),
                        // progressWidget(
                        //     size: size,
                        //     title: "PHD Value/Score",
                        //     minLimit: "\$200k",
                        //     midleLimit: _realtorProvider
                        //             .singleComplitedPhdReport!.reports!.isEmpty
                        //         ? ""
                        //         : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice.toString()))}",
                        //     maxLimit: "\$2M",
                        //     percentag: (_realtorProvider
                        //                 .singleComplitedPhdReport!
                        //                 .reports!
                        //                 .isEmpty
                        //             ? 0.0
                        //             : int.parse(_realtorProvider
                        //                     .singleComplitedPhdReport!
                        //                     .reports!
                        //                     .first
                        //                     .phdPrice!) /
                        //                 2000000) *
                        //         100),
                        // progressWidget(
                        //     size: size,
                        //     title: "DAZL Value/Score",
                        //     minLimit: "\$200k",
                        //     midleLimit: _realtorProvider
                        //             .singleComplitedPhdReport!.reports!.isEmpty
                        //         ? ""
                        //         : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice.toString()))}",
                        //     maxLimit: "\$2M",
                        //     percentag: (int.parse(_realtorProvider
                        //                 .singleComplitedPhdReport!
                        //                 .reports!
                        //                 .first
                        //                 .phdPrice!) /
                        //             2000000) *
                        //         100),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _realtorProvider
                                  .singleComplitedPhdReport!.reports!.isEmpty
                              ? 0
                              : _realtorProvider.singleComplitedPhdReport!
                                      .reports!.first.roominfo?.length ??
                                  0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Card(
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10))),
                                      child: Center(
                                        child: Text("Room/Area Details",
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  _realtorProvider
                                                          .singleComplitedPhdReport!
                                                          .reports!
                                                          .isEmpty
                                                      ? ""
                                                      : "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].roomName}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: blackColor),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                _realtorProvider
                                                        .singleComplitedPhdReport!
                                                        .reports!
                                                        .isEmpty
                                                    ? ""
                                                    : "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].status ?? ""}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: primaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          _realtorProvider
                                                      .singleComplitedPhdReport!
                                                      .reports!
                                                      .first
                                                      .images
                                                      ?.length ==
                                                  0
                                              ? SizedBox()
                                              : Container(
                                                  // color: Colors.amber,
                                                  width: size.width,
                                                  height: 80,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: _realtorProvider
                                                            .singleComplitedPhdReport!
                                                            .reports!
                                                            .first
                                                            .images
                                                            ?.length ??
                                                        0,
                                                    itemBuilder:
                                                        (context, subIndex) {
                                                      return InkWell(
                                                        onTap: () {
                                                          Utils.imageInfoDialog(
                                                              context: context,
                                                              url: _realtorProvider
                                                                  .singleComplitedPhdReport!
                                                                  .reports!
                                                                  .first
                                                                  .images![
                                                                      subIndex]
                                                                  .url
                                                                  .toString(),
                                                              description: _realtorProvider
                                                                  .singleComplitedPhdReport!
                                                                  .reports!
                                                                  .first
                                                                  .images![
                                                                      subIndex]
                                                                  .description
                                                                  .toString());
                                                        },
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(3),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child: _realtorProvider
                                                                    .singleComplitedPhdReport!
                                                                    .reports!
                                                                    .first
                                                                    .images![
                                                                        subIndex]
                                                                    .url
                                                                    .toString()
                                                                    .contains(
                                                                        '.svg')
                                                                ? SvgPicture
                                                                    .network(
                                                                    _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .images![
                                                                            subIndex]
                                                                        .url
                                                                        .toString(),
                                                                    placeholderBuilder: (BuildContext context) => Container(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            30.0),
                                                                        child:
                                                                            const CircularProgressIndicator()),
                                                                  )
                                                                : CachedNetworkImage(
                                                                    imageUrl: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .images![
                                                                            subIndex]
                                                                        .url
                                                                        .toString(),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        SizedBox(),
                                                                  ),
                                                            // Image.network(
                                                            //     _realtorProvider
                                                            //         .singleComplitedPhdReport!
                                                            //         .reports!
                                                            //         .first
                                                            //         .images![subIndex]
                                                            //         .url
                                                            //         .toString(),
                                                            //     fit: BoxFit.contain,
                                                            //     height: 60),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .first
                                                  .roominfo![index]
                                                  .additional!
                                                  .isEmpty
                                              ? SizedBox()
                                              : Text(
                                                  "Value Add Items-",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 16),
                                                ),
                                          // SizedBox(
                                          //   height: _realtorProvider
                                          //           .singleComplitedPhdReport!
                                          //           .reports!
                                          //           .first
                                          //           .roominfo![index]
                                          //           .additional!
                                          //           .isEmpty
                                          //       ? 8
                                          //       : 0,
                                          // ),
                                          _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .first
                                                  .roominfo![index]
                                                  .additional!
                                                  .isEmpty
                                              ? SizedBox()
                                              : Wrap(
                                                  children: buildAddValueDataText(
                                                      _realtorProvider
                                                          .singleComplitedPhdReport!
                                                          .reports!
                                                          .first
                                                          .roominfo![index]
                                                          .additional!)),
                                          // SizedBox(
                                          //   height: _realtorProvider
                                          //           .singleComplitedPhdReport!
                                          //           .reports!
                                          //           .first
                                          //           .roominfo![index]
                                          //           .additional!
                                          //           .isEmpty
                                          //       ? 8
                                          //       : 0,
                                          // ),
                                          // SizedBox(
                                          //   height: _realtorProvider
                                          //           .singleComplitedPhdReport!
                                          //           .reports!
                                          //           .first
                                          //           .roomtypedata!
                                          //           .isNotEmpty
                                          //       ? 8
                                          //       : 0,
                                          // ),
                                          _realtorProvider
                                                  .singleComplitedPhdReport!
                                                  .reports!
                                                  .first
                                                  .roomtypedata!
                                                  .isNotEmpty
                                              ? Column(
                                                  children: buildRoomTypeData(
                                                      _realtorProvider
                                                          .singleComplitedPhdReport!
                                                          .reports!
                                                          .first
                                                          .roomtypedata!),
                                                )
                                              //  Row(
                                              //     children: [
                                              //       Text(_realtorProvider
                                              //               .singleComplitedPhdReport!
                                              //               .reports!
                                              //               .isEmpty
                                              //           ? ""
                                              //           : '${_realtorProvider.singleComplitedPhdReport!.reports!.first.roomtypedata!.first.feature!.name!} Type : '),
                                              //       Text(_realtorProvider
                                              //               .singleComplitedPhdReport!
                                              //               .reports!
                                              //               .isEmpty
                                              //           ? ""
                                              //           : "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roomtypedata!.first.featureOptions!.name!}"),
                                              //     ],
                                              //   )

                                              : SizedBox(),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          // Text(
                                          //   "Value Add Items-",
                                          //   style: TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       fontSize: 16,
                                          //       decoration:
                                          //           TextDecoration.underline,
                                          //       decorationThickness: 4,
                                          //       decorationStyle:
                                          //           TextDecorationStyle.solid,
                                          //       color: blackColor),
                                          // ),
                                          // SizedBox(
                                          //   height: 3,
                                          // ),
                                          // Text("Upgraded Flooring,"),
                                          // SizedBox(
                                          //   height: 8,
                                          // ),
                                          Text(
                                            "Buyer Road Blocks or Recommendations",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: primaryColor),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                              padding: EdgeInsets.zero,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: _realtorProvider
                                                      .singleComplitedPhdReport!
                                                      .reports!
                                                      .first
                                                      .roominfo![index]
                                                      .feature
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index1) {
                                                final item = _realtorProvider
                                                    .singleComplitedPhdReport!
                                                    .reports!
                                                    .first
                                                    .roominfo![index]
                                                    .feature?[index1];
                                                return SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        _realtorProvider
                                                                .singleComplitedPhdReport!
                                                                .reports!
                                                                .isEmpty
                                                            ? ""
                                                            : "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].featureName}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: blackColor),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      _realtorProvider
                                                              .singleComplitedPhdReport!
                                                              .reports!
                                                              .first
                                                              .roominfo![index]
                                                              .feature![index1]
                                                              .imageDesc!
                                                              .isNotEmpty
                                                          ? _realtorProvider
                                                                          .singleComplitedPhdReport!
                                                                          .reports!
                                                                          .first
                                                                          .roominfo![
                                                                              index]
                                                                          .feature![
                                                                              index1]
                                                                          .imageDesc !=
                                                                      null ||
                                                                  _realtorProvider
                                                                      .singleComplitedPhdReport!
                                                                      .reports!
                                                                      .first
                                                                      .roominfo![
                                                                          index]
                                                                      .feature![
                                                                          index1]
                                                                      .imageDesc!
                                                                      .isNotEmpty
                                                              ? Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        'Comments: '),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                2.0,
                                                                            vertical:
                                                                                1.0),
                                                                        child: Text(
                                                                            "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].imageDesc}"),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : SizedBox()
                                                          : SizedBox(height: 0),
                                                      // SizedBox(
                                                      //   height: 8,
                                                      // ),
                                                      _realtorProvider
                                                                  .singleComplitedPhdReport!
                                                                  .reports!
                                                                  .first
                                                                  .roominfo![
                                                                      index]
                                                                  .feature![
                                                                      index1]
                                                                  .images
                                                                  ?.length ==
                                                              0
                                                          ? SizedBox(height: 5)
                                                          : SizedBox(
                                                              height: 80,
                                                              child: ListView
                                                                  .builder(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3),
                                                                // physics:
                                                                //     NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            index1]
                                                                        .images
                                                                        ?.length ??
                                                                    0,
                                                                itemBuilder:
                                                                    (context,
                                                                        subIndex) {
                                                                  return InkWell(
                                                                    onTap: () {
                                                                      Utils.imageInfoDialog(
                                                                          context:
                                                                              context,
                                                                          url: _realtorProvider
                                                                              .singleComplitedPhdReport!
                                                                              .reports!
                                                                              .first
                                                                              .roominfo![index]
                                                                              .feature![index1]
                                                                              .images![subIndex]
                                                                              .toString(),
                                                                          description: _realtorProvider.singleComplitedPhdReport!.reports!.isEmpty ? "" : _realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].imageDesc ?? "");
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              3),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        child: _realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].images![subIndex].contains('.svg')
                                                                            ? SvgPicture.network(
                                                                                _realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].images![subIndex],
                                                                                placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
                                                                              )
                                                                            : CachedNetworkImage(
                                                                                imageUrl: _realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].images![subIndex].toString(),
                                                                                errorWidget: (context, url, error) => SizedBox(),
                                                                              ),
                                                                        // Image.network(
                                                                        //     _realtorProvider
                                                                        //         .singleComplitedPhdReport!
                                                                        //         .reports!
                                                                        //         .first
                                                                        //         .roominfo![
                                                                        //             index]
                                                                        //         .feature![
                                                                        //             index1]
                                                                        //         .images![
                                                                        //             subIndex]
                                                                        //         .toString(),
                                                                        //     fit: BoxFit
                                                                        //         .contain,
                                                                        //     height: 60),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                      // SizedBox(
                                                      //   height: 8,
                                                      // ),
                                                      Row(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Checkbox(
                                                                checkColor:
                                                                    lightColor,
                                                                activeColor:
                                                                    primaryColor,
                                                                value: _realtorProvider
                                                                            .singleComplitedPhdReport!
                                                                            .reports!
                                                                            .first
                                                                            .roominfo![index]
                                                                            .feature?[index1]
                                                                            .bidStatus ==
                                                                        "Bid"
                                                                    ? true
                                                                    : false,
                                                                onChanged:
                                                                    (value) async {
                                                                  await _realtorProvider
                                                                      .updateBidStatus(
                                                                    projectId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .projectId!,
                                                                    featureId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            index1]
                                                                        .featureId!,
                                                                    roomId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .roomId!,
                                                                    bidStatus:
                                                                        'Bid',
                                                                  );
                                                                  await _complitedPhdProvider
                                                                      .loadComplitedPhd(
                                                                          ref:
                                                                              ref);
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              Text("Bid"),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Checkbox(
                                                                checkColor:
                                                                    lightColor,
                                                                activeColor:
                                                                    primaryColor,
                                                                value: _realtorProvider
                                                                            .singleComplitedPhdReport!
                                                                            .reports!
                                                                            .first
                                                                            .roominfo![index]
                                                                            .feature?[index1]
                                                                            .bidStatus ==
                                                                        "D.I.Y"
                                                                    ? true
                                                                    : false,
                                                                onChanged:
                                                                    (value) async {
                                                                  await _realtorProvider
                                                                      .updateBidStatus(
                                                                    projectId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .projectId!,
                                                                    featureId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            index1]
                                                                        .featureId!,
                                                                    roomId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .roomId!,
                                                                    bidStatus:
                                                                        'D.I.Y',
                                                                  );
                                                                  await _complitedPhdProvider
                                                                      .loadComplitedPhd(
                                                                          ref:
                                                                              ref);
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              Text("D.I.Y"),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Checkbox(
                                                                checkColor:
                                                                    lightColor,
                                                                activeColor:
                                                                    primaryColor,
                                                                value: _realtorProvider
                                                                            .singleComplitedPhdReport!
                                                                            .reports!
                                                                            .first
                                                                            .roominfo![index]
                                                                            .feature?[index1]
                                                                            .bidStatus ==
                                                                        "Pass"
                                                                    ? true
                                                                    : false,
                                                                onChanged:
                                                                    (value) async {
                                                                  await _realtorProvider
                                                                      .updateBidStatus(
                                                                    projectId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .projectId!,
                                                                    featureId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            index1]
                                                                        .featureId!,
                                                                    roomId: _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .roomId!,
                                                                    bidStatus:
                                                                        'Pass',
                                                                  );
                                                                  await _complitedPhdProvider
                                                                      .loadComplitedPhd(
                                                                          ref:
                                                                              ref);
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              Text("Pass"),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      progressWidget(
                                                          size: size,
                                                          title: "",
                                                          minLimit: "\$200k",
                                                          midleLimit: _realtorProvider
                                                                  .singleComplitedPhdReport!
                                                                  .reports!
                                                                  .isEmpty
                                                              ? ""
                                                              : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice.toString()))}",
                                                          maxLimit: "\$2M",
                                                          percentag: (int.parse(_realtorProvider
                                                                      .singleComplitedPhdReport!
                                                                      .reports!
                                                                      .first
                                                                      .phdPrice!) /
                                                                  2000000) *
                                                              100),
                                                      SizedBox(height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Estimated DAZL value :- ',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '5000000',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        teamColor,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            index1]
                                                                        .images
                                                                        ?.length ==
                                                                    0
                                                                ? SizedBox()
                                                                : loader[index1] ==
                                                                        true
                                                                    ? Center(
                                                                        child:
                                                                            CircularProgressIndicator())
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () async {
                                                                          loader[index1] =
                                                                              true;
                                                                          setState(
                                                                              () {});
                                                                          final pdfFile = await PdfInvoiceApi.generate(
                                                                              item,
                                                                              _realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice.toString());
                                                                          loader[index1] =
                                                                              false;
                                                                          await PdfApi.openFile(
                                                                              pdfFile);

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.share,
                                                                              size: 14,
                                                                            ),
                                                                            Text(
                                                                              ' SHARE',
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w700,
                                                                                color: primaryColor,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                          ],
                                                        ),
                                                      ),
                                                      index >=
                                                              _realtorProvider
                                                                  .singleComplitedPhdReport!
                                                                  .reports!
                                                                  .first
                                                                  .roominfo!
                                                                  .length
                                                          ? SizedBox()
                                                          : Divider(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                      SizedBox(height: 10),
                                                    ],
                                                  ),
                                                );
                                              }),

                                          SizedBox(
                                            height: 8,
                                          ),

                                          // progressWidget(
                                          //     size: size,
                                          //     title: "",
                                          //     minLimit: "\$200,000",
                                          //     midleLimit:
                                          //         "\$${_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice}",
                                          //     maxLimit: "\$2,000,000",
                                          //     percentag: (int.parse(_realtorProvider
                                          //                 .singleComplitedPhdReport!
                                          //                 .reports!
                                          //                 .first
                                          //                 .phdPrice!) /
                                          //             2000000) *
                                          //         100),
                                          // SizedBox(
                                          //   height: 8,
                                          // ),
                                          // Row(
                                          //   children: [
                                          //     Row(
                                          //       children: [
                                          //         Checkbox(
                                          //           value: false,
                                          //           onChanged: (value) {},
                                          //         ),
                                          //         Text("Bid"),
                                          //       ],
                                          //     ),
                                          //     Row(
                                          //       children: [
                                          //         Checkbox(
                                          //           value: false,
                                          //           onChanged: (value) {},
                                          //         ),
                                          //         Text("D.I.Y"),
                                          //       ],
                                          //     ),
                                          //     Row(
                                          //       children: [
                                          //         Checkbox(
                                          //           value: false,
                                          //           onChanged: (value) {},
                                          //         ),
                                          //         Text("Pass"),
                                          //       ],
                                          //     ),
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // progressWidget(
                              //     size: size,
                              //     title: "Preliminary Value/Score",
                              //     minLimit: "\$200k",
                              //     midleLimit: _realtorProvider
                              //             .singleComplitedPhdReport!
                              //             .reports!
                              //             .isEmpty
                              //         ? ""
                              //         : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.prePrice.toString()))}",
                              //     maxLimit: "\$2M",
                              //     percentag: (_realtorProvider
                              //                 .singleComplitedPhdReport!
                              //                 .reports!
                              //                 .isEmpty
                              //             ? 0.0
                              //             : int.parse(_realtorProvider
                              //                     .singleComplitedPhdReport!
                              //                     .reports!
                              //                     .first
                              //                     .prePrice!) /
                              //                 2000000) *
                              //         100),
                              // progressWidget(
                              //     size: size,
                              //     title: "PHD Value/Score",
                              //     minLimit: "\$200k",
                              //     midleLimit: _realtorProvider
                              //             .singleComplitedPhdReport!
                              //             .reports!
                              //             .isEmpty
                              //         ? ""
                              //         : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice.toString()))}",
                              //     maxLimit: "\$2M",
                              //     percentag: (_realtorProvider
                              //                 .singleComplitedPhdReport!
                              //                 .reports!
                              //                 .isEmpty
                              //             ? 0.0
                              //             : int.parse(_realtorProvider
                              //                     .singleComplitedPhdReport!
                              //                     .reports!
                              //                     .first
                              //                     .phdPrice!) /
                              //                 2000000) *
                              //         100),
                              // progressWidget(
                              //     size: size,
                              //     title: "DAZL Value/Score",
                              //     minLimit: "\$200k",
                              //     midleLimit: _realtorProvider
                              //             .singleComplitedPhdReport!
                              //             .reports!
                              //             .isEmpty
                              //         ? ""
                              //         : "\$${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(int.parse(_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice.toString()))}",
                              //     maxLimit: "\$2M",
                              //     percentag: (int.parse(_realtorProvider
                              //                 .singleComplitedPhdReport!
                              //                 .reports!
                              //                 .first
                              //                 .phdPrice!) /
                              //             2000000) *
                              //         100),
                              // SizedBox(
                              //   height: 10,
                              // ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                deleteProjectDilouge(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10.0),
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Delete Project',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // deleteProjectDilouge(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10.0),
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Finalize Report',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  deleteProjectDilouge(BuildContext context) {
    _realtorProvider = ref.watch(realtorprovider);
    log('and the id is -- ' +
        _complitedPhdProvider.selectedCustomer!.id!.toString());
    log('and delete id -- ' +
        _realtorProvider.singleComplitedPhdReport!.reports!.first.projectId!
            .toString());
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
            onPressed: () {
              setState(() {
                deleteProjectLoader = true;
              });
              _realtorProvider.deletePhdReport(
                  _realtorProvider
                      .singleComplitedPhdReport!.reports!.first.projectId!,
                  context);

              setState(() {
                deleteProjectLoader = false;
              });
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

  Widget propertyDetailIteams({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$key :",
            style: TextStyle(color: secondaryTextColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: 3),
          Expanded(
            child: Text(value,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget progressWidget(
      {required Size size,
      required String title,
      required String minLimit,
      required String midleLimit,
      required String maxLimit,
      required double percentag}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Container(
            width: size.width * 0.95,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(minLimit), Text(midleLimit), Text(maxLimit)],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: LinearPercentIndicator(
                    // width: size.width * 0.95,
                    padding: EdgeInsets.zero,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: percentag / 100,
                    barRadius: Radius.circular(10),
                    // center: Text("80.0%"),
                    backgroundColor: blackColor.withOpacity(0.6),
                    progressColor: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

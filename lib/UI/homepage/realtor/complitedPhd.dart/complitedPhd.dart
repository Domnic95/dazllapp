import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/complitedPhdProvider.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ComplitedPhd extends ConsumerStatefulWidget {
  const ComplitedPhd({Key? key}) : super(key: key);

  @override
  ConsumerState<ComplitedPhd> createState() => _ComplitedPhdState();
}

class _ComplitedPhdState extends ConsumerState<ComplitedPhd> {
  late ComplitedPhdProvider _complitedPhdProvider;
  late RealtorNotifier _realtorProvider;
  @override
  void initState() {
    _complitedPhdProvider = ref.read(complitedPhdProvider);
    load();
    super.initState();
  }

  load() async {
    await _complitedPhdProvider.loadComplitedPhd(ref: ref);

    _complitedPhdProvider.loader(Loading.complited);
  }

  @override
  Widget build(BuildContext context) {
    _complitedPhdProvider = ref.watch(complitedPhdProvider);
    _realtorProvider = ref.watch(realtorprovider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _complitedPhdProvider.loading == Loading.loding
          ? LoadingWidget()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonHeader(title: 'PHD Project-Summary'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child: Text("PHD Report Summary",
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
                                                "${_realtorProvider.singleComplitedPhdReport!.reports!.first.customer!.firstName} ${_realtorProvider.singleComplitedPhdReport!.reports!.first.customer!.lastName}"),
                                        propertyDetailIteams(
                                            key: "Email Address",
                                            value:
                                                "${_complitedPhdProvider.selectedCustomer?.email}"),
                                        propertyDetailIteams(
                                            key: "Property Address",
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
                                            value:
                                                "${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.bedrooms ?? 1}"),
                                        propertyDetailIteams(
                                            key: "House Size",
                                            value:
                                                "${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.grossSize ?? 2021}"),
                                        propertyDetailIteams(
                                            key: "Lot Size",
                                            value:
                                                "${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.lotSize ?? "1 "} sqft"),
                                        propertyDetailIteams(
                                            key: "Property Type",
                                            value:
                                                "${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.type ?? 1}"),
                                        propertyDetailIteams(
                                            key: "Date Updated",
                                            value:
                                                "${DateFormat("dd-MM-yyyy").format(_realtorProvider.singleComplitedPhdReport!.reports!.first.house!.updatedAt!)}"),
                                        propertyDetailIteams(
                                            key: "Bathrooms",
                                            value:
                                                "${_realtorProvider.singleComplitedPhdReport!.reports!.first.house?.bathrooms ?? 1}"),
                                        propertyDetailIteams(
                                            key: "Rooms", value: ""),
                                        propertyDetailIteams(
                                            key: "Year Built",
                                            value:
                                                "${DateFormat("dd-MM-yyyy").format(_realtorProvider.singleComplitedPhdReport!.reports!.first.house!.createdAt!)}"),
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
                          progressWidget(
                              size: size,
                              title: "Preliminary Value/Score",
                              minLimit: "\$200,000",
                              midleLimit:
                                  "\$${_realtorProvider.singleComplitedPhdReport!.reports!.first.prePrice}",
                              maxLimit: "\$2,000,000",
                              percentag: (int.parse(_realtorProvider
                                          .singleComplitedPhdReport!
                                          .reports!
                                          .first
                                          .prePrice!) /
                                      2000000) *
                                  100),
                          progressWidget(
                              size: size,
                              title: "PHD Value/Score",
                              minLimit: "\$200,000",
                              midleLimit:
                                  "\$${_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice}",
                              maxLimit: "\$2,000,000",
                              percentag: (int.parse(_realtorProvider
                                          .singleComplitedPhdReport!
                                          .reports!
                                          .first
                                          .phdPrice!) /
                                      2000000) *
                                  100),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _realtorProvider
                                    .singleComplitedPhdReport!
                                    .reports!
                                    .first
                                    .roominfo
                                    ?.length ??
                                0,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Card(
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
                                            Text(
                                              "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].roomName}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor),
                                            ),
                                            Text(
                                              "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].status ?? ""}",
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
                                        SizedBox(
                                          width: size.width,
                                          height: 80,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: _realtorProvider
                                                    .singleComplitedPhdReport!
                                                    .reports!
                                                    .first
                                                    .images
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, subIndex) {
                                              return InkWell(
                                                onTap: () {
                                                  Utils.imageInfoDialog(
                                                      context: context,
                                                      url: _realtorProvider
                                                          .singleComplitedPhdReport!
                                                          .reports!
                                                          .first
                                                          .images![subIndex]
                                                          .url
                                                          .toString(),
                                                      description: _realtorProvider
                                                          .singleComplitedPhdReport!
                                                          .reports!
                                                          .first
                                                          .images![subIndex]
                                                          .description
                                                          .toString());
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                        _realtorProvider
                                                            .singleComplitedPhdReport!
                                                            .reports!
                                                            .first
                                                            .images![subIndex]
                                                            .url
                                                            .toString(),
                                                        fit: BoxFit.contain,
                                                        height: 60),
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
                                                    .roomtypedata!
                                                    .isNotEmpty &&
                                                _realtorProvider
                                                        .singleComplitedPhdReport!
                                                        .reports!
                                                        .first
                                                        .roomtypedata!
                                                        .first
                                                        .feature !=
                                                    null
                                            ? Row(
                                                children: [
                                                  Text(
                                                      '${_realtorProvider.singleComplitedPhdReport!.reports!.first.roomtypedata!.first.feature!.name!} Type : '),
                                                  Text(
                                                      "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roomtypedata!.first.featureOptions!.name!}"),
                                                ],
                                              )
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
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Buyer Road Blocks or Recommendations",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: primaryColor),
                                        ),
                                        ListView.builder(
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
                                              return SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].featureName}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: blackColor),
                                                    ),
                                                    SizedBox(
                                                      height: 80,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        // physics:
                                                        //     NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
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
                                                        itemBuilder: (context,
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
                                                                      .roominfo![
                                                                          index]
                                                                      .feature![
                                                                          index1]
                                                                      .images![
                                                                          subIndex]
                                                                      .toString(),
                                                                  description: _realtorProvider
                                                                          .singleComplitedPhdReport!
                                                                          .reports!
                                                                          .first
                                                                          .roominfo![
                                                                              index]
                                                                          .feature![
                                                                              index1]
                                                                          .imageDesc ??
                                                                      "");
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 3),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                child: Image.network(
                                                                    _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .roominfo![
                                                                            index]
                                                                        .feature![
                                                                            index1]
                                                                        .images![
                                                                            subIndex]
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height: 60),
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
                                                            children: [
                                                              Text(
                                                                  'Comments: '),
                                                              Text(
                                                                  "${_realtorProvider.singleComplitedPhdReport!.reports!.first.roominfo![index].feature![index1].imageDesc}"),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    progressWidget(
                                                        size: size,
                                                        title: "",
                                                        minLimit: "\$200,000",
                                                        midleLimit:
                                                            "\$${_realtorProvider.singleComplitedPhdReport!.reports!.first.phdPrice}",
                                                        maxLimit: "\$2,000,000",
                                                        percentag: (int.parse(
                                                                    _realtorProvider
                                                                        .singleComplitedPhdReport!
                                                                        .reports!
                                                                        .first
                                                                        .phdPrice!) /
                                                                2000000) *
                                                            100),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Checkbox(
                                                              value: _realtorProvider
                                                                          .singleComplitedPhdReport!
                                                                          .reports!
                                                                          .first
                                                                          .roominfo![
                                                                              index]
                                                                          .feature?[
                                                                              index1]
                                                                          .bidStatus ==
                                                                      "Bid"
                                                                  ? true
                                                                  : false,
                                                              onChanged:
                                                                  (value) {},
                                                            ),
                                                            Text("Bid"),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Checkbox(
                                                              value: _realtorProvider
                                                                          .singleComplitedPhdReport!
                                                                          .reports!
                                                                          .first
                                                                          .roominfo![
                                                                              index]
                                                                          .feature?[
                                                                              index1]
                                                                          .bidStatus ==
                                                                      "D.I.Y"
                                                                  ? true
                                                                  : false,
                                                              onChanged:
                                                                  (value) {},
                                                            ),
                                                            Text("D.I.Y"),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Checkbox(
                                                              value: _realtorProvider
                                                                          .singleComplitedPhdReport!
                                                                          .reports!
                                                                          .first
                                                                          .roominfo![
                                                                              index]
                                                                          .feature?[
                                                                              index1]
                                                                          .bidStatus ==
                                                                      "Pass"
                                                                  ? true
                                                                  : false,
                                                              onChanged:
                                                                  (value) {},
                                                            ),
                                                            Text("Pass"),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),

                                        // SizedBox(
                                        //   height: 8,
                                        // ),
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
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
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
            "$key :",
            style: TextStyle(color: secondaryTextColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Text(value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        Container(
          width: size.width * 0.95,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 5,
              ),
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
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/realtor_homepage.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  load() async {
    await ref.read(realtorprovider).getrealtorproject(context);

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _realtorprovider = ref.read(realtorprovider);
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
              body: _realtorprovider.listofrealtorproject.isEmpty
                  ? Center(child: Text("No Project Found"))
                  : Container(
                      child: Column(
                        children: [
                          CommonHeader(title: "My Project", isback: false),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: _realtorprovider
                                    .listofrealtorproject.length,

                                // separatorBuilder:
                                //     (BuildContext context, int index) {
                                //   return SizedBox(
                                //     height: 0,
                                //   );
                                // },
                                itemBuilder:
                                    (BuildContext context, int widgetIndex) {
                                  return _realtorprovider
                                          .listofrealtorproject[widgetIndex]
                                          .roominfo!
                                          .isEmpty
                                      ? SizedBox()
                                      : GestureDetector(
                                          onTap: () {
                                            // _realtorprovider
                                            //         .listofrealtorproject[index]
                                            //         .roominfo!
                                            //         .isEmpty
                                            //     ? null
                                            //     : Navigator.of(context).push(
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 Realtor_project_details(
                                            //                     index: index)),
                                            //       );
                                          },
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
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 8),
                                                      title: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Padding(
                                                          //   padding:
                                                          //       const EdgeInsets
                                                          //           .only(
                                                          //           right: 8),
                                                          //   child: ClipRRect(
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   10),
                                                          //       child: SizedBox(
                                                          //         width: 50,
                                                          //         height: 50,
                                                          //         child: CachedNetworkImage(
                                                          //             errorWidget: (context, url, error) => Image.asset("assets/images/realEstate.png"),
                                                          //             imageUrl: _realtorprovider.listofrealtorproject[index].roominfo!.isEmpty
                                                          //                 ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                          //                 : _realtorprovider.listofrealtorproject[index].roominfo!.first.feature!.isEmpty
                                                          //                     ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                          //                     : _realtorprovider.listofrealtorproject[index].roominfo!.first.feature!.first.images!.isEmpty
                                                          //                         ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                          //                         : _realtorprovider.listofrealtorproject[index].roominfo!.first.feature!.first.images!.first.toString()),
                                                          //       )
                                                          //       // Image(
                                                          //       //     height: 50,
                                                          //       //     width: 50,
                                                          //       //     image: NetworkImage(),
                                                          //       //     fit: BoxFit.fill),
                                                          //       ),
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
                                                                        FontWeight
                                                                            .bold,
                                                                  )),
                                                              SizedBox(
                                                                  height: 5),
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
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ))
                                                                  : Text(
                                                                      'Room Name : ' +
                                                                          _realtorprovider
                                                                              .listofrealtorproject[widgetIndex]
                                                                              .roominfo!
                                                                              .first
                                                                              .roomName
                                                                              .toString(),
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
                                                            EdgeInsets.all(8.0),
                                                        // width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                                // color: primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .vertical(
                                                                            top:
                                                                                Radius.circular(10))),
                                                        child: Text(
                                                          "Customer Details :-",
                                                          style: TextStyle(
                                                            color: blackColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical: 4.0),
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
                                                                key: "Zip Code",
                                                                value:
                                                                    "${Detailsprovider.listofrealtorproject[widgetIndex].customer?.zipCode ?? "Unknown"}"),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          "Features",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: AppTheme
                                                                .colorPrimary,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      ListView.builder(
                                                        padding:
                                                            EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
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
                                                                        FontWeight
                                                                            .bold,
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
                                                                      (BuildContext
                                                                              context,
                                                                          int subindex) {
                                                                    return Card(
                                                                      child:
                                                                          Theme(
                                                                        data: Theme.of(context).copyWith(
                                                                            colorScheme:
                                                                                ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
                                                                        child:
                                                                            ExpansionTile(
                                                                          iconColor:
                                                                              primaryColor,
                                                                          childrenPadding: EdgeInsets.only(
                                                                              left: 15,
                                                                              bottom: 15),
                                                                          expandedAlignment:
                                                                              Alignment.topLeft,
                                                                          title: Text(
                                                                              Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureName!,
                                                                              style: TextStyle(color: AppTheme.colorPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
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
                                                                                                width: 80,
                                                                                                height: 80,
                                                                                                padding: const EdgeInsets.only(right: 3),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                                  child: CachedNetworkImage(errorWidget: (context, url, error) => Image.asset("assets/images/noimage.png"), imageUrl: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].images![imgindex]),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureoption!.isNotEmpty ? propertyDetailIteams(key: "Feature Option ", value: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].featureoption!) : SizedBox(),

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
                                                                                propertyDetailIteams(key: "Project Notes ", value: Detailsprovider.listofrealtorproject[widgetIndex].roominfo![index].feature![subindex].inspectionNotes!),

                                                                                SizedBox(
                                                                                  height: 10,
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
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RealtorHomePage(),
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

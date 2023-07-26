import 'package:carousel_slider/carousel_slider.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Project_Details extends StatefulHookWidget {
  int index;
  Project_Details({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<Project_Details> createState() => _Project_DetailsState();
}

class _Project_DetailsState extends State<Project_Details> {
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final projectprovider = useProvider(customernotifier);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
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
                    "Project Details",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: lightColor.withOpacity(.9),
                        ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // projectprovider.listofproject[widget.index].roominfo!.isEmpty&&
              // projectprovider.listofproject[widget.index].roominfo!.first.feature!.isEmpty&&
              // projectprovider.listofproject[widget.index].roominfo!.first.feature!.first.images!. isEmpty
              //     ? SizedBox()
              //     : CarouselSlider.builder(
              //         itemCount: projectprovider
              //             .listofproject[widget.index].roominfo!.first.feature!.first.images!.length,
              //         itemBuilder: (BuildContext context, int itemIndex,
              //                 int pageViewIndex) =>
              //             Container(
              //           child: Container(
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: NetworkImage(projectprovider
              //                       .listofproject[widget.index].roominfo!.first.feature!.first
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
              SizedBox(height: 30),
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: projectprovider
                      .listofproject[widget.index].roominfo!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: projectprovider.listofproject[widget.index]
                            .roominfo![index].feature!.length,
                        itemBuilder: (BuildContext context, int subindex) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.fromSwatch()
                                        .copyWith(secondary: Colors.black)),
                                child: ExpansionTile(
                                  childrenPadding:
                                      EdgeInsets.only(left: 15, bottom: 15),
                                  expandedAlignment: Alignment.topLeft,
                                  title: Text(
                                      projectprovider
                                          .listofproject[widget.index]
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
                                        Text(
                                          "Feature Option : " +
                                              projectprovider
                                                  .listofproject[widget.index]
                                                  .roominfo![index]
                                                  .feature![subindex]
                                                  .featureoption!,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: projectprovider
                                              .listofproject[widget.index]
                                              .roominfo![index]
                                              .feature![subindex]
                                              .featureissue!
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int subsubindex) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Feature Issue ${subsubindex + 1} : " +
                                                        projectprovider
                                                            .listofproject[
                                                                widget.index]
                                                            .roominfo![index]
                                                            .feature![subindex]
                                                            .featureissue![
                                                                subsubindex]
                                                            .name),
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                        Text(
                                          "Inspection Notes : " +
                                              projectprovider
                                                  .listofproject[widget.index]
                                                  .roominfo![index]
                                                  .feature![subindex]
                                                  .inspectionNotes!,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Issue text : " +
                                              projectprovider
                                                  .listofproject[widget.index]
                                                  .roominfo![index]
                                                  .feature![subindex]
                                                  .inspectionNotes!,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
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

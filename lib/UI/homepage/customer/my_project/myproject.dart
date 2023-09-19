import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/home/customer_homepage.dart';
import 'package:dazllapp/UI/homepage/customer/my_project/my_project_details.dart';
import 'package:dazllapp/config/app_theme.dart';
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
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await ref.read(customernotifier).myproject();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final projectprovider = ref.read(customernotifier);
    return SafeArea(
        child: loading
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
                  body: projectprovider.listofproject.isEmpty
                      ? Center(child: Text("No Projects Found"))
                      : Container(
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
                                    "My Project",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          color: lightColor.withOpacity(.9),
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: ListView.builder(
                                    // reverse: true,
                                    itemCount:
                                        projectprovider.listofproject.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                          onTap: () {
                                            projectprovider.listofproject[index]
                                                    .roominfo!.isEmpty
                                                ? null
                                                : Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Project_Details(
                                                        index: index,
                                                      ),
                                                    ),
                                                  );
                                          },
                                          child: Container(
                                            // height: 80,
                                            child: Card(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 8),
                                                    title: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                CachedNetworkImage(
                                                              height: 50,
                                                              width: 50,
                                                              imageUrl: projectprovider
                                                                      .listofproject[
                                                                          index]
                                                                      .roominfo!
                                                                      .isEmpty
                                                                  ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                                  : projectprovider
                                                                          .listofproject[
                                                                              index]
                                                                          .roominfo!
                                                                          .first
                                                                          .feature!
                                                                          .isEmpty
                                                                      ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                                      : projectprovider
                                                                              .listofproject[
                                                                                  index]
                                                                              .roominfo!
                                                                              .first
                                                                              .feature!
                                                                              .first
                                                                              .images!
                                                                              .isEmpty
                                                                          ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                                          : projectprovider
                                                                              .listofproject[index]
                                                                              .roominfo!
                                                                              .first
                                                                              .feature!
                                                                              .first
                                                                              .images!
                                                                              .first
                                                                              .toString(),
                                                              // placeholder: (context,
                                                              //         url) =>
                                                              //     CircularProgressIndicator(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Image.network(
                                                                      "https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75"),
                                                            ),
                                                            // Image(
                                                            //     height: 50,
                                                            //     width: 50,
                                                            //     image:
                                                            //      NetworkImage(
                                                            //       ),
                                                            //     fit: BoxFit
                                                            //         .fitWidth),
                                                          ),
                                                        ),
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
                                                                    projectprovider
                                                                        .listofproject[
                                                                            index]
                                                                        .projectId
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                )),
                                                            SizedBox(height: 5),
                                                            projectprovider
                                                                    .listofproject[
                                                                        index]
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
                                                                          FontWeight
                                                                              .bold,
                                                                    ))
                                                                : Text(
                                                                    'Room Name : ' +
                                                                        projectprovider
                                                                            .listofproject[
                                                                                index]
                                                                            .roominfo!
                                                                            .first
                                                                            .roomName
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                    },
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                            ],
                          ),
                        ),
                ),
              ));
  }
}

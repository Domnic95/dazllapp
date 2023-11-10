import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/realtor_project_details.dart';
import 'package:dazllapp/UI/homepage/realtor/realtor_homepage.dart';
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
                                itemBuilder: (BuildContext context, int index) {
                                  return _realtorprovider
                                          .listofrealtorproject[index]
                                          .roominfo!
                                          .isEmpty
                                      ? SizedBox()
                                      : GestureDetector(
                                          onTap: () {
                                            _realtorprovider
                                                    .listofrealtorproject[index]
                                                    .roominfo!
                                                    .isEmpty
                                                ? null
                                                : Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Realtor_project_details(
                                                                index: index)),
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
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child: CachedNetworkImage(
                                                                    errorWidget: (context, url, error) => Image.asset("assets/images/realEstate.png"),
                                                                    imageUrl: _realtorprovider.listofrealtorproject[index].roominfo!.isEmpty
                                                                        ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                                        : _realtorprovider.listofrealtorproject[index].roominfo!.first.feature!.isEmpty
                                                                            ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                                            : _realtorprovider.listofrealtorproject[index].roominfo!.first.feature!.first.images!.isEmpty
                                                                                ? 'https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75'
                                                                                : _realtorprovider.listofrealtorproject[index].roominfo!.first.feature!.first.images!.first.toString()),
                                                              )
                                                              // Image(
                                                              //     height: 50,
                                                              //     width: 50,
                                                              //     image: NetworkImage(),
                                                              //     fit: BoxFit.fill),
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
                                                                    _realtorprovider
                                                                        .listofrealtorproject[
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
                                                            _realtorprovider
                                                                    .listofrealtorproject[
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
                                                                        _realtorprovider
                                                                            .listofrealtorproject[
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
}

// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/professional/Company_profile/Edit_profile.dart';
import 'package:dazllapp/UI/homepage/professional/Company_profile/webview_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyProfile extends ConsumerStatefulWidget {
  CompanyProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends ConsumerState<CompanyProfile> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await ref.read(professionaltifier).getProfessional();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _profileNotifier = ref.read(professionaltifier);
    final size = MediaQuery.of(context).size;
    return loading
        ? LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Column(
              children: [
                CommonHeader(title: "Company Profile", isback: false),
                // Container(
                //   height: size.height * 0.09,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(20),
                //         bottomRight: Radius.circular(20),
                //       ),
                //       color: AppTheme.colorPrimary),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Company Profile",
                //         style:
                //             Theme.of(context).textTheme.bodyText1!.copyWith(
                //                   fontSize: 14,
                //                   color: lightColor.withOpacity(.9),
                //                 ),
                //       ),
                //       SizedBox(
                //         height: 5,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(
                //             'YEARS IN BUSINESS : ',
                //             style: TextStyle(
                //               fontSize: 12,
                //               color: Colors.white,
                //             ),
                //           ),
                //           _profileNotifier.professionalData.yearsInBusiness ==
                //                   null
                //               ? Text(
                //                   'Add your Years in Bussiness',
                //                   style: TextStyle(
                //                       fontSize: 12, color: Colors.white),
                //                 )
                //               : Text(
                //                   _profileNotifier
                //                       .professionalData.yearsInBusiness
                //                       .toString(),
                //                   style: TextStyle(
                //                     fontSize: 12,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   'YEARS IN BUSINESS : ',
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     color: blackColor,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // _profileNotifier.professionalData.yearsInBusiness == null
                      //     ? Text(
                      //         'Add your Years in Bussiness',
                      //         style: TextStyle(fontSize: 12, color: blackColor),
                      //       )
                      //     : Text(
                      //         _profileNotifier.professionalData.yearsInBusiness
                      //             .toString(),
                      //         style: TextStyle(
                      //           fontSize: 12,
                      //           color: blackColor,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'INFORMATION : ',
                                  style: TextStyle(fontSize: 15),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Edit_profile()));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 14,
                                    child: Icon(
                                      Icons.edit,
                                      size: 14,
                                      color: AppTheme.colorPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.person,
                                    ),
                                    title: Text(
                                      'Name : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier
                                                    .professionalData.name ==
                                                '' ||
                                            _profileNotifier
                                                    .professionalData.name ==
                                                null
                                        ? Text(
                                            'Add your Name',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor),
                                          )
                                        : Text(
                                            _profileNotifier
                                                .professionalData.name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: blackColor),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                    ),
                                    title: Text(
                                      'Phone : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier
                                                    .professionalData.phone ==
                                                '' ||
                                            _profileNotifier
                                                    .professionalData.phone ==
                                                null
                                        ? Text(
                                            'Add your Phone No',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor),
                                          )
                                        : Text(
                                            _profileNotifier
                                                .professionalData.phone
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: blackColor),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.email,
                                    ),
                                    title: Text(
                                      'Email : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier
                                                .professionalData.email ==
                                            ''
                                        ? Text(
                                            'Add your Email',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor),
                                          )
                                        : Text(
                                            _profileNotifier
                                                .professionalData.email
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: blackColor),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                      leading: Icon(Icons.location_on_rounded),
                                      title: Text(
                                        'Address : ',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      subtitle: _profileNotifier
                                                  .professionalData.address ==
                                              ''
                                          ? Text(
                                              'Add your Address',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          : Text.rich(TextSpan(
                                              text: _profileNotifier
                                                          .professionalData
                                                          .address ==
                                                      null
                                                  ? 'Add your Address'
                                                  : _profileNotifier
                                                      .professionalData.address
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor),
                                              children: [
                                                  TextSpan(
                                                      text: ",  City : ",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: blackColor)),
                                                  TextSpan(
                                                      text: _profileNotifier
                                                          .professionalData.city
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: blackColor)),
                                                  TextSpan(
                                                      text: ", State : ",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: blackColor)),
                                                  TextSpan(
                                                      text: _profileNotifier
                                                          .professionalData
                                                          .state
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: blackColor))
                                                ]))
                                      // Text(
                                      //     _profileNotifier
                                      //         .professionalData.address
                                      //         .toString(),
                                      //     style: TextStyle(
                                      //       fontSize: 13,
                                      //     ),
                                      //   ),
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // ListTile(
                                  //   leading: Icon(
                                  //     Icons.article,
                                  //   ),
                                  //   title: Text(
                                  //     'Business license : ',
                                  //     style: TextStyle(
                                  //       fontSize: 14,
                                  //     ),
                                  //   ),
                                  //   subtitle: _profileNotifier
                                  //               .professionalData
                                  //               .businessLicence ==
                                  //           ''
                                  //       ? Text(
                                  //           'Add your Bussiness Licence',
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         )
                                  //       : Text(
                                  //           _profileNotifier.professionalData
                                  //               .businessLicence
                                  //               .toString(),
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 12, right: 12),
                                  //   child: Divider(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  ListTile(
                                    leading: Icon(Icons.assignment),
                                    title: Text(
                                      'Company Name : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier.professionalData
                                                .insuranceCertificate ==
                                            ''
                                        ? Text(
                                            'Add your Company Name',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        : Text(
                                            _profileNotifier.professionalData
                                                .insuranceCertificate
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.person,
                                    ),
                                    title: Text(
                                      'Insurance Contact : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier.professionalData
                                                .insuranceContactNumber ==
                                            ''
                                        ? Text(
                                            'Add your Insurance Contact Person Number',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        : Text(
                                            _profileNotifier.professionalData
                                                .insuranceContactNumber
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                    ),
                                    title: Text(
                                      'Agent Phone Number :',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier.professionalData
                                                .insuranceNumber ==
                                            ''
                                        ? Text(
                                            'Add your Insurance Number',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        : Text(
                                            _profileNotifier.professionalData
                                                .insuranceNumber
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                 
                              
                               Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.business_outlined),
                                    title: Text(
                                      'Years In Business : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier.professionalData
                                                    .yearsInBusiness ==
                                                null 
                                        ? Text(
                                            'Years In Business',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        : Text(
                                            _profileNotifier.professionalData
                                                .yearsInBusiness
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                              
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.local_parking_outlined),
                                    title: Text(
                                      'Project Portfolio : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: _profileNotifier.professionalData
                                                    .projectPortfolio ==
                                                null ||
                                            _profileNotifier.professionalData
                                                .projectPortfolio!.isEmpty
                                        ? Text(
                                            'Add your Project portfolio',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        : Text(
                                            _profileNotifier.professionalData
                                                .projectPortfolio
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 12, right: 12),
                                  //   child: Divider(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  // ListTile(
                                  //   leading: Icon(Icons.link),
                                  //   title: Text(
                                  //     'References : ',
                                  //     style: TextStyle(
                                  //       fontSize: 14,
                                  //     ),
                                  //   ),
                                  //   subtitle: _profileNotifier
                                  //               .professionalData
                                  //               .references ==
                                  //           ''
                                  //       ? Text(
                                  //           'Add your References',
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         )
                                  //       : Text(
                                  //           _profileNotifier
                                  //               .professionalData.references
                                  //               .toString(),
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 12, right: 12),
                                  //   child: Divider(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  // ListTile(
                                  //   onTap: () {
                                  //     String url = _profileNotifier
                                  //         .professionalData.website
                                  //         .toString();
                                  //     _profileNotifier
                                  //                 .professionalData.website !=
                                  //             ''
                                  //         ? Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     webview_screen(url)))
                                  //         : null;
                                  //   },
                                  //   leading: Icon(Icons.language),
                                  //   title: Text(
                                  //     'Website : ',
                                  //     style: TextStyle(
                                  //       fontSize: 14,
                                  //     ),
                                  //   ),
                                  //   subtitle: _profileNotifier
                                  //               .professionalData.website ==
                                  //           ''
                                  //       ? Text(
                                  //           'Add your Website',
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         )
                                  //       : Text(
                                  //           _profileNotifier
                                  //               .professionalData.website
                                  //               .toString(),
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //             color: Colors.blue,
                                  //           ),
                                  //         ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 12, right: 12),
                                  //   child: Divider(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  // ListTile(
                                  //   onTap: () {
                                  //     String url = _profileNotifier
                                  //         .professionalData.facebook
                                  //         .toString();
                                  //     _profileNotifier.professionalData
                                  //                 .facebook !=
                                  //             ''
                                  //         ? Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     webview_screen(url)))
                                  //         : null;
                                  //   },
                                  //   leading: Icon(Icons.facebook_rounded),
                                  //   title: Text(
                                  //     'FaceBook : ',
                                  //     style: TextStyle(
                                  //       fontSize: 14,
                                  //     ),
                                  //   ),
                                  //   subtitle: _profileNotifier
                                  //               .professionalData.facebook ==
                                  //           ''
                                  //       ? Text(
                                  //           'Add your Facebook ',
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         )
                                  //       : Text(
                                  //           _profileNotifier
                                  //               .professionalData.facebook
                                  //               .toString(),
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //             color: Colors.blue,
                                  //           ),
                                  //         ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 12, right: 12),
                                  //   child: Divider(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  // ListTile(
                                  //   onTap: () {
                                  //     String url = _profileNotifier
                                  //         .professionalData.twitter
                                  //         .toString();
                                  //     _profileNotifier
                                  //                 .professionalData.twitter !=
                                  //             ''
                                  //         ? Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     webview_screen(url)))
                                  //         : null;
                                  //   },
                                  //   leading: FaIcon(FontAwesomeIcons.twitter),
                                  //   title: Text(
                                  //     'Twitter : ',
                                  //     style: TextStyle(
                                  //       fontSize: 14,
                                  //     ),
                                  //   ),
                                  //   subtitle: _profileNotifier
                                  //               .professionalData.twitter ==
                                  //           ''
                                  //       ? Text(
                                  //           'Add your Twitter ',
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //           ),
                                  //         )
                                  //       : Text(
                                  //           _profileNotifier
                                  //               .professionalData.twitter
                                  //               .toString(),
                                  //           style: TextStyle(
                                  //             fontSize: 13,
                                  //             color: Colors.blue,
                                  //           ),
                                  //         ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 90,
                                    width: 90,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: _profileNotifier
                                                    .professionalData.images1 ==
                                                ""
                                            ? Center(child: SizedBox())
                                            : Center(
                                                child: CachedNetworkImage(
                                                imageUrl: _profileNotifier
                                                    .professionalData.images1
                                                    .toString(),fit: BoxFit.cover,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        SizedBox(),
                                              ))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 90,
                                    width: 90,
                                    
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: _profileNotifier
                                                    .professionalData.images2 ==
                                                ""
                                            ? Center(child: SizedBox())
                                            : Center(
                                                child: CachedNetworkImage(
                                                imageUrl: _profileNotifier
                                                    .professionalData.images2
                                                    .toString(),fit: BoxFit.cover,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        SizedBox(),
                                              ))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 90,
                                    width: 90,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: _profileNotifier
                                                    .professionalData.images3 ==
                                                ""
                                            ? Center(child: SizedBox())
                                            : Center(
                                                child: CachedNetworkImage(
                                                imageUrl: _profileNotifier
                                                    .professionalData.images3
                                                    .toString(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        SizedBox(),
                                              ))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 90,
                                    width: 90,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: _profileNotifier
                                                    .professionalData.images4 ==
                                                ""
                                            ? Center(child: SizedBox())
                                            : Center(
                                                child: CachedNetworkImage(
                                                imageUrl: _profileNotifier
                                                    .professionalData.images4
                                                    .toString(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        SizedBox(),
                                              ))),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.all(10.0),
                //     child: Align(
                //       alignment: Alignment.bottomCenter,
                //       child: Container(
                //         height: size.height * 0.35,
                //         child: GridView.builder(
                //           itemCount: images.length,
                //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //               mainAxisExtent: 120,
                //               crossAxisSpacing: 20,
                //               mainAxisSpacing: 20,
                //               crossAxisCount: 2),
                //           itemBuilder: (context, index) {
                //             return Container(
                //               decoration: BoxDecoration(
                //                 color: AppTheme.white,
                //                 // borderRadius: BorderRadius.circular(20),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: AppTheme.grey.withOpacity(0.5),
                //                     blurRadius: 3,
                //                     offset: Offset(3, 3),
                //                   ),
                //                 ],
                //                 image: DecorationImage(
                //                   image: NetworkImage(images[index]),
                //                   fit: BoxFit.cover,
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
  }
}

// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, unused_import

import 'package:dazllapp/UI/homepage/professional/Company_profile/Edit_profile.dart';
import 'package:dazllapp/UI/homepage/professional/webview_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Company_profile extends StatefulHookWidget {
  Company_profile({Key? key}) : super(key: key);

  @override
  State<Company_profile> createState() => _Company_profileState();
}

class _Company_profileState extends State<Company_profile> {
  // List images = [
  //   "https://dazlpro.com/_next/static/image/Modules/CompanyProfile/Views/FirstForm/realtorBackGround.3b3d6cd5b7e04669508cd69684d7a842.jpg",
  //   "https://dazlpro.com/_next/static/image/Modules/CompanyProfile/Views/FirstForm/realtorBackGround.3b3d6cd5b7e04669508cd69684d7a842.jpg",
  //   "https://dazlpro.com/_next/static/image/Modules/CompanyProfile/Views/FirstForm/realtorBackGround.3b3d6cd5b7e04669508cd69684d7a842.jpg",
  //   "https://dazlpro.com/_next/static/image/Modules/CompanyProfile/Views/FirstForm/realtorBackGround.3b3d6cd5b7e04669508cd69684d7a842.jpg",
  // ];
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await context.read(profileprovider).getprofile();
  }

  @override
  Widget build(BuildContext context) {
    final _profileNotifier = useProvider(profileprovider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppTheme.colorPrimary),
              child: Column(
                children: [
                  Text(
                    "Company Profile",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: lightColor.withOpacity(.9),
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'YEARS IN BUSINESS : ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      _profileNotifier.profiles.yearsInBusiness.toString() ==
                              'null'
                          ? Text(
                              'Add your Years in Bussiness',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            )
                          : Text(
                              _profileNotifier.profiles.yearsInBusiness
                                  .toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Edit_profile()));
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
                                subtitle:
                                    _profileNotifier.profiles.name.toString() ==
                                            'null'
                                        ? Text(
                                            'Add your Name',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        : Text(
                                            _profileNotifier.profiles.name
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
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
                                subtitle: _profileNotifier.profiles.phone
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your Phone No',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier.profiles.phone
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
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
                                subtitle: _profileNotifier.profiles.email
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your Email',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier.profiles.email
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.person,
                                ),
                                title: Text(
                                  'Address : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: _profileNotifier.profiles.address
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your Address',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier.profiles.address
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.article,
                                ),
                                title: Text(
                                  'Business license : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: _profileNotifier
                                            .profiles.businessLicence
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your Bussiness Licence',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier
                                            .profiles.businessLicence
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.assignment),
                                title: Text(
                                  'Insurance Certificate : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: _profileNotifier
                                            .profiles.insuranceCertificate
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your Insurance Certificate',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier
                                            .profiles.insuranceCertificate
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
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
                                subtitle: _profileNotifier
                                                .profiles.projectPortfolio
                                                .toString() ==
                                            'null' ||
                                        _profileNotifier
                                                .profiles.projectPortfolio
                                                .toString() ==
                                            '[]'
                                    ? Text(
                                        'Add your Project portfolio',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier
                                            .profiles.projectPortfolio
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.link),
                                title: Text(
                                  'References : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: _profileNotifier.profiles.references
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your References',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier.profiles.references
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  String url = _profileNotifier.profiles.website
                                      .toString();
                                  _profileNotifier.profiles.website
                                              .toString() !=
                                          'null'
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  webview_screen(url)))
                                      : null;
                                },
                                leading: Icon(Icons.webhook_sharp),
                                title: Text(
                                  'Website : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: _profileNotifier.profiles.website
                                            .toString() ==
                                        'null'
                                    ? Text(
                                        'Add your Website',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        _profileNotifier.profiles.website
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.blue,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                          size: 14,
                          color: AppTheme.white,
                        ),
                        Text(
                          "Previous",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14,
                                    color: lightColor.withOpacity(.9),
                                  ),
                        )
                      ],
                    ),
                  ),
                ],
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
      ),
    );
  }
}

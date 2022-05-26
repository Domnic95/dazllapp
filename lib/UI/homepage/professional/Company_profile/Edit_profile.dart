// ignore_for_file: camel_case_types, file_names, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Edit_profile extends StatefulHookWidget {
  Edit_profile({Key? key}) : super(key: key);

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await context.read(profileprovider).getprofile();
  }

  final _yearsinbussiness = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _Address = TextEditingController();
  final _bussiness_licence = TextEditingController();
  final _insurance_certificate = TextEditingController();
  final _project_portfolio = TextEditingController();
  final _reference = TextEditingController();
  final _website = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _profileNotifier = useProvider(profileprovider);
    _yearsinbussiness.text =
        _profileNotifier.profiles.yearsInBusiness.toString() != 'null'
            ? _profileNotifier.profiles.yearsInBusiness.toString()
            : '';
    _name.text = _profileNotifier.profiles.name.toString() != 'null'
        ? _profileNotifier.profiles.name.toString()
        : '';
    _phone.text = _profileNotifier.profiles.phone.toString() != 'null'
        ? _profileNotifier.profiles.phone.toString()
        : '';
    _Address.text = _profileNotifier.profiles.address.toString() != 'null'
        ? _profileNotifier.profiles.address.toString()
        : '';
    _bussiness_licence.text =
        _profileNotifier.profiles.businessLicence.toString() != 'null'
            ? _profileNotifier.profiles.businessLicence.toString()
            : '';
    _insurance_certificate.text =
        _profileNotifier.profiles.insuranceCertificate.toString() != 'null'
            ? _profileNotifier.profiles.insuranceCertificate.toString()
            : '';
    _project_portfolio.text =
        _profileNotifier.profiles.projectPortfolio.toString() == 'null' ||
                _profileNotifier.profiles.projectPortfolio.toString() == '[]'
            ? ""
            : _profileNotifier.profiles.projectPortfolio.toString();
    _reference.text = _profileNotifier.profiles.references.toString() != 'null'
        ? _profileNotifier.profiles.references.toString()
        : '';
    _website.text = _profileNotifier.profiles.website.toString() != 'null'
        ? _profileNotifier.profiles.website.toString()
        : '';
    final size = MediaQuery.of(context).size;
    return Form(
      child: SafeArea(
        child: Scaffold(
            body: Column(
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
                  "Edit Profile",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enter Your Details : ',
                              style: TextStyle(fontSize: 15),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  _yearsinbussiness.clear();
                                  _name.clear();
                                  _phone.clear();
                                  _Address.clear();
                                  _bussiness_licence.clear();
                                  _insurance_certificate.clear();
                                  _project_portfolio.clear();
                                  _reference.clear();
                                  _website.clear();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.save,
                                      size: 20,
                                      color: AppTheme.colorPrimary,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: AppTheme.colorPrimary),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _yearsinbussiness,
                          // validator: (text) {
                          //   if (text!.isEmpty) {
                          //     return 'Address can\'t be empty';
                          //   }
                          //   return null;
                          // },
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter YEARS IN BUSSINESS",
                            label: Text('YEARS IN BUSSINESS'),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _name,
                          // validator: (text) {
                          //   if (text!.isEmpty) {
                          //     return 'First Name can\'t be empty';
                          //   }
                          //   return null;
                          // },
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",
                            label: Text('NAME'),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _phone,
                          // validator: (text) {
                          //   if (text!.isEmpty) {
                          //     return 'Last Name can\'t be empty';
                          //   }
                          //   return null;
                          // },
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Phone",
                            label: Text('Phone No'),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _Address,
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Address",
                            label: Text("ADDRESS"),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _bussiness_licence,
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Bussiness Licence",
                            label: Text("BUSSINESS LICENCE"),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _insurance_certificate,
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Insurance Certificate",
                            label: Text("INSURANCE CERTIFICATE"),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _project_portfolio,
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Project Portfolio",
                            label: Text("PROJECT PORTFOLIO"),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _reference,
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Refrence",
                            label: Text("REFRENCE"),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _website,
                          cursorColor: AppTheme.nearlyBlack,
                          decoration: InputDecoration(
                            hintText: "Enter Your Website",
                            label: Text("WEBSITE"),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black)),
                            hintStyle: TextStyle(
                                color: AppTheme.darkerText,
                                fontFamily: AppTheme.fontName,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelStyle: TextStyle(
                                color: const Color(0xFF424242),
                                fontFamily: AppTheme.fontName,
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, file_names, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'dart:io';

import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/tell_us_more.dart';
import 'package:dazllapp/UI/homepage/professional/Company_profile/company_profile.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Edit_profile extends ConsumerStatefulWidget {
  Edit_profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends ConsumerState<Edit_profile> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await ref.read(professionaltifier).getProfessional();
  }

  File? _image;
  File? _image2;
  File? _image3;
  File? _image4;
  final ImagePicker _picker = ImagePicker();
  final _yearsinbussiness = TextEditingController();
  final email = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _Address = TextEditingController();
  final _bussiness_licence = TextEditingController();
  final _insurance_certificate = TextEditingController();
  final _project_portfolio = TextEditingController();
  final _reference = TextEditingController();
  final _website = TextEditingController();
  final _facebook = TextEditingController();
  final _twitter = TextEditingController();
  final _insuranceContactPerson = TextEditingController();
  final _insuranceNumber = TextEditingController();

  void _showPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPickerDialog2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage2(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage2(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

 void _showPickerDialog3() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage3(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage3(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
 void _showPickerDialog4() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage4(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage4(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

 
  // Function to pick an image
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _pickImage2(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image2 = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  Future<void> _pickImage3(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image3 = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  Future<void> _pickImage4(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image4 = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _profileNotifier = ref.read(professionaltifier);
    _yearsinbussiness.text =
        _profileNotifier.professionalData.yearsInBusiness.toString() != 'null'
            ? _profileNotifier.professionalData.yearsInBusiness.toString()
            : '';
    _name.text = _profileNotifier.professionalData.name.toString() != 'null'
        ? _profileNotifier.professionalData.name.toString()
        : '';

    email.text = _profileNotifier.professionalData.email.toString() != 'null'
        ? _profileNotifier.professionalData.email.toString()
        : '';
    city.text = _profileNotifier.professionalData.city.toString() != 'null'
        ? _profileNotifier.professionalData.city.toString()
        : '';
    state.text = _profileNotifier.professionalData.state.toString() != 'null'
        ? _profileNotifier.professionalData.state.toString()
        : '';

    _phone.text = _profileNotifier.professionalData.phone.toString() != 'null'
        ? _profileNotifier.professionalData.phone.toString()
        : '';
    _Address.text =
        _profileNotifier.professionalData.address.toString() != 'null'
            ? _profileNotifier.professionalData.address.toString()
            : '';
    _bussiness_licence.text =
        _profileNotifier.professionalData.businessLicence.toString() != 'null'
            ? _profileNotifier.professionalData.businessLicence.toString()
            : '';
    _insurance_certificate.text =
        _profileNotifier.professionalData.insuranceCertificate.toString() !=
                'null'
            ? _profileNotifier.professionalData.insuranceCertificate.toString()
            : '';
    _project_portfolio.text =
        _profileNotifier.professionalData.projectPortfolio.toString() ==
                    'null' ||
                _profileNotifier.professionalData.projectPortfolio.toString() ==
                    '[]'
            ? ""
            : _profileNotifier.professionalData.projectPortfolio.toString();
    _reference.text =
        _profileNotifier.professionalData.references.toString() != 'null'
            ? _profileNotifier.professionalData.references.toString()
            : '';
    _website.text =
        _profileNotifier.professionalData.website.toString() != 'null'
            ? _profileNotifier.professionalData.website.toString()
            : '';
    _facebook.text =
        _profileNotifier.professionalData.facebook.toString() != 'null'
            ? _profileNotifier.professionalData.facebook.toString()
            : '';
    _twitter.text =
        _profileNotifier.professionalData.twitter.toString() != 'null'
            ? _profileNotifier.professionalData.twitter.toString()
            : '';
    _insuranceContactPerson.text = _profileNotifier
                .professionalData.insuranceContactNumber
                .toString() !=
            'null'
        ? _profileNotifier.professionalData.insuranceContactNumber.toString()
        : '';
    _insuranceNumber.text =
        _profileNotifier.professionalData.insuranceNumber.toString() != 'null'
            ? _profileNotifier.professionalData.insuranceNumber.toString()
            : '';
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        child: Scaffold(
            body: Column(
          children: [
            CommonHeader(title: "Edit Profile", isback: false),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enter Your Details : ',
                            style: TextStyle(fontSize: 15),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onPressed: () async {
                                if (_phone.text.length != 10) {
                                  toastShowError(context,
                                      'please enter correct phone number');
                                  //                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  // content: Text('please enter correct phone number'),
                                  // backgroundColor: primaryColor));
                                } else {
                                  Map<String, dynamic> data = {
                                    "name": _name.text,
                                    "phone": _phone.text,
                                    "address": _Address.text,
                                    "references": _reference.text,
                                    // "website": "dazl",
                                    // "twitter": null,
                                    // "facebook": null,
                                    "company_city": city.text,
                                    "state": state.text,
                                    "email": email.text,
                                    'insurance_certificate':
                                        _insurance_certificate.text,
                                    'insurance_contact_number':
                                        _insuranceContactPerson.text,
                                    // "description": "",
                                    // "business_licence": "",
                                    // "project_portfolio": [],
                                    "years_in_business": _yearsinbussiness.text,

                                    'images1': _image == null
                                        ? (_profileNotifier
                                                    .professionalData.images1 !=
                                                null
                                            ? _profileNotifier
                                                .professionalData.images1
                                            : '')
                                        : await _profileNotifier
                                            .uploadImage(_image!),
                                    'images2': _image2 == null
                                        ? (_profileNotifier
                                                    .professionalData.images2 !=
                                                null
                                            ? _profileNotifier
                                                .professionalData.images2
                                            : '')
                                        : await _profileNotifier
                                            .uploadImage(_image2!),
                                               'images3': _image3 == null
                                        ? (_profileNotifier
                                                    .professionalData.images3 !=
                                                null
                                            ? _profileNotifier
                                                .professionalData.images3
                                            : '')
                                        : await _profileNotifier
                                            .uploadImage(_image3!),
                                               'images4': _image4 == null
                                        ? (_profileNotifier
                                                    .professionalData.images4 !=
                                                null
                                            ? _profileNotifier
                                                .professionalData.images4
                                            : '')
                                        : await _profileNotifier
                                            .uploadImage(_image4!),
                                    // "insurance_certificate": "",
                                  };
                                  _profileNotifier
                                      .updateProfessional(data)
                                      .then((value) {
                                    toastShowSuccess(context, '${value['message']}');
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(SnackBar(
                                    //   content: Text(value['message']),
                                    //   backgroundColor: teamColor,
                                    // ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompanyProfile()));
                                  });

                                  _yearsinbussiness.clear();
                                  _name.clear();
                                  _phone.clear();
                                  _Address.clear();
                                  _bussiness_licence.clear();
                                  _insurance_certificate.clear();
                                  _project_portfolio.clear();
                                  _reference.clear();
                                  _insuranceContactPerson.clear();
                                  _website.clear();
                                  _facebook.clear();
                                  _twitter.clear();
                                  city.clear();
                                  email.clear();
                                  state.clear();
                                  _insuranceNumber.clear();
                                  _image = null;
                                  _image2 = null;
                                  _image3 = null;
                                  _image4 = null;
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.save,
                                    size: 20,
                                    color: lightColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      'Save',
                                      style: TextStyle(color: lightColor),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: city,
                        // validator: (text) {
                        //   if (text!.isEmpty) {
                        //     return 'First Name can\'t be empty';
                        //   }
                        //   return null;
                        // },
                        cursorColor: AppTheme.nearlyBlack,
                        decoration: InputDecoration(
                          hintText: "Enter Your City",
                          label: Text('CITY'),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: state,
                        // validator: (text) {
                        //   if (text!.isEmpty) {
                        //     return 'First Name can\'t be empty';
                        //   }
                        //   return null;
                        // },
                        cursorColor: AppTheme.nearlyBlack,
                        decoration: InputDecoration(
                          hintText: "Enter Your State",
                          label: Text('STATE'),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            counter: SizedBox()),
                        maxLength: 10,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: email,
                        // validator: (text) {
                        //   if (text!.isEmpty) {
                        //     return 'First Name can\'t be empty';
                        //   }
                        //   return null;
                        // },
                        cursorColor: AppTheme.nearlyBlack,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          label: Text('EMAIL'),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // TextField(
                      //   controller: _bussiness_licence,
                      //   cursorColor: AppTheme.nearlyBlack,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Your Bussiness Licence",
                      //     label: Text("BUSSINESS LICENCE"),
                      //     isDense: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         borderSide: BorderSide(color: Colors.black)),
                      //     hintStyle: TextStyle(
                      //         color: AppTheme.darkerText,
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     labelStyle: TextStyle(
                      //         color: const Color(0xFF424242),
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      TextField(
                        controller: _insurance_certificate,
                        cursorColor: AppTheme.nearlyBlack,
                        decoration: InputDecoration(
                          hintText: "Enter Your Company Name",
                          label: Text("Company Name".toUpperCase()),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _insuranceContactPerson,
                        cursorColor: AppTheme.nearlyBlack,
                        decoration: InputDecoration(
                          hintText: "Enter Your Insurance Contact Person",
                          label: Text("INSURANCE CONTACT PERSON"),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      TextField(
                        controller: _insuranceNumber,
                        cursorColor: AppTheme.nearlyBlack,
                        decoration: InputDecoration(
                          hintText: "Enter Your Insurance Number",
                          label: Text("INSURANCE NUMBER"),
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // TextField(
                      //   controller: _project_portfolio,
                      //   cursorColor: AppTheme.nearlyBlack,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Your Project Portfolio",
                      //     label: Text("PROJECT PORTFOLIO"),
                      //     isDense: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         borderSide: BorderSide(color: Colors.black)),
                      //     hintStyle: TextStyle(
                      //         color: AppTheme.darkerText,
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     labelStyle: TextStyle(
                      //         color: const Color(0xFF424242),
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      Wrap(
                     
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _image != null
                                    ? Image.file(
                                        _image!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : _profileNotifier.professionalData.images1 !=
                                            null
                                        ? Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        _profileNotifier
                                                            .professionalData
                                                            .images1
                                                            .toString()),
                                                    fit: BoxFit.cover),
                                                border: Border.all(
                                                    color: primaryColor)),
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload,
                                                  color:
                                                      blackColor.withOpacity(0.5),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                    child: Text(
                                                        "Profile".toUpperCase())),
                                              ],
                                            )),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _showPickerDialog,
                                  child: Text("Choose Image".toUpperCase()),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _image2 != null
                                    ? Image.file(
                                        _image2!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : _profileNotifier.professionalData.images2 !=
                                            null
                                        ? Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        _profileNotifier
                                                            .professionalData
                                                            .images2
                                                            .toString()),
                                                    fit: BoxFit.cover),
                                                border: Border.all(
                                                    color: primaryColor)),
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload,
                                                  color:
                                                      blackColor.withOpacity(0.5),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                    child: Text(
                                                        "Profile".toUpperCase())),
                                              ],
                                            )),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _showPickerDialog2,
                                  child: Text("Choose Image".toUpperCase()),
                                ),
                              ],
                            ),
                          )
                       
                       
                        ,Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              children: [
                                _image3 != null
                                    ? Image.file(
                                        _image3!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : _profileNotifier.professionalData.images3 !=
                                            null
                                        ? Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        _profileNotifier
                                                            .professionalData
                                                            .images3
                                                            .toString()),
                                                    fit: BoxFit.cover),
                                                border: Border.all(
                                                    color: primaryColor)),
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload,
                                                  color:
                                                      blackColor.withOpacity(0.5),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                    child: Text(
                                                        "Profile".toUpperCase())),
                                              ],
                                            )),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _showPickerDialog3,
                                  child: Text("Choose Image".toUpperCase()),
                                ),
                              ],
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _image4 != null
                                    ? Image.file(
                                        _image4!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : _profileNotifier.professionalData.images4 !=
                                            null
                                        ? Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        _profileNotifier
                                                            .professionalData
                                                            .images4
                                                            .toString()),
                                                    fit: BoxFit.cover),
                                                border: Border.all(
                                                    color: primaryColor)),
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload,
                                                  color:
                                                      blackColor.withOpacity(0.5),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                    child: Text(
                                                        "Profile".toUpperCase())),
                                              ],
                                            )),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _showPickerDialog4,
                                  child: Text("Choose Image".toUpperCase()),
                                ),
                              ],
                            ),
                          )
                       
                        ],
                      ),
                      // TextField(
                      //   controller: _reference,
                      //   cursorColor: AppTheme.nearlyBlack,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Your Refrence",
                      //     label: Text("REFRENCE"),
                      //     isDense: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         borderSide: BorderSide(color: Colors.black)),
                      //     hintStyle: TextStyle(
                      //         color: AppTheme.darkerText,
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     labelStyle: TextStyle(
                      //         color: const Color(0xFF424242),
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14),
                      //     border: OutlineInputBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextField(
                      //   controller: _website,
                      //   cursorColor: AppTheme.nearlyBlack,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Your Website",
                      //     label: Text("WEBSITE"),
                      //     isDense: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         borderSide: BorderSide(color: Colors.black)),
                      //     hintStyle: TextStyle(
                      //         color: AppTheme.darkerText,
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     labelStyle: TextStyle(
                      //         color: const Color(0xFF424242),
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14),
                      //     border: OutlineInputBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextField(
                      //   controller: _facebook,
                      //   cursorColor: AppTheme.nearlyBlack,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Your facebook",
                      //     label: Text("FACEBOOK"),
                      //     isDense: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         borderSide: BorderSide(color: Colors.black)),
                      //     hintStyle: TextStyle(
                      //         color: AppTheme.darkerText,
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     labelStyle: TextStyle(
                      //         color: const Color(0xFF424242),
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14),
                      //     border: OutlineInputBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextField(
                      //   controller: _twitter,
                      //   cursorColor: AppTheme.nearlyBlack,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Your Twitter",
                      //     label: Text("TWITTER"),
                      //     isDense: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //         borderSide: BorderSide(color: Colors.black)),
                      //     hintStyle: TextStyle(
                      //         color: AppTheme.darkerText,
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //     labelStyle: TextStyle(
                      //         color: const Color(0xFF424242),
                      //         fontFamily: AppTheme.fontName,
                      //         fontSize: 14),
                      //     border: OutlineInputBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   physics: BouncingScrollPhysics(),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5, right: 5),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         height: 90,
                      //         width: 90,
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(15),
                      //           child: _profileNotifier
                      //                       .professionalData.images1 ==
                      //                   ""
                      //               ? Center(
                      //                   child: Image.network(
                      //                     'https://t3.ftcdn.net/jpg/02/70/22/86/360_F_270228625_yujevz1E4E45qE1mJe3DyyLPZDmLv4Uj.jpg',
                      //                     fit: BoxFit.fill,
                      //                   ),
                      //                 )
                      //               : Image.network(
                      //                   _profileNotifier
                      //                       .professionalData.images1
                      //                       .toString(),
                      //                   fit: BoxFit.cover,
                      //                 ),
                      //         ),
                      //       ),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5, right: 5),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         height: 90,
                      //         width: 90,
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(15),
                      //           child: _profileNotifier
                      //                       .professionalData.images2 ==
                      //                   ""
                      //               ? Center(
                      //                   child: Image.network(
                      //                     'https://t3.ftcdn.net/jpg/02/70/22/86/360_F_270228625_yujevz1E4E45qE1mJe3DyyLPZDmLv4Uj.jpg',
                      //                     fit: BoxFit.fill,
                      //                   ),
                      //                 )
                      //               : Image.network(
                      //                   _profileNotifier
                      //                       .professionalData.images2
                      //                       .toString(),
                      //                   fit: BoxFit.cover,
                      //                 ),
                      //         ),
                      //       ),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5, right: 5),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         height: 90,
                      //         width: 90,
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(15),
                      //           child: _profileNotifier
                      //                       .professionalData.images3 ==
                      //                   ""
                      //               ? Center(
                      //                   child: Image.network(
                      //                     'https://t3.ftcdn.net/jpg/02/70/22/86/360_F_270228625_yujevz1E4E45qE1mJe3DyyLPZDmLv4Uj.jpg',
                      //                     fit: BoxFit.fill,
                      //                   ),
                      //                 )
                      //               : Image.network(
                      //                   _profileNotifier
                      //                       .professionalData.images3
                      //                       .toString(),
                      //                   fit: BoxFit.cover,
                      //                 ),
                      //         ),
                      //       ),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5, right: 5),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         height: 90,
                      //         width: 90,
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(15),
                      //           child: _profileNotifier
                      //                       .professionalData.images4 ==
                      //                   ""
                      //               ? Center(
                      //                   child: Image.network(
                      //                     'https://t3.ftcdn.net/jpg/02/70/22/86/360_F_270228625_yujevz1E4E45qE1mJe3DyyLPZDmLv4Uj.jpg',
                      //                     fit: BoxFit.fill,
                      //                   ),
                      //                 )
                      //               : Image.network(
                      //                   _profileNotifier
                      //                       .professionalData.images4
                      //                       .toString(),
                      //                   fit: BoxFit.cover,
                      //                 ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
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
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
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
          ],
        )),
      ),
    );
  }
}

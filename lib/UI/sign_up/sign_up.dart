// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, use_key_in_widget_constructors, unused_element, avoid_print, unnecessary_import, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/constant/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';

import '../../config/apicall.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _fNameControllre = TextEditingController();
  final _PfNameControllre = TextEditingController();
  final _CfNameControllre = TextEditingController();
  final _realestateCompanyController = TextEditingController();
  final _addressController = TextEditingController();
  final _PcompanyaddressController = TextEditingController();
  final _PcompanycityController = TextEditingController();
  final _PcompanynameController = TextEditingController();
  // final _addressController1 = TextEditingController();
  final _lNameControllre = TextEditingController();
  final _ClNameControllre = TextEditingController();
  final _PlNameControllre = TextEditingController();
  final _mobileNoControllre = TextEditingController();
  final _CmobileNoControllre = TextEditingController();
  final _PmobileNoControllre = TextEditingController();
  final _emailController = TextEditingController();
  final _CemailController = TextEditingController();
  final _PemailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _CpasswordController = TextEditingController();
  final _PpasswordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final _CpasswordAgainController = TextEditingController();
  final _PpasswordAgainController = TextEditingController();
  final _PCmobileController = TextEditingController();
  final _PyearinbusinessController = TextEditingController();
  final _PwebsiteLinkController = TextEditingController();
  final _PfacebookLinkController = TextEditingController();
  final _PtwitterLinkController = TextEditingController();
  final _PCinsuranceController = TextEditingController();
  final _PcontactPersonController = TextEditingController();
  final _PnumberController = TextEditingController();
  final _PzipcodeController = TextEditingController();
  final _PstateController = TextEditingController();
  // final _zipCodeController = TextEditingController();
  final _CzipController = TextEditingController();
  // final _stateController = TextEditingController();

  // List<ServiceType> servicesType = [];
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
      child: Text("Service Type"),
      value: 0,
    )
  ];

  bool _showPassword = false;
  bool _showAgainPassword = false;
  int value = 0;
  bool realtor_month = false;
  bool realtor_year = false;
  String paymentRealtor = '';
  bool professional_month = false;
  bool professional_year = false;
  String paymentProfessional = '';
  List<File> imgFile = [
    File(''),
    File(''),
    File(''),
    File(''),
  ];
  List<int> ServiceId = [];
  final imgPicker = ImagePicker();
  bool daziTerms = false;
  int servicelenth = 30;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  List<bool> boolList = [];

  void _toggleAgainvisibility() {
    setState(() {
      _showAgainPassword = !_showAgainPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  bool loading = true;

  loaddata() async {
    await ref.read(professionaltifier).getServices();
    for (int i = 0;
        i <= ref.read(professionaltifier).ServicesData.length;
        i++) {
      setState(() {
        servicelenth = i;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = ref.read(serviceProviders);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height / 3,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Stack(
                        children: [
                          Container(
                              height: size.height * 0.33,
                              width: size.width,
                              // ignore: unnecessary_new
                              decoration: new BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      AppTheme.colorPrimary,
                                      AppTheme.colorPrimaryDark
                                    ]),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.lerp(Radius.circular(50),
                                        Radius.circular(50), 5)!,
                                    bottomRight: Radius.lerp(
                                        Radius.circular(50),
                                        Radius.circular(50),
                                        5)!),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/dotsbg.png",
                                    width: 200,
                                    height: 200,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Sign Up!',
                                          style: TextStyle(
                                              color: AppTheme.white,
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 35),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Text(
                                          'Please fill the details below to\ncomplete your account',
                                          style: TextStyle(
                                              color: AppTheme.white,
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ButtonTheme(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: serviceProvider.dropdownValue,

                  icon: const Icon(Icons.expand_more),
                  iconSize: 24,
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      serviceProvider.dropdownValue = newValue!;
                      serviceProvider.setSevice(
                          serviceProvider.DropsDownvalue.indexOf(newValue));

                      SpHelpers.setInt(SharedPrefsKeys.currentindex,
                          serviceProvider.curruntindex);
                      daziTerms = false;
                    });
                  },
                  items: serviceProvider.DropsDownvalue.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            (serviceProvider.curruntindex == 0)
                ? GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: (Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: EditField(
                                    controller: _fNameControllre,
                                    hint: "First Name",
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: EditField(
                                    controller: _lNameControllre,
                                    hint: "Last Name",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            children: [
                              EditField(
                                controller: _emailController,
                                hint: "Email address",
                              ),
                              SizedBox(height: size.height * 0.03),
                              EditField(
                                controller: _passwordController,
                                hint: "Create Password",
                                isPassword: true,
                              ),
                              SizedBox(height: size.height * 0.03),
                              EditField(
                                controller: _passwordAgainController,
                                hint: "Confrim Password",
                                isPassword: true,
                              ),
                              SizedBox(height: size.height * 0.03),
                              EditField(
                                controller: _realestateCompanyController,
                                hint: "Real Estate Company",
                              ),
                              SizedBox(height: size.height * 0.03),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: EditField(
                              //         controller: _addressController1,
                              //         hint: "Real Estate Agency Affiliation (city)",
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 20,
                              //     ),
                              //     Expanded(
                              //       child: EditField(
                              //         hint: "Zip Code",
                              //         controller: _zipCodeController,
                              //         inputType: TextInputType.number,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 10,
                              //     ),
                              //     Expanded(
                              //       child: EditField(
                              //         hint: "State",
                              //         controller: _stateController,
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              MapAutoCompleteField(
                                googleMapApiKey: googleMapApiKey,
                                controller: _addressController,
                                itemBuilder:
                                    (BuildContext context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.description),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  _addressController.text =
                                      suggestion.description;
                                },
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Address can't be empty";
                                  }
                                  return null;
                                },
                                inputDecoration: InputDecoration(
                                  hintText: "Enter Location*",
                                  // label: Text('Property Address'),
                                  isDense: true,
                                  // focusedBorder: OutlineInputBorder(
                                  //     borderSide: BorderSide(color: Colors.black)),
                                  hintStyle: TextStyle(
                                      color: AppTheme.darkerText,
                                      fontFamily: AppTheme.fontName,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  labelStyle: TextStyle(
                                      color: const Color(0xFF424242),
                                      fontFamily: AppTheme.fontName,
                                      fontSize: 14),
                                  // border: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.black),
                                  // ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              EditField(
                                controller: _mobileNoControllre,
                                hint: "Mobile Phone Number",
                                inputType: TextInputType.phone,
                                maxLength: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Membership Option:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: lightColor,
                                          activeColor: primaryColor,
                                          value: realtor_month,
                                          onChanged: (v) {
                                            realtor_month = v ?? false;
                                            realtor_year = false;
                                            if (v == true) {
                                              paymentRealtor = 'monthly';
                                            } else {
                                              paymentRealtor = '';
                                            }
                                            print(
                                                '----------->>>> $paymentRealtor');

                                            setState(() {});
                                          }),
                                      Text(
                                        "\$10 per month",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.fontName,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          checkColor: lightColor,
                                          activeColor: primaryColor,
                                          value: realtor_year,
                                          onChanged: (v) {
                                            if (realtor_year == false) {
                                              realtor_year = v ?? true;
                                              realtor_month = false;
                                            } else {
                                              realtor_year = v ?? false;
                                            }
                                            if (v == true) {
                                              paymentRealtor = 'yearly';
                                            } else {
                                              paymentRealtor = '';
                                            }
                                            log('----------->>>> $paymentRealtor');
                                            setState(() {});
                                          }),
                                      Text(
                                        "\$100 per year",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.fontName,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: daziTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        daziTerms = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: RichText(
                                      maxLines: 2,
                                      text: TextSpan(
                                          text: "Check box to accept\t",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.darkText),
                                          children: [
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  commonTermConditionshowModalSheet(
                                                      size);
                                                },
                                              text:
                                                  "DAZl'S TERMS AND CONDITIONS.*",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 14),
                                            )
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  )
                : (Column()),
            (serviceProvider.curruntindex == 1)
                ? (Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                child: EditField(
                                  controller: _PfNameControllre,
                                  hint: "First Name",
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: EditField(
                                  controller: _PlNameControllre,
                                  hint: "Last Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Column(
                          children: [
                            EditField(
                              controller: _PemailController,
                              hint: "Email address",
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PpasswordController,
                              hint: "Create Password",
                              isPassword: true,
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PpasswordAgainController,
                              hint: "Confrim Password",
                              isPassword: true,
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PcompanynameController,
                              hint: "Company Name",
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PcompanyaddressController,
                              hint: "Company Street Address",
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _PcompanycityController,
                                    hint: "City",
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    controller: _PzipcodeController,
                                    hint: "Zip Code",
                                    inputType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: EditField(
                                    controller: _PstateController,
                                    hint: "State",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            EditField(
                              controller: _PCmobileController,
                              hint: "Company Number",
                              inputType: TextInputType.phone,
                              maxLength: 10,
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _PmobileNoControllre,
                                    hint: "Mobile Phone Number",
                                    inputType: TextInputType.phone,
                                    maxLength: 10,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    controller: _PyearinbusinessController,
                                    hint: "Year in business",
                                    inputType: TextInputType.phone,
                                    maxLength: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _PwebsiteLinkController,
                                    hint: "Website Link",
                                    inputType: TextInputType.text,
                                    maxLength: 10,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    controller: _PfacebookLinkController,
                                    hint: "FaceBook Link",
                                    inputType: TextInputType.text,
                                    maxLength: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _PtwitterLinkController,
                                    hint: "Twitter Link",
                                    inputType: TextInputType.text,
                                    maxLength: 10,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    controller: _PCinsuranceController,
                                    hint: "Insurance company",
                                    inputType: TextInputType.text,
                                    maxLength: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  child: EditField(
                                    controller: _PcontactPersonController,
                                    hint: "Contact Person",
                                    inputType: TextInputType.phone,
                                    maxLength: 10,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: EditField(
                                    controller: _PnumberController,
                                    hint: "Number",
                                    inputType: TextInputType.phone,
                                    maxLength: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Services you Provide",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: servicelenth * 22,
                              child: loading
                                  ? Center(child: LoadingWidget())
                                  : GridView.builder(
                                      itemCount: servicelenth,
                                      scrollDirection: Axis.horizontal,
                                      // shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.25,
                                        crossAxisCount: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        for (int i = 0;
                                            i <= servicelenth;
                                            i++) {
                                          boolList.add(false);
                                        }
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {});
                                          },
                                          child: CheckboxListTile(
                                            contentPadding: EdgeInsets.zero,
                                            value: boolList[index],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  boolList[index] = newValue!);
                                              FocusScope.of(context).unfocus();
                                              ServiceId.contains(ref
                                                      .read(professionaltifier)
                                                      .ServicesData[index]
                                                      .id)
                                                  ? ServiceId.remove(ref
                                                      .read(professionaltifier)
                                                      .ServicesData[index]
                                                      .id)
                                                  : ServiceId.add(ref
                                                      .read(professionaltifier)
                                                      .ServicesData[index]
                                                      .id!
                                                      .toInt());
                                              log(ServiceId.toString());
                                            },
                                            title: Text(
                                              '${ref.read(professionaltifier).ServicesData[index].name}',
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        );
                                      }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 5),
                        child: Text(
                          "Add 4 Company Pictures(Work Completed,Staff) Or we will use Stock photos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 100,
                          child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  showOptionsDialog(
                                    context,
                                    index,
                                  );
                                  log("xsukcbscs" + imgFile.toString());
                                },
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 90,
                                    width: 90,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: imgFile[index].path == ""
                                          ? Center(
                                              child: Image.network(
                                                'https://t3.ftcdn.net/jpg/02/70/22/86/360_F_270228625_yujevz1E4E45qE1mJe3DyyLPZDmLv4Uj.jpg',
                                                fit: BoxFit.fill,
                                              ),
                                            )
                                          : Image.file(
                                              imgFile[index],
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Membership Option:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Checkbox(
                                      checkColor: lightColor,
                                      activeColor: primaryColor,
                                      value: professional_month,
                                      onChanged: (v) {
                                        professional_month = v ?? false;
                                        professional_year = false;
                                        if (v == true) {
                                          paymentProfessional = 'monthly';
                                        } else {
                                          paymentProfessional = '';
                                        }
                                        print(
                                            '----------->>>> $paymentRealtor');

                                        setState(() {});
                                      }),
                                ),
                                Text(
                                  "\$50 per month",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.fontName,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Checkbox(
                                      checkColor: lightColor,
                                      activeColor: primaryColor,
                                      value: professional_year,
                                      onChanged: (v) {
                                        if (professional_year == false) {
                                          professional_year = v ?? true;
                                          professional_month = false;
                                        } else {
                                          professional_year = v ?? false;
                                        }
                                        if (v == true) {
                                          paymentProfessional = 'yearly';
                                        } else {
                                          paymentProfessional = '';
                                        }
                                        log('----------->>>> $paymentProfessional');
                                        setState(() {});
                                      }),
                                ),
                                Text(
                                  "\$550 per year",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.fontName,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: daziTerms,
                            onChanged: (value) {
                              setState(() {
                                daziTerms = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              maxLines: 2,
                              text: TextSpan(
                                  text: "Check box to accept\t",
                                  style: TextStyle(
                                      fontSize: 12, color: AppTheme.darkText),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          commonTermConditionshowModalSheet(
                                              size);
                                        },
                                      text: "DAZl'S TERMS AND CONDITIONS.*",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ))
                : (Column()),
            (serviceProvider.curruntindex == 2)
                ? (Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                child: EditField(
                                  controller: _CfNameControllre,
                                  hint: "First Name",
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: EditField(
                                  controller: _ClNameControllre,
                                  hint: "Last Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            children: [
                              EditField(
                                controller: _CmobileNoControllre,
                                hint: "Mobile Phone Number",
                                inputType: TextInputType.phone,
                                maxLength: 10,
                              ),
                              SizedBox(height: size.height * 0.03),
                              Row(
                                children: [
                                  Expanded(
                                    child: EditField(
                                      controller: _CemailController,
                                      hint: "Email address",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: EditField(
                                      hint: "Zip Code",
                                      inputType: TextInputType.number,
                                      controller: _CzipController,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.03),
                              EditField(
                                controller: _CpasswordController,
                                hint: "Create Password",
                                isPassword: true,
                              ),
                              SizedBox(height: size.height * 0.03),
                              EditField(
                                controller: _CpasswordAgainController,
                                hint: "Confrim Password",
                                isPassword: true,
                              ),
                              SizedBox(height: size.height * 0.03),
                              Row(
                                children: [
                                  Checkbox(
                                    value: daziTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        daziTerms = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: RichText(
                                      maxLines: 2,
                                      text: TextSpan(
                                          text: "Check box to accept\t",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppTheme.darkText),
                                          children: [
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  commonTermConditionshowModalSheet(
                                                      size);
                                                },
                                              text:
                                                  "DAZl'S TERMS AND CONDITIONS.*",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 12),
                                            )
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                    ],
                  ))
                : (Column()),
            // Padding(
            //   padding: EdgeInsets.only(left: 55, right: 55, top: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       DropdownButton(
            //         style: TextStyle(
            //             color: AppTheme.darkerText,
            //             fontFamily: AppTheme.fontName,
            //             fontSize: 15,
            //             fontWeight: FontWeight.w400),
            //         items: items,
            //         value: value,
            //         isExpanded: true,
            //         onChanged: (v) {
            //           value = v;
            //           setState(() {});
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),
            serviceProvider.curruntindex == 0
                ? submitButton(
                    _fNameControllre.text.toString(),
                    _lNameControllre.text.toString(),
                    _emailController.text.toString(),
                    _mobileNoControllre.text.toString(),
                    _passwordController.text.toString())
                : serviceProvider.curruntindex == 1
                    ? submitButton(
                        _PfNameControllre.text.toString(),
                        _PlNameControllre.text.toString(),
                        _PemailController.text.toString(),
                        _PmobileNoControllre.text.toString(),
                        _PpasswordController.text.toString())
                    : submitButton(
                        _CfNameControllre.text.toString(),
                        _ClNameControllre.text.toString(),
                        _CemailController.text.toString(),
                        _CmobileNoControllre.text.toString(),
                        _CpasswordController.text.toString()),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.maybePop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      )),
    );
  }

  void commonTermConditionshowModalSheet(size) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.88,
          decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    'TERMS AND CONDITIONS and SERVICE COMMITMENT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: primaryColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'DAZL SERVICE COMMITMENT',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    serviceComment,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppTheme.darkText,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'ACCEPTANCE OF THESE TERMS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: acceptionsOfTheseTerms,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: ' ${acceptionsOfTheseTerms1}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppTheme.darkText,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        acceptionsOfTheseTerms2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: AppTheme.darkText,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'MODIFICATIONS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    modifications,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppTheme.darkText,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'PRIVACY POLICY, ADDITIONAL TERMS AND POLICIES',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Please review',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: ' DAZLPRO, LLC OR DAZL LP Privacy Policy',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppTheme.colorPrimaryDark,
                                letterSpacing: 0.5,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: AppTheme.darkText,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'KEY TERMS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: profcolor,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: keyTerms,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: keyTerms1,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppTheme.darkText,
                                letterSpacing: 0.5,
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
        );
      },
    );
  }

  static const String serviceComment =
      "Dazl-affiliated Service Professionals must provide proof of professional licensure; proof of registration in the states in which they operate; proof of liability insurance; and project portfolios that demonstrate the company's expertise. Dazl requires that all affiliated Service Professionals perform their work at, or higher than, industry standards according to their peers. To report workmanship or service that is below industry standards, please tell us about your experience here .";

  static const String acceptionsOfTheseTerms =
      'This Terms of Use Agreement ("Terms") governs your access to, use of, and participation in the Platformmade available by DAZLPRO LLC OR DAZL LP ("DAZLPRO LLC OR DAZL LP)" "We" "our" or "us"). PLEASE';

  static const String acceptionsOfTheseTerms1 =
      ' READ THE TERMS THOROUGHLY AND CAREFULLY. BY CLICKING THE "ACCEPT" BUTTON AND ACCESSING OR USING THE PLATFORM, YOU AGREE TO BE BOUND BY ALL THESE TERMS AND CONDITIONS. IF YOU DO NOT AGREE TO BE BOUND BY ALL THE TERMS AND CONDITIONS THEN DO NOT CLICK THE "ACCEPT" BUTTON WHEREBY YOU MAY NOT ACCESS OR USE THE PLATFORM.';
  static const String acceptionsOfTheseTerms2 =
      'All references to "you" or "your," as applicable, mean the person who accesses, uses, and/or participates in the Platform in any manner, and each of your heirs, assigns, and successors. If you use the Platform on behalf of an entity, you represent and warrant that you have the authority to bind that entity, your acceptance of the Terms will be deemed an acceptance by that entity, and "you" and "your" herein shall refer to that entity.';

  static const String modifications =
      'DAZL PRO OR DAZL reserves the right, in its sole discretion, to modify these Terms, and any other documents incorporated by reference herein, at any time and without prior notice. DAZLPRO LLC OR DAZL LP will notify you of changes by posting on the Platform or sending you an email. Amendments will become effective thirty (30) days after they are posted on the Platform. Your use of the Platform after the expiration of the thirty (30) days shall constitute your consent to the changes. If you do not agree, you may not access or use the Platform.';

  static const String privacyPolicy =
      ' incorporated herein by reference, for information and notices concerning DAZLPRO LLC OR DAZL LP, collection and use of your information. Certain areas of and/or products on the Platform may have different terms and conditions posted or may require you to agree with and accept additional terms and conditions or policies. If there is a conflict between these Terms and terms and conditions or policies posted for a specific area or product, the latter take precedence with respect to your use of that area or product.';

  static const String keyTerms =
      "'Platform' means all DAZLPRO LLC OR DAZL LP websites, mobile or other applications (including any and all DAZLPRO LLC OR DAZL LP's Content and materials";

  static const String keyTerms1 =
      ' published, offered, uploaded to, posted, transmitted, or displayed on the website or application, software, processes including duplication and any other services provided by or through DAZLPRO LLC OR DAZL LP.';

  Widget submitButton(String fName, String lName, String emailId,
      String mobileNum, String password) {
    final serviceProvider = ref.read(serviceProviders);
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.only(left: 110, right: 110, top: 15, bottom: 15),
        child: Text("Sign Up", style: TextStyle(fontSize: 14)),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppTheme.colorPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: AppTheme.colorPrimary)))),
      onPressed: () async {
        if (serviceProvider.curruntindex == 0) {
          if (_fNameControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter First Name')));
          } else if (_lNameControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Last Name')));
          } else if (_emailController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Email')));
          } else if (_passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Password')));
          } else if (_passwordAgainController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Enter Confirm Password')));
          } else if (_passwordController.text !=
              _passwordAgainController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Confirm password is not Match')));
          } else if (_realestateCompanyController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Company name')));
          } else if (_addressController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Affilation name')));
          }
          // else if (_addressController1.text.isEmpty) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text('Enter Affilation city')));
          // } else if (_zipCodeController.text.isEmpty) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text('Enter zip code')));
          // }
          // else if (_stateController.text.isEmpty) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text('Enter state')));
          // }
          else if (_mobileNoControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter mobile number')));
          } else if (paymentRealtor.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Select Membership Option")));
          } else if (daziTerms == false) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Select DAZL'S TEARMS AND CONDITIONS")));
          } else {
            print('---------->>> ');
            signupRealtor(
              serviceProvider.curruntindex,
              context,
              _realestateCompanyController.text,
              _passwordAgainController.text,
              _emailController.text,
              _fNameControllre.text,
              _lNameControllre.text,
              _passwordController.text,
              _mobileNoControllre.text,
              _addressController.text,
              paymentRealtor,
            );
          }
        } else if (serviceProvider.curruntindex == 1) {
          if (_PfNameControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter First Name')));
          } else if (_PlNameControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Last Name')));
          } else if (_PemailController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Email')));
          } else if (_PpasswordController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter Password')));
          } else if (_PpasswordAgainController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Enter Confirm Password')));
          } else if (_PpasswordController.text !=
              _PpasswordAgainController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Confirm password is not Match')));
          } else if (_PcompanynameController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter company name')));
          } else if (_PcompanyaddressController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Enter company address ')));
          } else if (_PcompanycityController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter company city')));
          } else if (_PzipcodeController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter zip code')));
          } else if (_PstateController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter state')));
          } else if (_PCmobileController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter company number')));
          } else if (_PyearinbusinessController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("enter year in busioness")));
          } else if (ServiceId.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Atleast least one service you have to select")));
          } else if (paymentProfessional.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Select Membership Option")));
          } else if (daziTerms == false) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Select DAZL'S TEARMS AND CONDITIONS")));
          } else {
            signupProfessional(
              index: serviceProvider.curruntindex,
              context: context,
              city: _PcompanycityController.text,
              company_name: _PcompanynameController.text,
              company_address: _PcompanyaddressController.text,
              confirm_password: _PpasswordAgainController.text,
              email: _PemailController.text,
              fname: _PfNameControllre.text,
              lname: _PlNameControllre.text,
              password: _PpasswordController.text,
              company_number: _PCmobileController.text,
              facebookLink: _PfacebookLinkController.text,
              image1: await ref
                  .read(realtorprovider)
                  .uploadImage(context, imgFile[0]),
              image2: imgFile[1].toString(),
              image3: imgFile[2].toString(),
              image4: imgFile[3].toString(),
              services: ServiceId,
              insurance: _PCinsuranceController.text,
              state: _PstateController.text,
              twitterLink: _PtwitterLinkController.text,
              website: _PwebsiteLinkController.text,
              zip_code: _PzipcodeController.text,
              years: _PyearinbusinessController.text,
              numberIns: _PnumberController.text,
              contactIns: _PcontactPersonController.text,
              mobile: _PmobileNoControllre.text,
              membershipOption: paymentProfessional,
            );
          }
        } else {
          if (_CfNameControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter first name')));
          } else if (_ClNameControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter second name')));
          } else if (_CmobileNoControllre.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter mobil number')));
          } else if (_CemailController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter email address')));
          } else if (_CzipController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter zip code')));
          } else if (_CpasswordController.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Enter password')));
          } else if (_CpasswordAgainController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Enter confirm passoerd')));
          } else if (_CpasswordController.text !=
              _CpasswordAgainController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Confirm password is not Match')));
          } else if (daziTerms == false) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Select DAZL'S TEARMS AND CONDITIONS")));
          } else {
            signupCustomer(
              serviceProvider.curruntindex,
              context,
              _CpasswordAgainController.text,
              _CemailController.text,
              _CfNameControllre.text,
              _ClNameControllre.text,
              _CpasswordController.text,
              _CmobileNoControllre.text,
            );
          }
        }
      },
    );
  }

  // Future<dynamic> getPrefs() async {
  //   return prefs;
  // }

//   getProfile() {
//     StreamBuilder<UserProfileRespo>(
//         stream: bloc.subjectUserProfile.stream,
//         // ignore: missing_return
//         builder: (context, snap) {
//           prefs.setString(SharedPrefsKeys.USER_ID, snap.data.id.toString());
//           prefs.setString(SharedPrefsKeys.FIRST_NAME, snap.data.firstName);
//           prefs.setString(SharedPrefsKeys.LAST_NAME, snap.data.lastName);
//           prefs.setString(SharedPrefsKeys.EMAIL_ADDRESS, snap.data.email);
//           if (snap.data.picture.startsWith("http")) {
//             prefs.setString(SharedPrefsKeys.PICTURE, snap.data.picture);
//             print('snapImage=${snap.data.picture}');
//           } else {
//             prefs.setString(SharedPrefsKeys.PICTURE,
//                 baseUrl + "storage/" + snap.data.picture);
//             print('snapImage=${snap.data.picture}');
//           }
//           prefs.setString(SharedPrefsKeys.GENDER, snap.data.gender);
//           prefs.setString(SharedPrefsKeys.MOBILE, snap.data.mobile);
//           prefs.setString(SharedPrefsKeys.WALLET_BALANCE,
//               snap.data.walletBalance.toString());
//           prefs.setString(SharedPrefsKeys.PAYMENT_MODE, snap.data.paymentMode);
//           prefs.setString(SharedPrefsKeys.SOS, snap.data.sos);
//           prefs.setBool(SharedPrefsKeys.LOGEDIN, true);

//           if (snap.data.currency != "" && snap.data.currency != null) {
//             prefs.setString(SharedPrefsKeys.CURRENCY, snap.data.currency);
//           } else {
//             prefs.setString(SharedPrefsKeys.CURRENCY, "\$");
//           }

// /*          Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return SignUpScreen();
//               },
//             ),
//           );*/
//         });
//   }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.titleMedium),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.titleMedium),
      ],
    ));
  }

  late var imgCamera;
  void openCamera(int index) async {
    imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add Photo'),
        ));
      } else {
        imgFile[index] = (File(imgCamera.path));
        imgCamera = null;
      }
    });
    Navigator.of(context).pop();
  }

  late var imgGallery;
  void openGallery(int index) async {
    imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    log("scncndcdb" + imgGallery.path.toString());
    setState(() {
      // if (imgGallery == null) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('Add Photo'),
      //   ));
      // } else {
      imgFile[index] = (File(imgGallery.path));
      log("scncndcdb===" + imgFile[0].path);
      imgGallery = null;
      // }
    });
    Navigator.of(context).pop();
  }

  Future<void> showOptionsDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Select Option",
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 40,
                        ),
                        Text('Camera')
                      ],
                    ),
                    onTap: () {
                      openCamera(index);
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo,
                          size: 40,
                        ),
                        Text('Gallery')
                      ],
                    ),
                    onTap: () {
                      openGallery(index);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// Future<bool> showAlertDialog({
//   @required BuildContext context,
//   @required String title,
//   @required String content,
//   String cancelActionText,
//   @required String defaultActionText,
// }) async {
//   if (!Platform.isIOS) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: <Widget>[
//           if (cancelActionText != null)
//             TextButton(
//               child: Text(cancelActionText),
//               onPressed: () => Navigator.of(context).pop(false),
//             ),
//           TextButton(
//             child: Text(defaultActionText),
//             onPressed: () => Navigator.of(context).pop(true),
//           ),
//         ],
//       ),
//     );
//   }

//   // todo : showDialog for ios
//   return showCupertinoDialog(
//     context: context,
//     builder: (context) => CupertinoAlertDialog(
//       title: Text(title),
//       content: Text(content),
//       actions: <Widget>[
//         if (cancelActionText != null)
//           CupertinoDialogAction(
//             child: Text(cancelActionText),
//             onPressed: () => Navigator.of(context).pop(false),
//           ),
//         CupertinoDialogAction(
//           child: Text(defaultActionText),
//           onPressed: () => Navigator.of(context).pop(true),
//         ),
//       ],
//     ),
//   );
// }

const String serviceComment =
    "Dazl-affiliated Service Professionals must provide proof of professional licensure; proof of registration in the states in which they operate; proof of liability insurance; and project portfolios that demonstrate the company's expertise. Dazl requires that all affiliated Service Professionals perform their work at, or higher than, industry standards according to their peers. To report workmanship or service that is below industry standards, please tell us about your experience here .";

const String acceptionsOfTheseTerms =
    'This Terms of Use Agreement ("Terms") governs your access to, use of, and participation in the Platformmade available by DAZLPRO LLC OR DAZL LP ("DAZLPRO LLC OR DAZL LP)" "We" "our" or "us"). PLEASE';

const String acceptionsOfTheseTerms1 =
    ' READ THE TERMS THOROUGHLY AND CAREFULLY. BY CLICKING THE "ACCEPT" BUTTON AND ACCESSING OR USING THE PLATFORM, YOU AGREE TO BE BOUND BY ALL THESE TERMS AND CONDITIONS. IF YOU DO NOT AGREE TO BE BOUND BY ALL THE TERMS AND CONDITIONS THEN DO NOT CLICK THE "ACCEPT" BUTTON WHEREBY YOU MAY NOT ACCESS OR USE THE PLATFORM.';
const String acceptionsOfTheseTerms2 =
    'All references to "you" or "your," as applicable, mean the person who accesses, uses, and/or participates in the Platform in any manner, and each of your heirs, assigns, and successors. If you use the Platform on behalf of an entity, you represent and warrant that you have the authority to bind that entity, your acceptance of the Terms will be deemed an acceptance by that entity, and "you" and "your" herein shall refer to that entity.';

const String modifications =
    'DAZL PRO OR DAZL reserves the right, in its sole discretion, to modify these Terms, and any other documents incorporated by reference herein, at any time and without prior notice. DAZLPRO LLC OR DAZL LP will notify you of changes by posting on the Platform or sending you an email. Amendments will become effective thirty (30) days after they are posted on the Platform. Your use of the Platform after the expiration of the thirty (30) days shall constitute your consent to the changes. If you do not agree, you may not access or use the Platform.';

const String privacyPolicy =
    ' incorporated herein by reference, for information and notices concerning DAZLPRO LLC OR DAZL LP, collection and use of your information. Certain areas of and/or products on the Platform may have different terms and conditions posted or may require you to agree with and accept additional terms and conditions or policies. If there is a conflict between these Terms and terms and conditions or policies posted for a specific area or product, the latter take precedence with respect to your use of that area or product.';

const String keyTerms =
    "'Platform' means all DAZLPRO LLC OR DAZL LP websites, mobile or other applications (including any and all DAZLPRO LLC OR DAZL LP's Content and materials";

const String keyTerms1 =
    ' published, offered, uploaded to, posted, transmitted, or displayed on the website or application, software, processes including duplication and any other services provided by or through DAZLPRO LLC OR DAZL LP.';

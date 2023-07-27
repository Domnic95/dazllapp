// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:async';
import 'dart:developer';

import 'package:dazllapp/UI/homepage/realtor/Create_phd/create_a_new_phd.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';
// import 'package:map_autocomplete_field/map_autocomplete_field.dart';

class CreatePhd extends ConsumerStatefulWidget {
  CreatePhd({Key? key}) : super(key: key);

  @override
  ConsumerState<CreatePhd> createState() => _CreatePhdState();
}

class _CreatePhdState extends ConsumerState<CreatePhd> {
  final _formkey = GlobalKey<FormState>();
  final _propertynumber = TextEditingController();
  final _propertyname = TextEditingController();
  final _propertytype = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _first_name = TextEditingController();
  final _Last_name = TextEditingController();
  final _ClientEmailAddress = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getGeoAddress();
  }

  void getGeoAddress() {}

  @override
  Widget build(BuildContext context) {
    final _phdProvider = ref.read(phdProvider);
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formkey,
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
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
                    "Create a Phd",
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
                          Text(
                            'Seller\'s information',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'PROPERTY ADDRESS',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          MapAutoCompleteField(
                            googleMapApiKey: googleMapApiKey,
                            controller: _addressController,
                            itemBuilder: (BuildContext context, suggestion) {
                              return ListTile(
                                title: Text(suggestion.description),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              _addressController.text = suggestion.description;
                            },
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Address can't be empty";
                              }
                              return null;
                            },
                            inputDecoration: InputDecoration(
                              hintText: "Enter Location*",
                              label: Text('Property Address'),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
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
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          // TextFormField(
                          //   validator: (text) {
                          //     if (text!.isEmpty) {
                          //       return 'St.Number can\'t be empty';
                          //     }
                          //     return null;
                          //   },
                          //   controller: _propertynumber,
                          //   cursorColor: AppTheme.nearlyBlack,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter Your St.Number",
                          //     label: Text('St.Number'),
                          //     isDense: true,
                          //     focusedBorder: OutlineInputBorder(
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
                          //       borderSide: BorderSide(color: Colors.black),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // TextFormField(
                          //   validator: (text) {
                          //     if (text!.isEmpty) {
                          //       return 'St.Name can\'t be empty';
                          //     }
                          //     return null;
                          //   },
                          //   controller: _propertyname,
                          //   cursorColor: AppTheme.nearlyBlack,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter Your St.Name",
                          //     label: Text('St.Name'),
                          //     isDense: true,
                          //     focusedBorder: OutlineInputBorder(
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
                          //       borderSide: BorderSide(color: Colors.black),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // TextFormField(
                          //   validator: (text) {
                          //     if (text!.isEmpty) {
                          //       return 'St.Type can\'t be empty';
                          //     }
                          //     return null;
                          //   },
                          //   controller: _propertytype,
                          //   cursorColor: AppTheme.nearlyBlack,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter Your St.Type",
                          //     label: Text('St.Type'),
                          //     isDense: true,
                          //     focusedBorder: OutlineInputBorder(
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
                          //       borderSide: BorderSide(color: Colors.black),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // TextFormField(
                          //   validator: (text) {
                          //     if (text!.isEmpty) {
                          //       return 'City can\'t be empty';
                          //     }
                          //     return null;
                          //   },
                          //   controller: _cityController,
                          //   cursorColor: AppTheme.nearlyBlack,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter Your City",
                          //     label: Text('CITY'),
                          //     isDense: true,
                          //     focusedBorder: OutlineInputBorder(
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
                          //       borderSide: BorderSide(color: Colors.black),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          TextFormField(
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'State can\'t be empty';
                              }
                              return null;
                            },
                            controller: _stateController,
                            cursorColor: AppTheme.nearlyBlack,
                            decoration: InputDecoration(
                              hintText: "Enter Your State",
                              label: Text('STATE'),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
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
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Pincode can\'t be empty';
                              }
                              return null;
                            },
                            controller: _pincodeController,
                            cursorColor: AppTheme.nearlyBlack,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter Your Pincode",
                              label: Text('PINCODE'),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
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
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'CLIENT\'S NAME AND EMAIL',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Tooltip(
                                triggerMode: TooltipTriggerMode.tap,
                                showDuration: Duration(seconds: 5),
                                preferBelow: true,
                                message:
                                    "Your Clients will receive an email from dazlpro.com asking them if they would like to sign up for a free user account. This will allow them to create projects and receive the PHD report.",
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(22)),
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'First Name can\'t be empty';
                              }
                              return null;
                            },
                            controller: _first_name,
                            cursorColor: AppTheme.nearlyBlack,
                            decoration: InputDecoration(
                              hintText: "Enter Your First Name",
                              label: Text('FIRST NAME'),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
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
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Last Name can\'t be empty';
                              }
                              return null;
                            },
                            controller: _Last_name,
                            cursorColor: AppTheme.nearlyBlack,
                            decoration: InputDecoration(
                              hintText: "Enter Your Last Name",
                              label: Text('LAST NAME'),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
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
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _ClientEmailAddress,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppTheme.nearlyBlack,
                            decoration: InputDecoration(
                              hintText: "Enter Client's Address",
                              label: Text("CLIENT'S PRIMARY EMAIL ADDRESS"),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
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
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                            size: 20,
                            color: AppTheme.white,
                          ),
                          Text(
                            "Previous",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 18,
                                      color: lightColor.withOpacity(.9),
                                    ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log("pageto == CreateANewPhd");
                        if (_formkey.currentState!.validate()) {
                          _phdProvider.storePropertiesDetails(
                              paddress: _addressController.text
                              // _propertynumber.text +
                              //     ", " +
                              //     _propertyname.text +
                              //     ", " +
                              //     _propertytype.text +
                              //     ", " +
                              //     _cityController.text +
                              //     "(" +
                              //     _pincodeController.text +
                              //     '), ' +
                              //     _stateController.text
                              ,
                              firstname: _first_name.text,
                              lastname: _Last_name.text,
                              clientemail: _ClientEmailAddress.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CreateANewPhd(
                                ClientEmailAddress: _ClientEmailAddress.text,
                                Last_name: _Last_name.text,
                                city: _cityController.text,
                                first_name: _first_name.text,
                                pincode: _pincodeController.text,
                                state: _stateController.text,
                                streetName: _propertyname.text,
                                streetNum: _propertynumber.text,
                                streetType: _propertytype.text,
                              ),
                            ),
                          );
                        }
                        Timer(Duration(seconds: 2), () {
                          setState(() {
                            _ClientEmailAddress.clear();
                            _Last_name.clear();
                            _first_name.clear();
                            _propertynumber.clear();
                            _propertyname.clear();
                            _propertytype.clear();
                            _pincodeController.clear();
                            _cityController.clear();
                            _stateController.clear();
                          });
                        });
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => CreateANewPhd(
                        //       ClientEmailAddress: _ClientEmailAddress.text,
                        //       Last_name: _Last_name.text,
                        //       city: _cityController.text,
                        //       first_name: _first_name.text,
                        //       pincode: _pincodeController.text,
                        //       propertyAddress: _propertyAddress.text,
                        //       state: _stateController.text,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Next",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 18,
                                      color: lightColor.withOpacity(.9),
                                    ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: AppTheme.white,
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
      ),
    );
  }
}

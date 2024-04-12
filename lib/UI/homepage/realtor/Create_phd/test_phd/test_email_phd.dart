// import 'dart:developer';

// import 'package:dazllapp/UI/home/component/CommonHeader.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/create_a_new_phd.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/test_phd/phd_test_provider.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/test_phd/slider_phd.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:dazllapp/constant/strings.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:map_autocomplete_field/map_autocomplete_field.dart';

// class TestEmailPhd extends ConsumerStatefulWidget {
//   const TestEmailPhd({Key? key});

//   @override
//   ConsumerState<TestEmailPhd> createState() => _TestEmailPhdState();
// }

// class _TestEmailPhdState extends ConsumerState<TestEmailPhd> {
//   final _formkey = GlobalKey<FormState>();
//   final _propertynumber = TextEditingController();
//   final _propertyname = TextEditingController();
//   final _propertytype = TextEditingController();
//   final _cityController = TextEditingController();
//   // final _stateController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _first_name = TextEditingController();
//   final _Last_name = TextEditingController();
//   final _ClientEmailAddress = TextEditingController();
//   final _addressController = TextEditingController();
//   bool isEmailValid = true;
//   late TestPhdProvider testprovider;
//   @override
//   void initState() {
//     super.initState();
//     getGeoAddress();
//   }

//   void getGeoAddress() {}
//   bool checkForEmailValid(String email) {
//     // Define a regular expression pattern for email validation
//     final RegExp emailRegExp =
//         RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

//     return emailRegExp.hasMatch(email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     testprovider = ref.read(testphdProvider);
//     final size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Form(
//         key: _formkey,
//         child: Scaffold(
//           // resizeToAvoidBottomInset: false,
//           body: Column(
//             children: [
//               CommonHeader(title: 'Create a Phd', isback: false),
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.all(10.0),
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Seller\'s information',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 25,
//                         ),
//                         Text(
//                           'PROPERTY ADDRESS',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         MapAutoCompleteField(
//                           googleMapApiKey: googleMapApiKey,
//                           controller: _addressController,
//                           itemBuilder: (BuildContext context, suggestion) {
//                             return ListTile(
//                               title: Text(suggestion.description),
//                             );
//                           },
//                           onSuggestionSelected: (suggestion) {
//                             _addressController.text = suggestion.description;
//                           },
//                           validator: (text) {
//                             if (text!.isEmpty) {
//                               return "Address can't be empty";
//                             }
//                             return null;
//                           },
//                           inputDecoration: InputDecoration(
//                             hintText: "Enter Location*",
//                             label: Text('Property Address'),
//                             isDense: true,
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black)),
//                             hintStyle: TextStyle(
//                                 color: AppTheme.darkerText,
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                             labelStyle: TextStyle(
//                                 color: const Color(0xFF424242),
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: primaryColor),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: secondaryTextColor),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               'CLIENT\'S NAME AND EMAIL',
//                               style: TextStyle(fontSize: 14),
//                             ),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Tooltip(
//                               triggerMode: TooltipTriggerMode.tap,
//                               showDuration: Duration(seconds: 5),
//                               preferBelow: true,
//                               message:
//                                   "Your Clients will receive an email from dazlpro.com asking them if they would like to sign up for a free user account. This will allow them to create projects and receive the PHD report.",
//                               padding: EdgeInsets.all(20),
//                               margin: EdgeInsets.only(left: 20, right: 20),
//                               decoration: BoxDecoration(
//                                   color: Colors.red,
//                                   borderRadius: BorderRadius.circular(22)),
//                               textStyle: TextStyle(
//                                   fontSize: 14,
//                                   fontStyle: FontStyle.italic,
//                                   color: Colors.white),
//                               child: Icon(
//                                 Icons.info_outline_rounded,
//                                 size: 18,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         TextFormField(
//                           validator: (text) {
//                             if (text!.isEmpty) {
//                               return 'First Name can\'t be empty';
//                             }
//                             return null;
//                           },
//                           controller: _first_name,
//                           cursorColor: AppTheme.nearlyBlack,
//                           decoration: InputDecoration(
//                             hintText: "Enter Your First Name",
//                             label: Text('FIRST NAME'),
//                             isDense: true,
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black)),
//                             hintStyle: TextStyle(
//                                 color: AppTheme.darkerText,
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                             labelStyle: TextStyle(
//                                 color: const Color(0xFF424242),
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: primaryColor),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: secondaryTextColor),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         TextFormField(
//                           validator: (text) {
//                             if (text!.isEmpty) {
//                               return 'Last Name can\'t be empty';
//                             }
//                             return null;
//                           },
//                           controller: _Last_name,
//                           cursorColor: AppTheme.nearlyBlack,
//                           decoration: InputDecoration(
//                             hintText: "Enter Your Last Name",
//                             label: Text('LAST NAME'),
//                             isDense: true,
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black)),
//                             hintStyle: TextStyle(
//                                 color: AppTheme.darkerText,
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                             labelStyle: TextStyle(
//                                 color: const Color(0xFF424242),
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: primaryColor),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: secondaryTextColor),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         TextField(
//                           controller: _ClientEmailAddress,
//                           keyboardType: TextInputType.emailAddress,
//                           cursorColor: AppTheme.nearlyBlack,
//                           onTap: () {
//                             isEmailValid = true;
//                             setState(() {});
//                           },
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: primaryColor),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: secondaryTextColor),
//                             ),
//                             errorText: isEmailValid ? null : "Email not valid",
//                             hintText: "Enter Client's Address",
//                             label: Text("CLIENT'S PRIMARY EMAIL ADDRESS"),
//                             isDense: true,
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black)),
//                             hintStyle: TextStyle(
//                                 color: AppTheme.darkerText,
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                             labelStyle: TextStyle(
//                                 color: const Color(0xFF424242),
//                                 fontFamily: AppTheme.fontName,
//                                 fontSize: 14),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 18,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                           child: RichText(
//                             text: TextSpan(
//                               text: 'Note : ',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text:
//                                       'Your Clients will receive an email from dazlpro.com asking them if they would like to sign up for a free user account. This will allow them to create projects and receive the PHD report.',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 height: size.height * 0.09,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                     color: AppTheme.colorPrimary),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.arrow_back_ios,
//                               size: 20,
//                               color: AppTheme.white,
//                             ),
//                             Text(
//                               "Previous",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge!
//                                   .copyWith(
//                                     fontSize: 18,
//                                     color: lightColor.withOpacity(.9),
//                                   ),
//                             )
//                           ],
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           log("pageto == CreateANewPhd");
//                           if (_formkey.currentState!.validate()) {
//                             if (_addressController.text.isEmpty) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                 content: Text('Property address is required!'),
//                               ));
//                             } else if (!checkForEmailValid(
//                                 _ClientEmailAddress.text)) {
//                               isEmailValid = false;
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                 content: Text('Email is not valid'),
//                               ));
//                               setState(() {});
//                             } else {
//                               testprovider.storePropertiesDetails(
//                                   paddress: _addressController.text,
//                                   firstname: _first_name.text,
//                                   lastname: _Last_name.text,
//                                   clientemail: _ClientEmailAddress.text);
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => TestSliderPhd(
//                                     ClientEmailAddress:
//                                         _ClientEmailAddress.text,
//                                     Last_name: _Last_name.text,
//                                     city: _cityController.text,
//                                     first_name: _first_name.text,
//                                     pincode: _pincodeController.text,
//                                     // state: _stateController.text,
//                                     streetName: _propertyname.text,
//                                     streetNum: _propertynumber.text,
//                                     streetType: _propertytype.text,
//                                   ),
//                                 ),
//                               );
//                             }
//                           }
//                         },
//                         child: Row(
//                           children: [
//                             Text(
//                               "Next",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge!
//                                   .copyWith(
//                                     fontSize: 18,
//                                     color: lightColor.withOpacity(.9),
//                                   ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios,
//                               size: 20,
//                               color: AppTheme.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

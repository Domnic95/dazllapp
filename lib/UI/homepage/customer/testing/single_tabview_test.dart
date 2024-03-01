// import 'dart:developer';
// import 'dart:io';

// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/homepage/customer/testing/project_provider_test.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// class SingleTabviewTest extends ConsumerStatefulWidget {
//   SingleTabviewTest({Key? key});

//   @override
//   ConsumerState<SingleTabviewTest> createState() => _SingleTabviewTestState();
// }

// class _SingleTabviewTestState extends ConsumerState<SingleTabviewTest> {
//   late ProfileTestProvider profileTestProvider;

//   int indexs = 0;

//   @override
//   void initState() {
//     super.initState();
//     profileTestProvider = ref.read(profileTestProviders);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _roomsfeature = ref.read(customernotifier);
//     profileTestProvider = ref.watch(profileTestProviders);
//     final size = MediaQuery.of(context).size;
//     return profileTestProvider.isLoading
//         ? LoadingWidget()
//         : Scaffold(
//             body: Container(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "What items in this area would you like to dazl up ?",
//                       maxLines: 2,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.02,
//                     ),
//                     Expanded(
//                       // height: size.height * 0.63,
//                       child: ListView.separated(
//                         padding: EdgeInsets.zero,
//                         shrinkWrap: true,
//                         itemCount: profileTestProvider
//                             .allRoomFeature[profileTestProvider.tabIndex]
//                             .length,
//                         separatorBuilder: (BuildContext context, int index) {
//                           return SizedBox(
//                             height: 10,
//                           );
//                         },
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Checkbox(
//                                       checkColor: lightColor,
//                                       activeColor: AppTheme.colorPrimary,
//                                       value: profileTestProvider
//                                           .allRoomFeature[profileTestProvider
//                                               .tabIndex][index]
//                                           .selectedFeatureForOneTabs
//                                           .checkBox,
//                                       onChanged: (val) {
//                                         profileTestProvider.changeCheckBox(
//                                             tabIndex:
//                                                 profileTestProvider.tabIndex,
//                                             selectedFeatureIndex: index,
//                                             value: val!,
//                                             setFeatureId: profileTestProvider
//                                                 .allRoomFeature[
//                                                     profileTestProvider
//                                                         .tabIndex][index]
//                                                 .id);
//                                         // _roomProvider.onSelect(index);
//                                       }),
//                                   Text(
//                                     profileTestProvider
//                                         .allRoomFeature[
//                                             profileTestProvider.tabIndex][index]
//                                         .name,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge!
//                                         .copyWith(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 16,
//                                           color: AppTheme.darkerText,
//                                         ),
//                                   )
//                                 ],
//                               ),
//                               profileTestProvider
//                                       .allRoomFeature[
//                                           profileTestProvider.tabIndex][index]
//                                       .selectedFeatureForOneTabs
//                                       .checkBox
//                                   ? Container(
//                                       padding:
//                                           EdgeInsets.only(left: 15, right: 15),
//                                       //color:/. Colors.amber,
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Container(
//                                             height: size.height * 0.12,
//                                             padding: EdgeInsets.only(left: 15),
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color: AppTheme.grey
//                                                         .withOpacity(0.5),
//                                                     width: 2),
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 color: Colors.white),
//                                             child: Stack(
//                                               children: [
//                                                 TextFormField(
//                                                   controller: profileTestProvider
//                                                       .allRoomFeature[
//                                                           profileTestProvider
//                                                               .tabIndex][index]
//                                                       .selectedFeatureForOneTabs
//                                                       .descrptionController,
//                                                   minLines: 2,
//                                                   maxLines: 100,
//                                                   textInputAction:
//                                                       TextInputAction.done,
//                                                   cursorColor:
//                                                       AppTheme.colorPrimary,
//                                                   decoration: InputDecoration(
//                                                       hintText:
//                                                           "Tell us the issue or desired outcome.",
//                                                       hintStyle:
//                                                           Theme.of(context)
//                                                               .textTheme
//                                                               .bodyLarge,
//                                                       focusedBorder:
//                                                           UnderlineInputBorder(
//                                                               borderSide: BorderSide(
//                                                                   color: Colors
//                                                                       .transparent)),
//                                                       enabledBorder:
//                                                           UnderlineInputBorder(
//                                                               borderSide: BorderSide(
//                                                                   color: Colors
//                                                                       .transparent)),
//                                                       border: UnderlineInputBorder(
//                                                           borderSide: BorderSide(
//                                                               color: Colors
//                                                                   .transparent))),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           RichText(
//                                               text: TextSpan(
//                                                   text: "UPLOAD PHOTOS OF ",
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: blackColor,
//                                                       fontSize: 12),
//                                                   children: [
//                                                 TextSpan(
//                                                   text:
//                                                       "your project or photos that inspire your renovation",
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                     color: AppTheme.grey61,
//                                                   ),
//                                                 )
//                                               ])),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           profileTestProvider
//                                                       .allRoomFeature[
//                                                           profileTestProvider
//                                                               .tabIndex][index]
//                                                       .selectedFeatureForOneTabs
//                                                       .images ==
//                                                   File('').toString()
//                                               ? SizedBox()
//                                               : GridView.builder(
//                                                   padding: EdgeInsets.zero,
//                                                   physics:
//                                                       NeverScrollableScrollPhysics(),
//                                                   shrinkWrap: true,
//                                                   itemCount: profileTestProvider
//                                                           .allRoomFeature[
//                                                               profileTestProvider
//                                                                   .tabIndex]
//                                                               [index]
//                                                           .selectedFeatureForOneTabs
//                                                           .images
//                                                           .length +
//                                                       1,
//                                                   gridDelegate:
//                                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                                     crossAxisCount: 4,
//                                                     crossAxisSpacing: 4.0,
//                                                     mainAxisSpacing: 4.0,
//                                                   ),
//                                                   itemBuilder:
//                                                       (context, subIndex) {
//                                                     if (subIndex == 0) {
//                                                       return Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           border: Border.all(
//                                                               color:
//                                                                   Colors.black),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                         ),
//                                                         child: IconButton(
//                                                             onPressed: () {
//                                                               showOptionsDialog(
//                                                                   context,
//                                                                   index);
//                                                             },
//                                                             icon: Icon(Icons
//                                                                 .add_a_photo)),
//                                                       );
//                                                     }
//                                                     return profileTestProvider
//                                                                 .allRoomFeature[
//                                                                     profileTestProvider
//                                                                         .tabIndex]
//                                                                     [index]
//                                                                 .selectedFeatureForOneTabs
//                                                                 .images[subIndex - 1] ==
//                                                             File('')
//                                                         ? SizedBox()
//                                                         : Container(
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               border: Border.all(
//                                                                   color: Colors
//                                                                       .black),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                             ),
//                                                             child: Stack(
//                                                               alignment:
//                                                                   Alignment
//                                                                       .center,
//                                                               children: [
//                                                                 Container(
//                                                                   // height: 60,
//                                                                   // width: 60,
//                                                                   decoration:
//                                                                       BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     image:
//                                                                         DecorationImage(
//                                                                       fit: BoxFit
//                                                                           .cover,
//                                                                       image:
//                                                                           NetworkImage(
//                                                                         profileTestProvider
//                                                                             .allRoomFeature[profileTestProvider.tabIndex][index]
//                                                                             .selectedFeatureForOneTabs
//                                                                             .images[subIndex - 1],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Positioned(
//                                                                   top: -10,
//                                                                   right: -5,
//                                                                   child: IconButton(
//                                                                       onPressed: () {
//                                                                         setState(
//                                                                             () {
//                                                                           profileTestProvider
//                                                                               .allRoomFeature[profileTestProvider.tabIndex][index]
//                                                                               .selectedFeatureForOneTabs
//                                                                               .images
//                                                                               .removeAt(subIndex - 1);
//                                                                         });
//                                                                       },
//                                                                       icon: Icon(
//                                                                         Icons
//                                                                             .cancel,
//                                                                         size:
//                                                                             25,
//                                                                       )),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           );
//                                                   },
//                                                 ),
//                                         ],
//                                       ),
//                                     )
//                                   : Container()
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }

//   Future<void> showOptionsDialog(
//     BuildContext context,
//     index,
//   ) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Center(
//               child: Text(
//                 "Select Option",
//                 style: TextStyle(
//                   color: primaryColor,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             content: Container(
//               height: MediaQuery.of(context).size.height * 0.08,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.camera,
//                           size: 40,
//                         ),
//                         Text('Camera')
//                       ],
//                     ),
//                     onTap: () {
//                       openCamera(
//                         index,
//                       );
//                     },
//                   ),
//                   GestureDetector(
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.photo,
//                           size: 40,
//                         ),
//                         Text('Gallery')
//                       ],
//                     ),
//                     onTap: () {
//                       openGallery(
//                         index,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   late var imgCamera;
//   void openCamera(
//     int index,
//   ) async {
//     imgCamera = await profileTestProvider.imgPicker.getImage(
//       source: ImageSource.camera,
//     );

//     if (imgCamera != null) {
//       Navigator.of(context).pop();
//       photocamera(index);
//     } else {
//       Navigator.of(context).pop();
//     }
//   }

//   late var imgGallery;
//   void openGallery(
//     int index,
//   ) async {
//     imgGallery = await profileTestProvider.imgPicker
//         .getImage(source: ImageSource.gallery);
//     if (imgGallery != null) {
//       Navigator.of(context).pop();
//       textphoto(index);
//     } else {
//       Navigator.of(context).pop();
//     }
//   }

//   Future<void> textphoto(int index) async {
//     Utils.loaderDialog(context, true);
//     if (
//         // _PhotoDescrptionController[index].text.isEmpty ||
//         imgGallery == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Add Photo'),
//         // content: Text('Add description or Photo'),
//       ));
//     } else {
//       // _addphotodescription[index].add(_PhotoDescrptionController[index].text);
//       String image = await profileTestProvider.getImage(
//           context, File(imgGallery.path), ref);
//       profileTestProvider.allRoomFeature[profileTestProvider.tabIndex][index]
//           .selectedFeatureForOneTabs.images
//           .add(image);
//       // _PhotoDescrptionController[index].clear();
//       // await _roomProvider.getImage(
//       //     context, _roomProvider.tabIndex, index, File(imgGallery.path), ref);
//       imgGallery = null;
//     }
//     Utils.loaderDialog(context, false);
//     setState(() {});
//   }

//   Future<void> photocamera(int index) async {
//     Utils.loaderDialog(context, true);
//     if (
//         // _PhotoDescrptionController[index].text.isEmpty ||
//         imgCamera == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Add description or Photo'),
//       ));
//     } else {
//       // _addphotodescription[index].add(_PhotoDescrptionController[index].text);
//       String image = await profileTestProvider.getImage(
//           context, File(imgGallery.path), ref);
//       profileTestProvider.allRoomFeature[profileTestProvider.tabIndex][index]
//           .selectedFeatureForOneTabs.images
//           .add(image);
//       // _PhotoDescrptionController[index].clear();
//       // await _roomProvider.getImage(
//       //     context, _roomProvider.tabIndex, index, File(imgCamera.path), ref);
//       imgCamera = null;
//     }
//     Utils.loaderDialog(context, false);
//     setState(() {});
//   }

//   // void removeempty() {
//   //   _roomProvider.featureId[_roomProvider.tabIndex]
//   //       .removeWhere((element) => ["", 0].contains(element));
//   //   _roomProvider.featureoptionid[_roomProvider.tabIndex]
//   //       .removeWhere((element) => ["", 0].contains(element));
//   //   // FeatureissueId.removeWhere((element) => element.length == 0);
//   //   _roomProvider.imgFile[_roomProvider.tabIndex]
//   //       .removeWhere((element) => element.length == 0);
//   //   // _addphotodescription.removeWhere((element) => element.length == 0);
//   //   _roomProvider.description[_roomProvider.tabIndex]
//   //       .removeWhere((element) => ["", 0].contains(element));
//   // }
// }
// Remove above Code After 26/4/2025


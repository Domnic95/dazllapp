// // ignore_for_file: deprecated_member_use

// import 'dart:developer';
// import 'dart:io';
// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/homepage/realtor/testing/test_provider.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// class SingleTab extends ConsumerStatefulWidget {
//   SingleTab({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState<SingleTab> createState() => _SingleTabState();
// }

// class _SingleTabState extends ConsumerState<SingleTab> {
//   late TestProvider testProvider;

//   int indexs = 0;

//   @override
//   void initState() {
//     super.initState();

//     testProvider = ref.read(testProvidersValue);
//   }

//   @override
//   Widget build(BuildContext context) {
//     testProvider = ref.watch(testProvidersValue);
//     final size = MediaQuery.of(context).size;
//     return testProvider.isLoading || testProvider.addNewDataLoading
//         ? LoadingWidget()
//         : Scaffold(
//             body: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "What items in this area would you like to dazl up ?",
//                       maxLines: 2,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.02,
//                   ),
//                   Expanded(
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       padding: EdgeInsets.zero,
//                       itemCount: testProvider
//                           .allRoomFeature[testProvider.tabIndex].length,
//                       separatorBuilder: (BuildContext context, int index) {
//                         return SizedBox(
//                           height: 10,
//                         );
//                       },
//                       itemBuilder: (BuildContext context, int index) {
//                         return Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Checkbox(
//                                     checkColor: lightColor,
//                                     activeColor: AppTheme.colorPrimary,
//                                     value: testProvider
//                                         .allRoomFeature[testProvider.tabIndex]
//                                             [index]
//                                         .selectedFeatureForOneTabs
//                                         .checkBox,
//                                     onChanged: (val) {
//                                       testProvider.changeCheckBox(
//                                           tabIndex: testProvider.tabIndex,
//                                           selectedFeatureIndex: index,
//                                           value: val!,
//                                           setFeatureId: testProvider
//                                               .allRoomFeature[
//                                                   testProvider.tabIndex][index]
//                                               .id);
//                                     }),
//                                 Text(
//                                   testProvider
//                                       .allRoomFeature[testProvider.tabIndex]
//                                           [index]
//                                       .name,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1!
//                                       .copyWith(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 16,
//                                         color: AppTheme.darkerText,
//                                       ),
//                                 )
//                               ],
//                             ),
//                             testProvider
//                                     .allRoomFeature[testProvider.tabIndex]
//                                         [index]
//                                     .selectedFeatureForOneTabs
//                                     .checkBox
//                                 ? Container(
//                                     padding:
//                                         EdgeInsets.only(left: 15, right: 15),
//                                     //color: Colors.amber,
//                                     child: Column(
//                                       children: [
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Container(
//                                           height: size.height * 0.12,
//                                           padding: EdgeInsets.only(left: 15),
//                                           decoration: BoxDecoration(
//                                               border: Border.all(
//                                                   color: AppTheme.grey
//                                                       .withOpacity(0.5),
//                                                   width: 2),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               color: Colors.white),
//                                           child: TextFormField(
//                                             controller: testProvider
//                                                 .allRoomFeature[testProvider
//                                                     .tabIndex][index]
//                                                 .selectedFeatureForOneTabs
//                                                 .descrptionController,
//                                             minLines: 2,
//                                             maxLines: 100,
//                                             textInputAction:
//                                                 TextInputAction.done,
//                                             cursorColor: AppTheme.colorPrimary,
//                                             decoration: InputDecoration(
//                                                 hintText:
//                                                     "Tell us the issue or desired outcome.",
//                                                 hintStyle: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyText1,
//                                                 focusedBorder:
//                                                     UnderlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             color: Colors
//                                                                 .transparent)),
//                                                 enabledBorder:
//                                                     UnderlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             color: Colors
//                                                                 .transparent)),
//                                                 border: UnderlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                         color: Colors
//                                                             .transparent))),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         RichText(
//                                             text: TextSpan(
//                                                 text: "UPLOAD PHOTOS OF ",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     color: blackColor,
//                                                     fontSize: 12),
//                                                 children: [
//                                               TextSpan(
//                                                 text:
//                                                     "your project or photos that inspire your renovation",
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                   color: AppTheme.grey61,
//                                                 ),
//                                               )
//                                             ])),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                         testProvider
//                                                     .allRoomFeature[testProvider
//                                                         .tabIndex][index]
//                                                     .selectedFeatureForOneTabs
//                                                     .images ==
//                                                 File('').toString()
//                                             ? SizedBox()
//                                             : GridView.builder(
//                                                 padding: EdgeInsets.zero,
//                                                 physics:
//                                                     NeverScrollableScrollPhysics(),
//                                                 shrinkWrap: true,
//                                                 itemCount: testProvider
//                                                         .allRoomFeature[
//                                                             testProvider
//                                                                 .tabIndex]
//                                                             [index]
//                                                         .selectedFeatureForOneTabs
//                                                         .images
//                                                         .length +
//                                                     1,
//                                                 gridDelegate:
//                                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                                         crossAxisCount: 4,
//                                                         crossAxisSpacing: 4.0,
//                                                         mainAxisSpacing: 4.0),
//                                                 itemBuilder:
//                                                     (context, subIndex) {
//                                                   if (subIndex == 0) {
//                                                     return Container(
//                                                       decoration: BoxDecoration(
//                                                         border: Border.all(
//                                                             color:
//                                                                 Colors.black),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10),
//                                                       ),
//                                                       child: IconButton(
//                                                           onPressed: () {
//                                                             showOptionsDialog(
//                                                                 context, index);
//                                                           },
//                                                           icon: Icon(Icons
//                                                               .add_a_photo)),
//                                                     );
//                                                   }
//                                                   return testProvider
//                                                               .allRoomFeature[
//                                                                   testProvider
//                                                                       .tabIndex]
//                                                                   [index]
//                                                               .selectedFeatureForOneTabs
//                                                               .images[subIndex - 1] ==
//                                                           File('')
//                                                       ? SizedBox()
//                                                       : Container(
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             border: Border.all(
//                                                                 color: Colors
//                                                                     .black),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10),
//                                                           ),
//                                                           child: Stack(
//                                                             alignment: Alignment
//                                                                 .center,
//                                                             children: [
//                                                               Container(
//                                                                 // height: 60,
//                                                                 // width: 60,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               10),
//                                                                   image:
//                                                                       DecorationImage(
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                     image:
//                                                                         NetworkImage(
//                                                                       testProvider
//                                                                           .allRoomFeature[
//                                                                               testProvider.tabIndex]
//                                                                               [
//                                                                               index]
//                                                                           .selectedFeatureForOneTabs
//                                                                           .images[subIndex - 1],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               Positioned(
//                                                                 top: -10,
//                                                                 right: -5,
//                                                                 child:
//                                                                     IconButton(
//                                                                         onPressed:
//                                                                             () {
//                                                                           setState(
//                                                                               () {
//                                                                             testProvider.allRoomFeature[testProvider.tabIndex][index].selectedFeatureForOneTabs.images.removeAt(subIndex -
//                                                                                 1);
//                                                                           });
//                                                                         },
//                                                                         icon:
//                                                                             Icon(
//                                                                           Icons
//                                                                               .cancel,
//                                                                           size:
//                                                                               25,
//                                                                         )),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         );
//                                                 },
//                                               ),
//                                       ],
//                                     ),
//                                   )
//                                 : Container()
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
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
//               height: MediaQuery.of(context).size.height * .08,
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
//     imgCamera =
//         await testProvider.imgPicker.getImage(source: ImageSource.camera);

//     if (imgCamera != null) {
//       Navigator.of(context).pop();
//       photocamera(index);
//       // fileImage.clear();
//     }
//   }

//   late var imgGallery;
//   void openGallery(
//     int index,
//   ) async {
//     imgGallery =
//         await testProvider.imgPicker.getImage(source: ImageSource.gallery);

//     if (imgGallery != null) {
//       Navigator.of(context).pop();
//       textphoto(index);
//     }
//   }

//   Future<void> textphoto(int index) async {
//     Utils.loaderDialog(context, true);
//     if (
//         // _PhotoDescrptionController[index].text.isEmpty ||
//         imgGallery == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Add description or Photo'),
//       ));
//     } else {
//       String image =
//           await testProvider.getImage(context, File(imgGallery.path), ref);
//       testProvider.allRoomFeature[testProvider.tabIndex][index]
//           .selectedFeatureForOneTabs.images
//           .add(image);
//       imgGallery = null;
//     }
//     Utils.loaderDialog(context, false);
//     setState(() {});
//   }

//   Future<void> photocamera(int index) async {
//     Utils.loaderDialog(context, true);
//     if (imgCamera == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Add description or Photo'),
//       ));
//     } else {
//       String image =
//           await testProvider.getImage(context, File(imgGallery.path), ref);
//       testProvider.allRoomFeature[testProvider.tabIndex][index]
//           .selectedFeatureForOneTabs.images
//           .add(image);

//       imgCamera = null;
//     }
//     Utils.loaderDialog(context, false);
//     setState(() {});
//   }
// }

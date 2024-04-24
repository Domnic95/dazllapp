// // ignore_for_file: deprecated_member_use

// import 'dart:developer';
// import 'dart:io';
// import 'package:dazllapp/UI/component/loadingWidget.dart';
// import 'package:dazllapp/UI/homepage/realtor/Create_phd/test_phd/phd_test_provider.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/app_theme.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/colors.dart';
// import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// class TestSingleTab extends ConsumerStatefulWidget {
//   const TestSingleTab({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState<TestSingleTab> createState() => _TestSingleTabState();
// }

// class _TestSingleTabState extends ConsumerState<TestSingleTab> {
//   late TestPhdProvider testprovider;
//   @override
//   void initState() {
//     super.initState();
//     // loaddata();
//     // log("room id ==$roomid");
//     testprovider = ref.read(testphdProvider);
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   int indexs = 0;
//   bool loading = true;

//   Widget build(BuildContext context) {
//     final _roomsfeature = ref.read(customernotifier);
//     final _reltorProvider = ref.read(realtorprovider);
//     testprovider = ref.watch(testphdProvider);
//     final size = MediaQuery.of(context).size;
//     return SizedBox(
//       child: testprovider.isLoading || testprovider.addNewDataLoading
//           ? LoadingWidget()
//           : Container(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               child: SingleChildScrollView(
//                 child: Column(children: [
//                   Text(
//                       "1. Note any exceptional features or selling advantage:"),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     height: size.height * 0.12,
//                     padding: EdgeInsets.only(left: 15),
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             color: AppTheme.grey.withOpacity(0.5), width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white),
//                     child: Stack(
//                       children: [
//                         TextFormField(
//                           controller: testprovider
//                               .allRoomsData[testprovider.tabIndex]
//                               .singleTabController,
//                           minLines: 2,
//                           maxLines: 100,
//                           textInputAction: TextInputAction.done,
//                           cursorColor: AppTheme.colorPrimary,
//                           decoration: InputDecoration(
//                               hintText: "",
//                               hintStyle: Theme.of(context).textTheme.bodyText1,
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent)),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent)),
//                               border: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent))),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     // color: Colors.amber,
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
//                     child: Text(
//                       "2. Add photos of exceptional features or selling advantages",
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       padding: EdgeInsets.zero,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: testprovider
//                               .allRoomsData[testprovider.tabIndex]
//                               .images!
//                               .length +
//                           1,
//                       itemBuilder: (BuildContext context, int Index) {
//                         if (Index == 0) {
//                           return Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: IconButton(
//                                 onPressed: () {
//                                   showOptionsDialog(context, 0, 0, true);
//                                 },
//                                 icon: Icon(Icons.add_a_photo)),
//                           );
//                         }

//                         return Padding(
//                           padding: EdgeInsets.zero,
//                           child: Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               Container(
//                                 // height: 60,
//                                 // width: 60,
//                                 margin: EdgeInsets.only(left: 5),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image: NetworkImage(
//                                       testprovider
//                                           .allRoomsData[testprovider.tabIndex]
//                                           .images![Index - 1],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: -7,
//                                 right: -7,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       testprovider
//                                           .allRoomsData[testprovider.tabIndex]
//                                           .images!
//                                           .removeAt(Index - 1);
//                                     });
//                                   },
//                                   child: Icon(
//                                     Icons.cancel,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           childAspectRatio: 1.2, crossAxisCount: 5),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   testprovider.allRoomsData[testprovider.tabIndex].roomtype!
//                               .length <=
//                           0
//                       ? SizedBox(height: 10)
//                       : SizedBox(
//                           height: 60,
//                           width: size.width,
//                           child: ListView.separated(
//                             separatorBuilder: (context, index) {
//                               return SizedBox(
//                                 width: size.width * 0.1 - 16,
//                               );
//                             },
//                             padding: EdgeInsets.all(8),
//                             scrollDirection: Axis.horizontal,
//                             itemCount: testprovider
//                                 .allRoomsData[testprovider.tabIndex]
//                                 .roomtype!
//                                 .length,
//                             itemBuilder: (context, index) {
//                               // log('vjsdbvkjdfbjk --- ${testprovider.selectRoomTypeFeature[testprovider.tabIndex]}');
//                               // log('vjsdbvkjdfbjk --- ${_reltorProvider.roomTypes[testprovider.tabIndex].first.type!.name}');
//                               String dropdownName = testprovider
//                                       .allRoomsData[testprovider.tabIndex]
//                                       .roomtype![index]
//                                       .selectedtype ??
//                                   '';
//                               return Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: blackColor)),
//                                 child: Center(
//                                   child: DropdownButton<AddValueData>(
//                                     borderRadius: BorderRadius.zero,
//                                     underline: Container(),
//                                     hint: Container(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 4.0),
//                                       child: Text(
//                                         dropdownName.isEmpty
//                                             ? testprovider
//                                                 .allRoomsData[
//                                                     testprovider.tabIndex]
//                                                 .roomtype![index]
//                                                 .type!
//                                                 .name!
//                                             : dropdownName,
//                                         style: TextStyle(color: darkTextColor),
//                                       ),
//                                     ),
//                                     items: testprovider
//                                         .allRoomsData[testprovider.tabIndex]
//                                         .roomtype![index]
//                                         .type!
//                                         .featureOptions!
//                                         .map((value) {
//                                       return DropdownMenuItem<AddValueData>(
//                                         value: value,
//                                         child: Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 8.0),
//                                             child: Text(
//                                               value.name.toString(),
//                                             )),
//                                       );
//                                     }).toList(),
//                                     onChanged: (value) {
//                                       testprovider.selectRoomType(
//                                           data: value!, index: index);
//                                       setState(() {});
//                                     },
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
//                     child: Text(
//                       "3. Are there any additional value added  items",
//                     ),
//                   ),
//                   testprovider.allRoomsData[testprovider.tabIndex].addValueData!
//                               .length <=
//                           0
//                       ? SizedBox()
//                       : SizedBox(
//                           height: 60,
//                           child: ListView.separated(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             separatorBuilder: (context, index) => SizedBox(
//                               width: 15,
//                             ),
//                             itemCount: testprovider
//                                 .allRoomsData[testprovider.tabIndex]
//                                 .addValueData!
//                                 .length,
//                             itemBuilder: (context, index) {
//                               return Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Checkbox(
//                                     checkColor: lightColor,
//                                     activeColor: AppTheme.colorPrimary,
//                                     value: testprovider
//                                             .allRoomsData[testprovider.tabIndex]
//                                             .addValueData![index]
//                                             .optionSelected ??
//                                         false,
//                                     onChanged: (value) {
//                                       testprovider.SelectAddValueData(
//                                           value: value!, index: index);
//                                       setState(() {});
//                                     },
//                                   ),
//                                   Text(
//                                     "${testprovider.allRoomsData[testprovider.tabIndex].addValueData![index].name}",
//                                     style: TextStyle(color: darkTextColor),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                   Row(
//                     children: [
//                       Text("Overall first impressions"),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ListView.builder(
//                     padding: EdgeInsets.zero,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: testprovider.fristImpressionList.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return Row(
//                         children: [
//                           Radio<String>(
//                             activeColor: primaryColor,
//                             value: testprovider.fristImpressionList[index],
//                             groupValue: testprovider
//                                 .allRoomsData[testprovider.tabIndex]
//                                 .impressions,
//                             onChanged: (String? value) {
//                               testprovider.allRoomsData[testprovider.tabIndex]
//                                   .impressions = value!;
//                               // testprovider.selectedFristImpressionList[
//                               //     testprovider.tabIndex] = value;
//                               setState(() {});
//                             },
//                           ),
//                           Text(
//                             testprovider.fristImpressionList[index],
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 color: darkTextColor),
//                           )
//                         ],
//                       );
//                     },
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Buyer Road Blocks or Recommendations?",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: primaryColor, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   ListView.separated(
//                     padding: EdgeInsets.zero,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: testprovider
//                         .allRoomsData[testprovider.tabIndex].data!.length,
//                     separatorBuilder: (BuildContext context, int index) {
//                       return SizedBox(
//                         height: 10,
//                       );
//                     },
//                     itemBuilder: (BuildContext context, int index) {
//                       return Column(
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                   checkColor: lightColor,
//                                   activeColor: AppTheme.colorPrimary,
//                                   value: testprovider
//                                       .allRoomsData[testprovider.tabIndex]
//                                       .data![index]
//                                       .selectedFeatureForOneTabs
//                                       .checkBox,
//                                   onChanged: (val) {
//                                     testprovider.changeCheckBox(
//                                         tabIndex: testprovider.tabIndex,
//                                         selectedFeatureIndex: index,
//                                         value: val!,
//                                         setFeatureId: testprovider
//                                             .allRoomsData[testprovider.tabIndex]
//                                             .data![index]
//                                             .id);
//                                   }),
//                               Text(
//                                 testprovider.allRoomsData[testprovider.tabIndex]
//                                     .data![index].name,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16,
//                                       color: AppTheme.darkerText,
//                                     ),
//                               )
//                             ],
//                           ),
//                           testprovider
//                                   .allRoomsData[testprovider.tabIndex]
//                                   .data![index]
//                                   .selectedFeatureForOneTabs
//                                   .checkBox
//                               ? Container(
//                                   padding: EdgeInsets.only(left: 15, right: 15),
//                                   child: Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         height: size.height * 0.12,
//                                         padding: EdgeInsets.only(left: 15),
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: AppTheme.grey
//                                                     .withOpacity(0.5),
//                                                 width: 2),
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             color: Colors.white),
//                                         child: Stack(
//                                           children: [
//                                             TextFormField(
//                                               controller: testprovider
//                                                   .allRoomsData[
//                                                       testprovider.tabIndex]
//                                                   .data![index]
//                                                   .selectedFeatureForOneTabs
//                                                   .descrptionController,
//                                               minLines: 2,
//                                               maxLines: 100,
//                                               textInputAction:
//                                                   TextInputAction.done,
//                                               cursorColor:
//                                                   AppTheme.colorPrimary,
//                                               decoration: InputDecoration(
//                                                   hintText:
//                                                       "Tell us the issue or desired outcome.",
//                                                   hintStyle: Theme.of(context)
//                                                       .textTheme
//                                                       .bodyText1,
//                                                   focusedBorder:
//                                                       UnderlineInputBorder(
//                                                           borderSide: BorderSide(
//                                                               color: Colors
//                                                                   .transparent)),
//                                                   enabledBorder:
//                                                       UnderlineInputBorder(
//                                                           borderSide: BorderSide(
//                                                               color: Colors
//                                                                   .transparent)),
//                                                   border: UnderlineInputBorder(
//                                                       borderSide: BorderSide(
//                                                           color: Colors
//                                                               .transparent))),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       testprovider
//                                                   .allRoomsData[
//                                                       testprovider.tabIndex]
//                                                   .data![index]
//                                                   .selectedFeatureForOneTabs
//                                                   .images ==
//                                               ''
//                                           ? SizedBox()
//                                           : GridView.builder(
//                                               padding: EdgeInsets.zero,
//                                               physics:
//                                                   NeverScrollableScrollPhysics(),
//                                               shrinkWrap: true,
//                                               itemCount: testprovider
//                                                       .allRoomsData[
//                                                           testprovider.tabIndex]
//                                                       .data![index]
//                                                       .selectedFeatureForOneTabs
//                                                       .images
//                                                       .length +
//                                                   1,
//                                               gridDelegate:
//                                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                                       crossAxisCount: 4,
//                                                       crossAxisSpacing: 4.0,
//                                                       mainAxisSpacing: 4.0),
//                                               itemBuilder: (context, subIndex) {
//                                                 if (subIndex == 0) {
//                                                   return Container(
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                           color: Colors.black),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10),
//                                                     ),
//                                                     child: IconButton(
//                                                         onPressed: () {
//                                                           showOptionsDialog(
//                                                               context,
//                                                               1,
//                                                               index,
//                                                               false);
//                                                         },
//                                                         icon: Icon(
//                                                             Icons.add_a_photo)),
//                                                   );
//                                                 }
//                                                 return testprovider
//                                                             .allRoomsData[
//                                                                 testprovider
//                                                                     .tabIndex]
//                                                             .data![index]
//                                                             .selectedFeatureForOneTabs
//                                                             .images[subIndex - 1] ==
//                                                         ''
//                                                     ? SizedBox()
//                                                     : Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           border: Border.all(
//                                                               color:
//                                                                   Colors.black),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                         ),
//                                                         child: Stack(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           children: [
//                                                             Container(
//                                                               // height: 60,
//                                                               // width: 60,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10),
//                                                                 image:
//                                                                     DecorationImage(
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                   image:
//                                                                       NetworkImage(
//                                                                     testprovider
//                                                                         .allRoomsData[testprovider
//                                                                             .tabIndex]
//                                                                         .data![
//                                                                             index]
//                                                                         .selectedFeatureForOneTabs
//                                                                         .images[subIndex - 1],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                               top: -10,
//                                                               right: -5,
//                                                               child: IconButton(
//                                                                   onPressed:
//                                                                       () {
//                                                                     setState(
//                                                                         () {
//                                                                       testprovider
//                                                                           .allRoomsData[testprovider
//                                                                               .tabIndex]
//                                                                           .data![
//                                                                               index]
//                                                                           .selectedFeatureForOneTabs
//                                                                           .images
//                                                                           .removeAt(subIndex -
//                                                                               1);
//                                                                     });
//                                                                   },
//                                                                   icon: Icon(
//                                                                     Icons
//                                                                         .cancel,
//                                                                     size: 25,
//                                                                   )),
//                                                             )
//                                                           ],
//                                                         ),
//                                                       );
//                                               },
//                                             ),
//                                     ],
//                                   ),
//                                 )
//                               : Container()
//                         ],
//                       );
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ]),
//               ),
//             ),
//     );
//   }

//   Future<void> showOptionsDialog(
//       BuildContext context, int index, int ListIndex, bool isMainImg) {
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
//                       Navigator.of(context).pop();
//                       index == 0
//                           ? openCamera(
//                               isMainImg: isMainImg, dataIndex: ListIndex)
//                           : openCameraRoom(ListIndex, isMainImg);
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
//                       Navigator.of(context).pop();
//                       index == 0
//                           ? openGallery(isMainImg)
//                           : openGalleryRoom(ListIndex, isMainImg);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   late var imgCamera;
//   void openCamera({required bool isMainImg, required int dataIndex}) async {
//     imgCamera =
//         await testprovider.imgPicker.getImage(source: ImageSource.camera);
//     if (imgCamera != null) {
//       photocamera(isMainImg: isMainImg, dataIndex: dataIndex);
//     }
//   }

//   late List<PickedFile>? imgGallery;
//   void openGallery(bool isMainImg) async {
//     imgGallery = await testprovider.imgPicker.getMultiImage();
//     if (imgGallery != null) {
//       textphoto(isMainImg);
//     }
//   }

//   Future<void> textphoto(bool isMainImg) async {
//     if (imgGallery == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Add Photo'),
//       ));
//     } else {
//       Utils.loaderDialog(context, true);
//       // log("kdfgkgfk === ${testprovider.mainImgFile[testprovider.tabIndex]}");
//       for (int i = 0; i < imgGallery!.length; i++) {

//         // testprovider.mainImgFile[testprovider.tabIndex]
//         //     .add(File(imgGallery![i].path));
//         String imageRes = await testprovider.getImage(
//             context, File(imgGallery![i].path), ref);
//         testprovider.allRoomsData[testprovider.tabIndex].images!.add(imageRes);
//       }
//       // log("kdfgkgfk === ${testprovider.mainImgFile[testprovider.tabIndex]}");

//       imgGallery = null;
//     }

//     Utils.loaderDialog(context, false);
//    
//     setState(() {});
//   }

//   Future<void> photocamera(
//       {required bool isMainImg, required dataIndex}) async {
//     if (imgCamera == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Add description or Photo'),
//       ));
//     } else {
//       Utils.loaderDialog(context, true);
//       String imagePhoto =
//           await testprovider.getImage(context, File(imgCamera.path), ref);
//       testprovider.allRoomsData[testprovider.tabIndex].images!.add(imagePhoto);

//       imgCamera = null;
//       Utils.loaderDialog(context, false);
//     }
//     setState(() {});
//   }

//   late var imgCameraRoom;
//   void openCameraRoom(int index, bool isMainImg) async {
//     imgCameraRoom =
//         await testprovider.imgPicker.getImage(source: ImageSource.camera);
//     if (imgCameraRoom != null) {
//       Utils.loaderDialog(context, true);

//       String imagePhoto =
//           await testprovider.getImage(context, File(imgCameraRoom.path), ref);
//       testprovider.allRoomsData[testprovider.tabIndex].data![index]
//           .selectedFeatureForOneTabs.images
//           .add(imagePhoto);
//       imgCameraRoom = null;
//       Utils.loaderDialog(context, false);
//       setState(() {});
//     }
//   }

//   late var imgGalleryRoom;
//   void openGalleryRoom(int index, bool isMainImg) async {
//     imgGalleryRoom = await testprovider.imgPicker.getMultiImage();
//     if (imgGalleryRoom != null) {
//       Utils.loaderDialog(context, true);

//       for (int i = 0; i < imgGalleryRoom.length; i++) {
//         String imagePhoto = await testprovider.getImage(
//             context, File(imgGalleryRoom[i].path), ref);
//         testprovider.allRoomsData[testprovider.tabIndex].data![index]
//             .selectedFeatureForOneTabs.images
//             .add(imagePhoto);
//       }
//       imgGalleryRoom = null;
//       Utils.loaderDialog(context, false);
//       setState(() {});
//     }
//   }

//   void textphotoRoom(int index) {
//     setState(() {
//       if (imgGalleryRoom == null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Add Photo'),
//         ));
//       } else {
//         imgGalleryRoom = null;
//       }
//     });
//   }

//   void photocameraRoom(int index) {
//     setState(() {
//       if (imgCameraRoom == null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Add description or Photo'),
//         ));
//       } else {
//         // log(roomDetailImg.toString());
//         imgCameraRoom = null;
//       }
//     });
//   }
// }

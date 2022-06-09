// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'dart:io';

import 'package:dazllapp/UI/homepage/customer/start_project/needs_attention.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class TellusMore extends StatefulWidget {
  List<String> currentoptionselected;
  List<String> currentissueselected;
  List imgFile;
  List<TextEditingController> DescrptionController;
  TellusMore(
      {required this.currentoptionselected,
      required this.currentissueselected,
      required this.imgFile,
      required this.DescrptionController});

  @override
  _TellusMoreState createState() => _TellusMoreState();
}

class _TellusMoreState extends State<TellusMore> {
  TextEditingController _cabinetController = TextEditingController();
  TextEditingController _inspectionController = TextEditingController();

  @override
  void initState() {
    widget.currentoptionselected
        .removeWhere((element) => ["", 0].contains(element)
            // element.toString().isEmpty
            );
    widget.currentissueselected
        .removeWhere((element) => ["", 0].contains(element)
            // element.toString().isEmpty
            );
    widget.imgFile.removeWhere((element) => ["", 0].contains(element));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   leading: Container(),
      //   elevation: 0,
      // ),
      body: Container(
        child: Column(
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
                  "Tell Us More",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.currentoptionselected.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Current option Selected = " +
                              widget.currentoptionselected[index].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                            "Current issue Selected = " +
                                widget.currentissueselected[index].toString(),
                            style: TextStyle(fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  widget.imgFile[index],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Description = " +
                                widget.DescrptionController[index].text
                                    .toString(),
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  );
                },
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     ListView.builder(
              //       itemCount: 2,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Text(
              //           widget.currentoptionselected[index],
              //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w600,
              //                 color: darkTextColor,
              //               ),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     Container(
              //       height: size.height * 0.07,
              //       padding: EdgeInsets.symmetric(horizontal: 15),
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //               color: AppTheme.grey.withOpacity(0.5), width: 2),
              //           // boxShadow: [
              //           //   BoxShadow(
              //           //       color: AppTheme.grey.withOpacity(0.3),
              //           //       blurRadius: 3,
              //           //       spreadRadius: 1,
              //           //       offset: Offset(3, 3))
              //           // ],
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.white),
              //       child: TextFormField(
              //         controller: _cabinetController,
              //         minLines: 2,
              //         maxLines: 100,
              //         textInputAction: TextInputAction.done,
              //         cursorColor: AppTheme.colorPrimary,
              //         decoration: InputDecoration(
              //             hintText: "Add note to inspection report",
              //             focusedBorder: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.transparent)),
              //             enabledBorder: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.transparent)),
              //             border: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.transparent))),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 25,
              //     ),
              //     Container(
              //       height: size.height * 0.25,
              //       padding: EdgeInsets.symmetric(horizontal: 15),
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //               color: AppTheme.grey.withOpacity(0.5), width: 2),
              //           // boxShadow: [
              //           //   BoxShadow(
              //           //       color: AppTheme.grey.withOpacity(0.3),
              //           //       blurRadius: 3,
              //           //       spreadRadius: 1,
              //           //       offset: Offset(3, 3))
              //           // ],
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.white),
              //       child: TextFormField(
              //         controller: _inspectionController,
              //         minLines: 2,
              //         maxLines: 100,
              //         textInputAction: TextInputAction.done,
              //         cursorColor: AppTheme.colorPrimary,
              //         decoration: InputDecoration(
              //             hintText: "add note to inspection report",
              //             focusedBorder: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.transparent)),
              //             enabledBorder: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.transparent)),
              //             border: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.transparent))),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       "Upload Image",
              //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
              //             fontSize: 20,
              //             fontWeight: FontWeight.w600,
              //             color: darkTextColor,
              //           ),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Container(
              //         height: size.height * 0.35,
              //         child: GridView.builder(
              //             itemCount: images.length,
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //                     // mainAxisExtent: 10,
              //                     crossAxisSpacing: 10,
              //                     mainAxisSpacing: 10,
              //                     crossAxisCount: 3),
              //             itemBuilder: (context, index) {
              //               return index == 0
              //                   ? Container(
              //                       decoration: BoxDecoration(
              //                         color: AppTheme.white,
              //                         borderRadius: BorderRadius.circular(20),
              //                         boxShadow: [
              //                           BoxShadow(
              //                             color: AppTheme.grey.withOpacity(0.5),
              //                             blurRadius: 3,
              //                             offset: Offset(3, 3),
              //                           ),
              //                         ],
              //                       ),
              //                       child: Center(
              //                         child: Icon(
              //                           Icons.add_circle_outline,
              //                           color: AppTheme.colorPrimary
              //                               .withOpacity(0.7),
              //                           size: 50,
              //                         ),
              //                       ),
              //                     )
              //                   : Container(
              //                       decoration: BoxDecoration(
              //                         color: AppTheme.white,
              //                         borderRadius: BorderRadius.circular(20),
              //                         boxShadow: [
              //                           BoxShadow(
              //                             color: AppTheme.grey.withOpacity(0.5),
              //                             blurRadius: 3,
              //                             offset: Offset(3, 3),
              //                           ),
              //                         ],
              //                         image: DecorationImage(
              //                           image: NetworkImage(images[index]),
              //                           fit: BoxFit.cover,
              //                         ),
              //                       ),
              //                     );
              //             })),
              //   ],
              // ),
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
                      // widget.currentissueselected = [];
                      // widget.currentoptionselected = [];
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
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => TellusMore()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Finish & Save",
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
    ));
  }
}

List images = [
  "https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1513584684374-8bab748fbf90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
];

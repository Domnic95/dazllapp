// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SelectFeature extends StatefulHookWidget {
  const SelectFeature({Key? key}) : super(key: key);

  @override
  State<SelectFeature> createState() => _SelectFeatureState();
}

class _SelectFeatureState extends State<SelectFeature> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    final _roomsfeature = context.read(customernotifier);
    await _roomsfeature.getRoomsFeature(roomid);
  }

  TextEditingController _DescrptionController = TextEditingController();
  String _description = "";
  List<File> imgFile = [];
  final imgPicker = ImagePicker();
  List<int> select = [];

  Widget build(BuildContext context) {
    final _roomsfeature = useProvider(customernotifier);
    final size = MediaQuery.of(context).size;
    print("cndcndlcn" + roomid.toString());
    return SafeArea(
      child: Scaffold(
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
                  "Create a Project",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Text(
                      "1. Note any exceptional features or selling advantage:"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size.height * 0.12,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppTheme.grey.withOpacity(0.5), width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: _DescrptionController,
                          minLines: 2,
                          maxLines: 100,
                          textInputAction: TextInputAction.done,
                          cursorColor: AppTheme.colorPrimary,
                          decoration: InputDecoration(
                              hintText: "Add note to inspection report",
                              hintStyle: Theme.of(context).textTheme.bodyText1,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.colorPrimary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _DescrptionController.text.isEmpty
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text('Add description'),
                                      ))
                                    : _description = _DescrptionController.text;
                                _DescrptionController.clear();
                              },
                            ),
                            width: 50,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "2. Add photos of exceptional features or selling advantages"),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showOptionsDialog(context);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 7, bottom: 7, left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: AppTheme.colorPrimary.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text('Add Photos'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                              AppTheme.colorPrimary.withOpacity(0.6),
                          child: IconButton(
                              onPressed: () {
                                if (imgGallery != null) {
                                  textphoto();
                                }
                                if (imgCamera != null) {
                                  photocamera();
                                }
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 18,
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  imgFile == null || imgFile.toString() == File('').toString()
                      ? SizedBox()
                      : ListView.separated(
                          separatorBuilder: (context, subIndex) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: imgFile.length,
                          itemBuilder: (BuildContext context, int Index) {
                            return imgFile[Index] == File('')
                                ? SizedBox()
                                : ListTile(
                                    leading: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            imgFile[Index],
                                          ),
                                        ),
                                      ),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            imgFile.removeAt(Index);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.cancel,
                                          size: 20,
                                        )),
                                  );
                          },
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "3. Provide room-specific details [ADD NOTES AND PHOTOS ON THE NEXT PAGE]"),
                  Expanded(
                      child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _roomsfeature.listOfFeature[index].name,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppTheme.darkerText,
                                    ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: AppTheme.colorPrimary,
                                  value: select.contains(index),
                                  onChanged: (vlue) {
                                    setState(() {
                                      if(select.contains(index)){
                                        select.remove(index);
                                      }
                                      else{
                                         select.add(index);
                                      }
                                    });
                                  }),
                                  Text("DAZLING",style:   Theme.of(context).textTheme.bodyText1!.copyWith(
                                      // fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppTheme.darkerText,
                                    ),),
                            ],
                          ),
                         Row(
                            children: [
                              Checkbox(
                                  activeColor: AppTheme.colorPrimary,
                                  value: select.contains(index),
                                  onChanged: (vlue) {
                                    setState(() {
                                      if(select.contains(index)){
                                        select.remove(index);
                                      }
                                      else{
                                         select.add(index);
                                      }
                                    });
                                  }),
                                  Text("MARKET READY",style:   Theme.of(context).textTheme.bodyText1!.copyWith(
                                      // fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppTheme.darkerText,
                                    ),),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: AppTheme.colorPrimary,
                                  value: select.contains(index),
                                  onChanged: (vlue) {
                                    setState(() {
                                      if(select.contains(index)){
                                        select.remove(index);
                                      }
                                      else{
                                         select.add(index);
                                      }
                                    });
                                  }),
                                  Text("NEEDS DAZL",style:   Theme.of(context).textTheme.bodyText1!.copyWith(
                                      // fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppTheme.darkerText,
                                    ),),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: _roomsfeature.listOfFeature.length,
                  ))
                ]),
              ),
            ),Container(
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
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              color: lightColor.withOpacity(.9),
                            ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>selectRoom()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "Next",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
        )),
      ),
    );
  }

  Future<void> showOptionsDialog(
    BuildContext context,
  ) {
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
                      openCamera();
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
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  late var imgCamera;
  void openCamera() async {
    imgCamera = await imgPicker.getImage(source: ImageSource.camera);

    Navigator.of(context).pop();
  }

  late var imgGallery;
  void openGallery() async {
    imgGallery = await imgPicker.getImage(source: ImageSource.gallery);

    Navigator.of(context).pop();
  }

  void textphoto() {
    setState(() {
      if (imgGallery == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add Photo'),
        ));
      } else {
        imgFile.add(File(imgGallery.path));
        imgGallery = null;
      }
    });
  }

  void photocamera() {
    setState(() {
      if (imgCamera == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add description or Photo'),
        ));
      } else {
        imgFile.add(File(imgCamera.path));
        imgCamera = null;
      }
    });
  }
}

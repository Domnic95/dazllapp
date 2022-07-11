import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/select_feature.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Start_project extends StatefulHookWidget {
  int customerid;
  Start_project({
    required this.customerid,
    Key? key,
  }) : super(key: key);

  @override
  State<Start_project> createState() => _Start_projectState();
}

class _Start_projectState extends State<Start_project> {
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await context.read(customernotifier).getRooms();
  }

  // Set select = {};
  int currentindex = -1;
  @override
  Widget build(BuildContext context) {
    final _roomsNotifier = useProvider(customernotifier);
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
                  "Create a Project",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            Expanded(
              child: Container(
                color: AppTheme.white,
                margin: EdgeInsets.only(
                  // top: size.height * 0.02,
                  left: 10,
                  right: 10,
                  // bottom: size.height * 0.01
                ),
                child: GridView.builder(
                    itemCount: _roomsNotifier.listOfRoom.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentindex == index) {
                              currentindex = -1;
                            } else
                              currentindex = index;
                            roomid = _roomsNotifier.listOfRoom[index].id;
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: currentindex == index
                                    ? AppTheme.shadowcolor
                                    : AppTheme.light_grey,
                                boxShadow: [
                                  currentindex == index
                                      ? BoxShadow(
                                          color: AppTheme.colorPrimary
                                              .withOpacity(0.5),
                                          spreadRadius: 2,
                                          // blurRadius: 3
                                        )
                                      : BoxShadow(),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  _roomsNotifier.listOfRoom[index].image
                                      .toString(),
                                  width: 50,
                                  color: teamRed,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(
                                    _roomsNotifier.listOfRoom[index].name,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: teamRed,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
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
                      currentindex == -1;
                      // ? SizedBox()
                      // :
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Select_feature(
                                cutomerid: widget.customerid,
                              )));
                      _roomsNotifier.listOfoption.clear();
                      _roomsNotifier.listOfissues.clear();
                    },
                    child: Row(
                      children: [
                        currentindex == -1
                            ? SizedBox()
                            : Text(
                                "Next",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 18,
                                      color: lightColor.withOpacity(.9),
                                    ),
                              ),
                        currentindex == -1
                            ? SizedBox()
                            : Icon(
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
    ;
  }
}

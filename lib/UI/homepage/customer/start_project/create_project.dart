import 'package:dazllapp/UI/homepage/customer/home/delegrate.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/needs_attention.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  Set select = {};
  int currentindex = -1;
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
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    itemCount: CreatePlans.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (select.contains(index)) {
                            setState(() {
                              select.remove(index);
                              currentindex = index;
                            });
                            return;
                          }
                          setState(() {
                            select.add(index);
                            currentindex = index;
                          });
                        },
                        child: Card(
                          elevation: 5,
                          // shadowColor: select.contains(index)
                          //     ? teamRed.withOpacity(0.5)
                          //     : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppTheme.white,
                                boxShadow: [
                                  select.contains(index)
                                      ? BoxShadow(
                                          color: AppTheme.colorPrimary
                                              .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 3)
                                      : BoxShadow(),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "${CreatePlans[index].image}",
                                  width: 50,
                                  color: teamRed,
                                ),
                                (index > 2)
                                    ? SizedBox(
                                        height: 8,
                                      )
                                    : Container(),
                                Center(
                                  child: Text(
                                    CreatePlans[index].name,
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NeedAttention()));
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
    ));
  }
}

class CreatePlan {
  String image;
  String name;
  CreatePlan({required this.image, required this.name});
}

List<CreatePlan> CreatePlans = [
  CreatePlan(image: "assets/images/room.png", name: "Room 1"),
  CreatePlan(image: "assets/images/room.png", name: "Room 2"),
  CreatePlan(image: "assets/images/bedroom.png", name: "Bedroom"),
  CreatePlan(image: "assets/images/kitchen.png", name: "Kitchen"),
  CreatePlan(image: "assets/images/living_room.png", name: "Living Room"),
  CreatePlan(image: "assets/images/bath_room.png", name: "Bathroom"),
  CreatePlan(image: "assets/images/dinnertable.png", name: "Dining Room"),
];

import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/tell_us_more.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeedAttention extends StatefulWidget {
  @override
  _NeedAttentionState createState() => _NeedAttentionState();
}

class _NeedAttentionState extends State<NeedAttention> {
  bool immediate = false;
  bool immediate1 = false;
  bool immediate2 = false;
  bool counter = false;
  bool cabinets = false;
  bool floors = false;

  TextEditingController _Attentioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    "What needs attention?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: lightColor.withOpacity(.9),
                        ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "IMMEDIATE\nNEED?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          activeColor: AppTheme.colorPrimary,
                                          value: counter,
                                          onChanged: (val) {
                                            setState(() {
                                              counter = val!;
                                            });
                                          }),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              !counter
                                                  ? counter = true
                                                  : counter = false;
                                            });
                                          },
                                          child: Text(
                                            "Counter",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ),
                                Checkbox(
                                    activeColor: AppTheme.colorPrimary,
                                    value: immediate,
                                    onChanged: (val) {
                                      setState(() {
                                        counter
                                            ? immediate = val!
                                            : immediate = false;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          activeColor: AppTheme.colorPrimary,
                                          value: cabinets,
                                          onChanged: (val) {
                                            setState(() {
                                              cabinets = val!;
                                            });
                                          }),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              !cabinets
                                                  ? cabinets = true
                                                  : cabinets = false;
                                            });
                                          },
                                          child: Text(
                                            "Cabinets",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ),
                                Checkbox(
                                    activeColor: AppTheme.colorPrimary,
                                    value: immediate1,
                                    onChanged: (val) {
                                      setState(() {
                                        cabinets
                                            ? immediate1 = val!
                                            : immediate1 = false;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          activeColor: AppTheme.colorPrimary,
                                          value: floors,
                                          onChanged: (val) {
                                            setState(() {
                                              floors = val!;
                                            });
                                          }),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              !floors
                                                  ? floors = true
                                                  : floors = false;
                                            });
                                          },
                                          child: Text(
                                            "Floors",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ),
                                Checkbox(
                                    activeColor: AppTheme.colorPrimary,
                                    value: immediate2,
                                    onChanged: (val) {
                                      setState(() {
                                        floors
                                            ? immediate2 = val!
                                            : immediate2 = false;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: size.height * 0.25,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppTheme.colorPrimary, width: 2),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: AppTheme.grey.withOpacity(0.3),
                            //       blurRadius: 3,
                            //       spreadRadius: 1,
                            //       offset: Offset(3, 3))
                            // ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
                          controller: _Attentioncontroller,
                          minLines: 2,
                          maxLines: 100,
                          textInputAction: TextInputAction.done,
                          cursorColor: AppTheme.colorPrimary,
                          decoration: InputDecoration(
                              hintText: "Add note to inspection report",
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
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
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
                              builder: (context) => TellusMore()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Next",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

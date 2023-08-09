import 'dart:developer';

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/complitedPhd.dart/complitedPhd.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/complitedPhdProvider.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/model/Realtor/filterProject.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectCustomer extends ConsumerStatefulWidget {
  SelectCustomer({Key? key}) : super(key: key);

  @override
  ConsumerState<SelectCustomer> createState() => _SelectCustomerState();
}

class _SelectCustomerState extends ConsumerState<SelectCustomer> {
  int? customerid;

  String selectedvalue = "Select Customer";
  TextEditingController customeremail = TextEditingController();
  ComplitedPhdProvider? _complitedPhdProvider;
  @override
  void initState() {
    super.initState();
    _complitedPhdProvider = ref.read(complitedPhdProvider);
    load();
  }

  load() async {
    await _complitedPhdProvider!.loadCustomer(ref: ref);
    _complitedPhdProvider!.loader(Loading.complited);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final realtorProvider = ref.watch(realtorprovider);
    _complitedPhdProvider = ref.watch(complitedPhdProvider);
    return SafeArea(
      child: _complitedPhdProvider!.loading == Loading.loding
          ? LoadingWidget()
          : Scaffold(
              body: Column(children: [
                CommonHeader(title: "PHD Project-Summary"),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: DropdownButton<FilterProject>(
                          underline: Container(),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(20),
                          hint: _complitedPhdProvider!.selectedCustomer == null
                              ? Text('Select Customer')
                              : Text(
                                  _complitedPhdProvider!.selectedCustomer!.email
                                      .toString(),
                                ),
                          items: realtorProvider.filterProjectList
                              .map((dropdownselect) {
                            return DropdownMenuItem<FilterProject>(
                              child: Text(dropdownselect.email!),
                              value: _complitedPhdProvider!.selectedCustomer ??
                                  _complitedPhdProvider!
                                      .listOfFilterProject.first,
                              onTap: () {
                                _complitedPhdProvider!
                                    .selectCustomer(dropdownselect);
                              },
                            );
                          }).toList(),
                          onChanged: (newselectedvalue) async {
                            // log("djfgldjfgjlkdfgjlkf 123=== ${newselectedvalue!.email}");
                            // // _complitedPhdProvider!
                            // //     .selectCustomer(newselectedvalue!);
                            // // log("djfgldjfgjlkdfgjlkf === ${_complitedPhdProvider!.selectedCustomer!.email}");
                            // setState(() {});
                            // // setState(() {
                            // //   customer_provider.listofcustomers[0].name =
                            // //       newselectedvalue!;
                            // // });
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: AppTheme.colorPrimary),
                  onPressed: () {
                    // if (customer_provider.listofcustomers[0].name ==
                    //     "Select Customer") {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('Select customer')));
                    // } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ComplitedPhd(
                            // customerid: customerid!,
                            )));
                    // }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //   SizedBox(
                //     height: 50,
                //   ),
                //   Align(
                //     alignment: Alignment.centerLeft,
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 10, right: 10),
                //       child: Text(
                //         'Add Email of customer if customer is not present',
                //         style: TextStyle(fontSize: 13),
                //       ),
                //     ),
                //   ),
                //   SizedBox(
                //     height: 10,
                //   ),
                //   Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: TextFormField(
                //       controller: customeremail,
                //       cursorColor: AppTheme.nearlyBlack,
                //       decoration: InputDecoration(
                //         hintText: "Email Address",
                //         label: Text('Email'),
                //         isDense: true,
                //         focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.black)),
                //         hintStyle: TextStyle(
                //             color: AppTheme.darkerText,
                //             fontFamily: AppTheme.fontName,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400),
                //         labelStyle: TextStyle(
                //             color: const Color(0xFF424242),
                //             fontFamily: AppTheme.fontName,
                //             fontSize: 14),
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.black),
                //         ),
                //       ),
                //     ),
                //   ),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   ElevatedButton(
                //     style:
                //         ElevatedButton.styleFrom(primary: AppTheme.colorPrimary),
                //     onPressed: () async {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => Start_project(
                //                 customerid: customerid!,
                //                 customeremail: customeremail.text,
                //               )));
                //     },
                //     child: Text(
                //       'Next',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
              ]),
            ),
    );
  }
}

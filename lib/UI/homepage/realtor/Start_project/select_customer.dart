import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/start_project.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Select_customer extends ConsumerStatefulWidget {
  Select_customer({Key? key}) : super(key: key);

  @override
  ConsumerState<Select_customer> createState() => _Select_customerState();
}

class _Select_customerState extends ConsumerState<Select_customer> {
  int? customerid;
  bool loading = true;
  String selectedvalue = "Select Customer";
  TextEditingController customeremail = TextEditingController();
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    await ref.read(realtorprovider).getcustomers();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final customer_provider = ref.read(realtorprovider);
    return SafeArea(
      child: loading
          ? LoadingWidget()
          : Scaffold(
              body: Column(children: [
                CommonHeader(title: "Start Project", isback: false),
                SizedBox(
                  height: 20,
                ),
                Icon(Icons.add_circle_sharp, color: AppTheme.colorPrimary),
                SizedBox(
                  height: 10,
                ),
                Text('Add Customer'),
                SizedBox(
                  height: 30,
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
                        child: DropdownButton<String>(
                          underline: Container(),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(20),
                          hint: customer_provider.listofcustomers[0] ==
                                  customer_provider.listofcustomers[0].firstName
                              ? Text('Select Customer')
                              : Text(
                                  customer_provider.listofcustomers[0].name,
                                ),
                          items: customer_provider.listofcustomers
                              .map((dropdownselect) {
                            return DropdownMenuItem<String>(
                              child: Row(
                                children: [
                                  Text(dropdownselect.firstName),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(dropdownselect.lastName),
                                ],
                              ),
                              value: dropdownselect.firstName +
                                  " " +
                                  dropdownselect.lastName,
                              onTap: () {
                                customerid = dropdownselect.id;
                                print(customerid);
                              },
                            );
                          }).toList(),
                          onChanged: (newselectedvalue) async {
                            setState(() {
                              customer_provider.listofcustomers[0].name =
                                  newselectedvalue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.colorPrimary),
                  onPressed: () {
                    if (customer_provider.listofcustomers[0].name ==
                        "Select Customer") {
                            toastShowError(context, 'Select customer');
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Select customer')));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Start_project(
                              // customerid: customerid!,
                              )));
                    }
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

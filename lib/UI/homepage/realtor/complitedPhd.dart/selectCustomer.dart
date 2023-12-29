import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/complitedPhd.dart/complitedPhd.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/complitedPhdProvider.dart';
import 'package:dazllapp/UI/homepage/realtor/realtor_homepage.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
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
  late RealtorNotifier _realtorProvider;

  @override
  void initState() {
    super.initState();
    _complitedPhdProvider = ref.read(complitedPhdProvider);
    _realtorProvider = ref.read(realtorprovider);
    load();
  }

  load() async {
    await _complitedPhdProvider!.loadCustomer(ref: ref);
    await _realtorProvider.getComplitedPhd();
    _complitedPhdProvider!.loader(Loading.complited);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final realtorProvider = ref.watch(realtorprovider);
    _complitedPhdProvider = ref.watch(complitedPhdProvider);
    return _complitedPhdProvider!.loading == Loading.loding
        ? LoadingWidget()
        : WillPopScope(
            onWillPop: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RealtorHomePage(),
                ),
              );
              return true;
            },
            child: Scaffold(
              body: Column(children: [
                CommonHeader(
                  title: "PHD Project-Summary",
                  isback: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: realtorProvider.filterProjectList.isEmpty
                      ? Center(
                          child: Text("No Project Found"),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: realtorProvider.filterProjectList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  _complitedPhdProvider!.selectCustomer(
                                      realtorProvider.filterProjectList[index]);
                                  setState(() {});
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ComplitedPhd(
                                          // customerid: customerid!,
                                          ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Property :',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                realtorProvider
                                                    .filterProjectList[index]
                                                    .location!
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        horizontalTitleGap: 0,
                                        trailing: GestureDetector(
                                          onTap: () async {
                                            await _complitedPhdProvider!
                                                .selectCustomer(realtorProvider
                                                    .filterProjectList[index]);
                                            _complitedPhdProvider
                                                ?.loadComplitedPhd(ref: ref);

                                            _complitedPhdProvider
                                                ?.loader(Loading.complited);
                                            deleteProjectDilouge(context);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // child: Card(
                                //   child: Container(
                                //     height: 50,
                                //     padding: EdgeInsets.only(left: 10, right: 15),
                                //     alignment: Alignment.centerLeft,
                                //     width: double.infinity,
                                //     color: Colors.grey.shade200,
                                //     child: Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.spaceBetween,
                                //       children: [
                                //         Expanded(
                                //           child: Text(
                                //             realtorProvider
                                //                 .filterProjectList[index].location!,
                                //             overflow: TextOverflow.ellipsis,
                                //           ),
                                //         ),
                                //         SizedBox(width: 10),
                                //         GestureDetector(
                                //           onTap: () async {
                                //             await _complitedPhdProvider!
                                //                 .selectCustomer(realtorProvider
                                //                     .filterProjectList[index]);
                                //             _complitedPhdProvider?.loadComplitedPhd(
                                //                 ref: ref);

                                //             _complitedPhdProvider
                                //                 ?.loader(Loading.complited);
                                //             deleteProjectDilouge(context);
                                //           },
                                //           child: Icon(
                                //             Icons.delete,
                                //             color: primaryColor,
                                //             size: 20,
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ),
                            );
                          },
                        ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppTheme.colorPrimary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RealtorHomePage(),
                              ),
                              (route) => false,
                            );
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
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      color: lightColor.withOpacity(.9),
                                    ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Container(
                //     width: size.width,
                //     child: DecoratedBox(
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 0.2),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsets.only(
                //           left: 10,
                //           right: 10,
                //           top: 0,
                //         ),
                //         child: DropdownButton<FilterProject>(
                //           underline: Container(),
                //           isExpanded: true,
                //           // borderRadius: BorderRadius.circular(20),
                //           hint:
                //               _complitedPhdProvider!.selectedCustomer == null
                //                   ? Text('Select Customer')
                //                   : Text(
                //                       _complitedPhdProvider!
                //                           .selectedCustomer!.location
                //                           .toString(),
                //                     ),
                //           items: realtorProvider.filterProjectList
                //               .map((dropdownselect) {
                //             return DropdownMenuItem<FilterProject>(
                //               child: Container(
                //                   decoration: BoxDecoration(
                //                       border: Border(
                //                           bottom: BorderSide(
                //                               color: darkTextColor))),
                //                   child: Text(
                //                     dropdownselect.location!,
                //                     overflow: TextOverflow.ellipsis,
                //                   )),
                //               value:
                //                   _complitedPhdProvider!.selectedCustomer ??
                //                       _complitedPhdProvider!
                //                           .listOfFilterProject.first,
                //               onTap: () {
                //                 _complitedPhdProvider!
                //                     .selectCustomer(dropdownselect);
                //               },
                //             );
                //           }).toList(),
                //           onChanged: (newselectedvalue) async {
                //             // log("djfgldjfgjlkdfgjlkf 123=== ${newselectedvalue!.email}");
                //             // // _complitedPhdProvider!
                //             // //     .selectCustomer(newselectedvalue!);
                //             // // log("djfgldjfgjlkdfgjlkf === ${_complitedPhdProvider!.selectedCustomer!.email}");
                //             // setState(() {});
                //             // // setState(() {
                //             // //   customer_provider.listofcustomers[0].name =
                //             // //       newselectedvalue!;
                //             // // });
                //           },
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       primary: AppTheme.colorPrimary),
                //   onPressed: () {
                //     // if (customer_provider.listofcustomers[0].name ==
                //     //     "Select Customer") {
                //     //   ScaffoldMessenger.of(context).showSnackBar(
                //     //       SnackBar(content: Text('Select customer')));
                //     // } else {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => ComplitedPhd(
                //             // customerid: customerid!,
                //             )));
                //     // }
                //   },
                //   child: Text(
                //     'Next',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
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

  deleteProjectDilouge(BuildContext context) async {
    final realtorProvider = ref.read(realtorprovider);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete Project',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Are you sure you want to delete this project ?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actionsPadding: EdgeInsets.all(8),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () async {
              // log('value of that data is --.> ' +
              //     realtorProvider
              //         .singleComplitedPhdReport!.reports!.first.projectId!
              //         .toString());
              if (realtorProvider
                  .singleComplitedPhdReport!.reports!
                  .isNotEmpty) {
                await realtorProvider.deletePhdReport(
                    realtorProvider
                        .singleComplitedPhdReport!.reports!.first.projectId!,
                    context);
                load();
                Navigator.pop(context);
              } else {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('No Data, something went wrong!'),
                  backgroundColor: primaryColor,
                ));
              }
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

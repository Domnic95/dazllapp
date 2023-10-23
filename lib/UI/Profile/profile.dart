import 'dart:developer';

import 'package:dazllapp/UI/component/customTextfield.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfile extends ConsumerStatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends ConsumerState<MyProfile> {
  RealtorNotifier? realtorNotifier;
  CustomerNotifier? customerNotifier;
  int realtorId = -1;
  bool isLoading = false;
  bool isLoading2 = false;
  int currentIndex = -1;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    currentIndex = await SpHelpers.getInt(SharedPrefsKeys.currentindex) ?? -1;
    if (mounted) {
      setState(() {});
    }
    switch (currentIndex) {
      case 0:
        realtorNotifier = ref.read(realtorprovider);
        // if (realtorNotifier!.realtorUser == null) {
        isLoading2 = true;
        String realtorUser =
            await SpHelpers.getString(SharedPrefsKeys.realtorUser) ?? "";
        log("szjdsajjdl === $realtorUser");
        if (realtorUser.isNotEmpty) {
          await realtorNotifier!.setRealtorUser(realtorUser);
          initializeRealtorTextField();
          // }
          // realtorId = int.parse(
          //     await SpHelpers.getString(SharedPrefsKeys.Realtor_id) ?? "-1");
          // if (realtorId != -1 && realtorNotifier!.realtorUser == null) {
          //   await realtorNotifier!
          //       .getRealtor(realtorId: realtorId)
          //       .then((value) {
          //     // if (mounted) {
          //     //   setState(() {});
          //     // }
          //     initializeRealtorTextField();
          //   });
          // }
        } else {
          isLoading2 = true;
          initializeRealtorTextField();
        }
        break;
      case 1:
        break;
      case 2:
        customerNotifier = ref.read(customernotifier);
        await customerNotifier!.setCustomerModel();
        initializeCusTexfield();
        break;
    }
  }

  void initializeCusTexfield() {
    isLoading2 = true;
    isReadOnly = true;
    _nameController = TextEditingController(
        text: customerNotifier!.customerUserModel!.data!.firstName!);
    _lastNameController = TextEditingController(
        text: customerNotifier!.customerUserModel!.data!.lastName!);
    _emailController = TextEditingController(
        text: customerNotifier!.customerUserModel!.data!.email!);
    _phoneController = TextEditingController(
        text: customerNotifier!.customerUserModel!.data!.phoneNumber!);
    isLoading2 = false;
    if (mounted) {
      setState(() {});
    }
  }

  void initializeRealtorTextField() {
    realtorNotifier = ref.watch(realtorprovider);
    log("message  == ${realtorNotifier!.realtorUser!.firstName!}");
    isReadOnly = true;
    _nameController =
        TextEditingController(text: realtorNotifier!.realtorUser!.firstName!);
    _lastNameController =
        TextEditingController(text: realtorNotifier!.realtorUser!.lastName!);
    _emailController =
        TextEditingController(text: realtorNotifier!.realtorUser!.email!);
    _agencyNameController = TextEditingController(
        text: realtorNotifier!.realtorUser!.realStateAgencyName!);
    _cityNameController = TextEditingController(
        text: realtorNotifier!.realtorUser!.cityOfRealStateAgency ?? "");
    _stateNameController =
        TextEditingController(text: realtorNotifier!.realtorUser!.state ?? "");
    _zipCodeController = TextEditingController(
        text: realtorNotifier!.realtorUser!.zipCode?.toString() ?? "");
    _phoneController =
        TextEditingController(text: realtorNotifier!.realtorUser!.phoneNumber!);
    isLoading2 = false;
    if (mounted) {
      setState(() {});
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _agencyNameController = TextEditingController();
  TextEditingController _cityNameController = TextEditingController();
  TextEditingController _stateNameController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    realtorNotifier = ref.watch(realtorprovider);
    customerNotifier = ref.watch(customernotifier);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          backgroundColor: primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: lightColor,
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            currentIndex == 0
                ? "Agent Profile"
                : currentIndex == 1
                    ? ""
                    : currentIndex == 2
                        ? "My Info"
                        : "",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  color: lightColor.withOpacity(.9),
                ),
          ),
        ),
        body: isLoading2
            ? LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height: size.height * 0.12,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(20),
                    //         bottomRight: Radius.circular(20),
                    //       ),
                    //       color: AppTheme.colorPrimary),
                    //   child: SafeArea(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         InkWell(
                    //           onTap: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //           child: SizedBox(
                    //             width: 30,
                    //             child: Padding(
                    //               padding: const EdgeInsets.only(left: 8.0),
                    //               child: Icon(
                    //                 Icons.arrow_back,
                    //                 color: lightColor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Text(
                    //           currentIndex == 0
                    //               ? "Agent Profile"
                    //               : currentIndex == 1
                    //                   ? ""
                    //                   : currentIndex == 2
                    //                       ? "My Info"
                    //                       : "",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodyText1!
                    //               .copyWith(
                    //                 fontSize: 16,
                    //                 color: lightColor.withOpacity(.9),
                    //               ),
                    //           // style: Theme.of(context)
                    //           //     .textTheme
                    //           //     .bodyText1!
                    //           //     .copyWith(
                    //           //       fontSize: 14,
                    //           //       color: lightColor.withOpacity(.9),
                    //           //     ),
                    //         ),
                    //         SizedBox(
                    //           width: 38,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                   
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "First Name:",
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          CustomTextField(
                            controller: _nameController,
                            label: 'Frist Name',
                            // initialValue: realtorNotifier!.realtorUser!.firstName!,
                            isReadOnly: isReadOnly,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Last Name:",
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          CustomTextField(
                            controller: _lastNameController,
                            label: 'Last Name',
                            // initialValue: realtorNotifier!.realtorUser!.lastName!,
                            isReadOnly: isReadOnly,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email Id:",
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          CustomTextField(
                              // initialValue: realtorNotifier!.realtorUser!.email!,
                              controller: _emailController,
                              isReadOnly: isReadOnly,
                              label: 'Email Id'),
                          SizedBox(
                            height: 10,
                          ),
                          currentIndex == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Real Estate Agency Name:",
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    CustomTextField(
                                        // initialValue:
                                        //     realtorNotifier!.realtorUser!.realStateAgencyName!,
                                        isReadOnly: isReadOnly,
                                        controller: _agencyNameController,
                                        label: 'Real Estate Agency Name'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Real Estate City:",
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    CustomTextField(
                                        isReadOnly: isReadOnly,
                                        // initialValue: realtorNotifier!
                                        // .realtorUser!.cityOfRealStateAgency!,
                                        controller: _cityNameController,
                                        label: 'Real Estate City'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Real Estate State:",
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    CustomTextField(
                                        isReadOnly: isReadOnly,
                                        // initialValue: realtorNotifier!.realtorUser!.state!,
                                        controller: _stateNameController,
                                        label: 'Real Estate State'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Zip Code:",
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    CustomTextField(
                                        isReadOnly: isReadOnly,
                                        keyboardType: TextInputType.number,
                                        // initialValue:
                                        //     realtorNotifier!.realtorUser!.zipCode!.toString(),
                                        controller: _zipCodeController,
                                        label: 'Zip code'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          Text(
                            "Phone:",
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          CustomTextField(
                              isReadOnly: isReadOnly,
                              // initialValue:
                              //     realtorNotifier!.realtorUser!.phoneNumber!??"",
                              controller: _phoneController,
                              label: 'Phone'),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: InkWell(
          onTap: () async {
            if (isReadOnly) {
              isReadOnly = false;
              isLoading = false;
              setState(() {});
            } else {
              try {
                if (currentIndex == 0) {
                  Map<String, dynamic> data = {
                    'first_name': _nameController.text.isEmpty
                        ? ''
                        : _nameController.text,
                    "last_name": _lastNameController.text.isEmpty
                        ? ''
                        : _lastNameController.text,
                    'phone_number': _phoneController.text.isEmpty
                        ? ''
                        : _phoneController.text,
                    'real_state_agency_name': _agencyNameController.text.isEmpty
                        ? ''
                        : _agencyNameController.text,
                    'city_of_real_state_agency':
                        _cityNameController.text.isEmpty
                            ? ''
                            : _cityNameController.text,
                    'state': _stateNameController.text.isEmpty
                        ? ''
                        : _stateNameController.text,
                    'zip_code': _zipCodeController.text.isEmpty
                        ? null
                        : int.parse(_zipCodeController.text),
                    // 'email': _emailController.text.isEmpty
                    //     ? ''
                    //     : _emailController.text,
                  };
                  isLoading = true;
                  setState(() {});
                  int realtorId = await int.parse(
                      SpHelpers.getString(SharedPrefsKeys.Realtor_id) ?? "-1");
                  if (realtorId != -1) {
                    await realtorNotifier!
                        .updateRealtor(data: data, realtorId: realtorId)
                        .then((value) {
                      isReadOnly = true;
                      isLoading = false;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('User Update Successfully')));
                      loadData();
                    });
                  }
                } else if (currentIndex == 1) {
                } else if (currentIndex == 2) {
                  Map<String, dynamic> data = {
                    "email": _emailController.text,
                    "first_name": _nameController.text,
                    "last_name": _lastNameController.text,
                    "phone_number": _phoneController.text,
                  };
                  isLoading = true;
                  setState(() {});
                  await customerNotifier!.updateUser(data: data).then((value) {
                    isReadOnly = true;
                    isLoading = false;

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('User Update Successfully')));
                    initializeRealtorTextField();
                    log("message == ${isReadOnly}");
                  });
                }
              } catch (e) {
                isReadOnly = true;
                isLoading = false;
                setState(() {});
                throw e;
              }
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primaryColor),
            child: isLoading
                ? CircularProgressIndicator(
                    color: lightColor,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isReadOnly
                          ? SizedBox(
                              width: 5,
                            )
                          : SizedBox(),
                      isReadOnly
                          ? Icon(
                              Icons.edit,
                              color: lightColor,
                            )
                          : SizedBox(),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        isReadOnly ? "Edit Profile" : "Submit",
                        style: TextStyle(color: lightColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
          ),
        )
        // FloatingActionButton(
        //   onPressed: () {
        //     isReadOnly = false;
        //     setState(() {});
        //   },
        //   child: Icon(
        //     Icons.edit,
        //     color: lightColor,
        //   ),
        // ),

        );
  }
}

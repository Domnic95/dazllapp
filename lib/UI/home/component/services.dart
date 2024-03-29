// ignore_for_file: prefer_const_constructors, unused_import, sized_box_for_whitespace

import 'dart:developer';

import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/global.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServiceModel {
  final String? image;
  final String label;
  ServiceModel({this.image, this.label = ""});
}

List<ServiceModel> services = [
  ServiceModel(label: 'For Agents', image: 'assets/images/realtorBG.jpg'),
  ServiceModel(label: 'For Pros', image: 'assets/images/proBG.jpg'),
  ServiceModel(label: 'For Homeowners', image: 'assets/images/customerBG.jpg'),
];

class ServicesWidget extends ConsumerStatefulWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends ConsumerState<ServicesWidget> {
  int selectedIndx = -1;
  @override
  void dispose() {
    super.dispose();
    setState(() {
      selectedIndx = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final serviceProvider = ref.read(serviceProviders);
    selectedIndx = serviceProvider.curruntindex;

    return Container(
      height: size.width * .4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final model = services[i];
          return Container(
            width: size.width * .5,
            height: size.width * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                model.image ?? 'assets/images/logo.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(.2),
                              BlendMode.darken,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            selectedIndx = i;
                            log("selected index are=-=-=-${selectedIndx}");
                          });
                          await serviceProvider.setSevice(selectedIndx);
                          // if (SpHelpers.getInt(SharedPrefsKeys.key_current) !=
                          //     i) {

                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                          // }
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Text(
                                model.label,
                                style: textTheme.bodyLarge!
                                    .copyWith(color: lightColor, fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                // Center(
                //   child: Text(
                //     services[i].label,
                //     style: textTheme.bodyText1!
                //         .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                //     maxLines: 1,
                //   ),
                // ),
              ],
            ),
          );
        },
        itemCount: services.length,
      ),
    );
  }
}

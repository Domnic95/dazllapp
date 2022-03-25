// ignore_for_file: prefer_const_constructors

import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final String? image;
  final String label;
  ServiceModel({this.image, this.label = ""});
}

List<ServiceModel> services = [
  ServiceModel(label: 'Real Estate Pros', image: 'assets/images/kichen.png'),
  ServiceModel(label: 'Service Props', image: 'assets/images/livingRoom.png'),
  ServiceModel(label: 'Homeowners', image: 'assets/images/bathroom.png'),
];

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
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
                                model.image ?? 'assets/images/kichen.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(.2), BlendMode.darken),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        index: i,
                                      )),
                              (route) => false);
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: darkRed,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Text(
                                "Read More \n or Sign Up",
                                style: textTheme.bodyText1!
                                    .copyWith(color: lightColor, fontSize: 10),
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
                Center(
                  child: Text(
                    services[i].label,
                    style: textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: services.length,
      ),
    );
  }
}

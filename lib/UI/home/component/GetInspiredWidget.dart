// ignore_for_file: file_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class GetInspiredWidget extends StatefulWidget {
  GetInspiredWidget({Key? key}) : super(key: key);

  @override
  _GetInspiredWidgetState createState() => _GetInspiredWidgetState();
}

class _GetInspiredWidgetState extends State<GetInspiredWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'Get Inspired',
            style: textTheme.bodyText1!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: darkTextColor.withOpacity(.7)),
          ),
        ),
        Container(
          height: size.height * .25,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final model = inpriredModel[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: size.width * .60,
                    // color: Colors.teal,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              model.image ?? 'assets/images/realEstate.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(.3), BlendMode.darken)),
                    ),
                    child: Center(
                      child: Text(
                        model.label,
                        style: textTheme.bodyText2!
                            .copyWith(color: lightColor, fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
              itemCount: inpriredModel.length,
            ),
          ),
        ),
      ],
    );
  }
}

class GetInspiredModel {
  final String? image;
  final String label;
  GetInspiredModel({this.image, this.label = ""});
}

List<GetInspiredModel> inpriredModel = [
  GetInspiredModel(label: 'Living Room', image: 'assets/images/LivingRm-Img.jpg'),
  GetInspiredModel(label: 'Kitchen', image: 'assets/images/Kitchen-Img.jpg'),
  GetInspiredModel(label: 'Bathroom', image: 'assets/images/Bath-Img.jpg'),
  GetInspiredModel(
      label: 'Outedoor Space', image: 'assets/images/Outdoor-Img.jpg'),
];

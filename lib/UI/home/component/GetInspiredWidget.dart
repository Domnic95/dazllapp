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
  GetInspiredModel(label: 'Living Room', image: 'assets/images/kichen.png'),
  GetInspiredModel(label: 'Kitchen', image: 'assets/images/livingRoom.png'),
  GetInspiredModel(label: 'Bathroom', image: 'assets/images/bathroom.png'),
  GetInspiredModel(
      label: 'Outedoor Space', image: 'assets/images/outdorr_space.png'),
];

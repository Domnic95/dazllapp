import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/Select_room.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateANewPhd extends StatefulHookWidget {
  String? city;
  String? state;
  String? pincode;
  String? first_name;
  String? Last_name;
  String? ClientEmailAddress;
  String? streetNum;
  String? streetName;
  String? streetType;
  CreateANewPhd({
    Key? key,
    this.city,
    this.state,
    this.pincode,
    this.first_name,
    this.Last_name,
    this.ClientEmailAddress,
    this.streetNum,
    this.streetName,
    this.streetType,
  }) : super(key: key);

  @override
  State<CreateANewPhd> createState() => _CreateANewPhdState();
}

class _CreateANewPhdState extends State<CreateANewPhd> {
  int start = 450;
  int end = 800;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    final _housedata = context.read(realtorprovider);
    await _housedata.gethousedata(
        city: widget.city,
        state: widget.state,
        pincode: widget.pincode,
        first_name: widget.first_name,
        Last_name: widget.Last_name,
        ClientEmailAddress: widget.ClientEmailAddress,
        streetNum: widget.streetNum,
        streetName: widget.streetName,
        streetType: widget.streetType,
        context: context);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _housedata = useProvider(realtorprovider);
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Column(
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
                "Create a new phd",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      color: lightColor.withOpacity(.9),
                    ),
              ),
            ),
          ),
          Expanded(
              child: loading
                  ? LoadingWidget()
                  : Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "\$ " + "${(start + end) / 2}",
                        )),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackShape: RectangularSliderTrackShape(),
                            trackHeight: 8.0,

                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 9.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 18.0),
                            valueIndicatorShape: RoundSliderOverlayShape(),
                            // valueIndicatorColor: Color.fromARGB(255, 205, 25, 25),
                            valueIndicatorTextStyle: TextStyle(
                                color: AppTheme.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                            rangeThumbShape: RoundRangeSliderThumbShape(),
                            rangeValueIndicatorShape:
                                PaddleRangeSliderValueIndicatorShape(),
                          ),
                          child: RangeSlider(
                            values:
                                RangeValues(start.toDouble(), end.toDouble()),
                            min: 450,
                            max: 800,
                            semanticFormatterCallback: (rangeValues) {
                              return '${start.round()} - ${end.round()} dollars';
                            },
                            //added talk back feature for android
                            divisions: 100,
                            labels: RangeLabels('\$ ${start}', '\$ ${end}'),
                            activeColor: AppTheme.colorPrimary,
                            inactiveColor: Color(0xffD7D8DD),
                            onChanged: (RangeValues newRange) {
                              setState(() {
                                start = int.parse(
                                    newRange.start.toStringAsFixed(0));
                                end =
                                    int.parse(newRange.end.toStringAsFixed(0));
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("450K"),
                            Text("500K"),
                            Text("550K"),
                            Text("600K"),
                            Text("650K"),
                            Text("700K"),
                            Text("750K"),
                            Text("800K"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          width: 500,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://dazlpro.com/_next/static/image/Modules/CreatePHD/Images/04-RE-Pros-Console-Blkgd.4eec75d84707a3439a778bcc0745104b.jpg"))),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Card(
                                margin: EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ExpansionTile(
                                  iconColor: Colors.grey,
                                  collapsedIconColor: Colors.grey,
                                  childrenPadding:
                                      EdgeInsets.only(left: 25, bottom: 15),
                                  expandedAlignment: Alignment.topLeft,
                                  title: Text(" Public Records",
                                      style: TextStyle(
                                          color: AppTheme.colorPrimary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Bed: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata.housedata!.bedrooms
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "House Size: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata.housedata!.yearBuilt
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Lot Size: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata.housedata!.lotSize
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Property Type: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata
                                                  .housedata!.structureType
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Date Updated: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata.housedata!.yearBuilt
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ExpansionTile(
                                  iconColor: Colors.grey,
                                  collapsedIconColor: Colors.grey,
                                  childrenPadding:
                                      EdgeInsets.only(left: 25, bottom: 15),
                                  expandedAlignment: Alignment.topLeft,
                                  title: Text("House Details",
                                      style: TextStyle(
                                          color: AppTheme.colorPrimary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Bathrooms: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata.housedata!.bathrooms
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Rooms: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Stories: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              " 0",
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Year Built: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata.housedata!.yearBuilt
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Style: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _housedata
                                                  .housedata!.structureType
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
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
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              color: lightColor.withOpacity(.9),
                            ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => selectRoom()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "Next",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
    ));
  }
}

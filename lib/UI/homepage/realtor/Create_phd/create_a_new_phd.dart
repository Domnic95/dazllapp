import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/Create_phd/Select_room.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/phdProvider.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateANewPhd extends ConsumerStatefulWidget {
  final String? city;
  // final String? state;
  final String? pincode;
  final String? first_name;
  final String? Last_name;
  final String? ClientEmailAddress;
  final String? streetNum;
  final String? streetName;
  final String? streetType;
  CreateANewPhd({
    Key? key,
    this.city,
    // this.state,
    this.pincode,
    this.first_name,
    this.Last_name,
    this.ClientEmailAddress,
    this.streetNum,
    this.streetName,
    this.streetType,
  }) : super(key: key);

  @override
  ConsumerState<CreateANewPhd> createState() => _CreateANewPhdState();
}

class _CreateANewPhdState extends ConsumerState<CreateANewPhd> {
  // int start = 450;
  // int end = 800;
  bool loading = true;
  late PhdProvider _phdProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata();
  }

  loaddata() async {
    _phdProvider = ref.read(phdProvider);
    final _housedata = ref.read(realtorprovider);
    await _housedata.gethousedata(
        address: _phdProvider.address,
        // state: widget.state,
        pincode: widget.pincode,
        first_name: widget.first_name,
        Last_name: widget.Last_name,
        // ClientEmailAddress: widget.ClientEmailAddress,
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
    final _housedata = ref.read(realtorprovider);

    final size = MediaQuery.of(context).size;
    final _phdProvider = ref.read(
      phdProvider,
    );
    return Scaffold(
      body: Column(
        children: [
          CommonHeader(title: "Create a new phd", isback: false),
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
                                "Adjust the value based on your knowledge"
                                // "\$ " +
                                //     "${(_phdProvider.startRange + _phdProvider.endRange) / 2}",
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
                            values: RangeValues(
                                _phdProvider.startRange.toDouble(),
                                _phdProvider.endRange.toDouble()),
                            min: 450,
                            max: 800,
                            semanticFormatterCallback: (rangeValues) {
                              return '${_phdProvider.startRange.round()} - ${_phdProvider.endRange.round()} dollars';
                            },
                            //added talk back feature for android
                            divisions: 35,
                            labels: RangeLabels('\$ ${_phdProvider.startRange}',
                                '\$ ${_phdProvider.endRange}'),
                            activeColor: AppTheme.colorPrimary,
                            inactiveColor: Color(0xffD7D8DD),
                            onChanged: (RangeValues newRange) {
                              _phdProvider.setRange(
                                  int.parse(newRange.start.toStringAsFixed(0)),
                                  int.parse(newRange.end.toStringAsFixed(0)));
                              setState(() {});
                              // setState(() {
                              //   start = int.parse(
                              //       newRange.start.toStringAsFixed(0));
                              //   end =
                              //       int.parse(newRange.end.toStringAsFixed(0));
                              // });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Text("300K"),
                            // Text("350K"),
                            // Text("400K"),
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
                                      "https://dazlpro.com/_next/image?url=%2F_next%2Fstatic%2Fimage%2Fcomponents%2FFooter%2Ffooter.7057d59c9809dba527ddc726526c7eb0.png&w=96&q=75"))),
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
            height: size.height * 0.09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppTheme.colorPrimary),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      // _housedata.reset();
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          builder: (context) => selectRoom()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Next",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }
}

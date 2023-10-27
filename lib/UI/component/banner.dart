// ignore_for_file: avoid_print, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

List<String> imgListdata = [
  'assets/images/image1.png',
  'assets/images/image3.png',
  'assets/images/image5.png',
];

List<String> descriptionData = [
  'assets/images/image1.png',
  'assets/images/image2.png',
  'assets/images/image3.png',
  'assets/images/image4.png',
  'assets/images/image5.png',
];

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
    // getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CarouselSlider(
          items: imgListdata
              .map(
                (item) => Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        _current == 0
                            ? 'Maximize Sales Price'
                            : _current == 1
                                ? 'Minimize Days on Market'
                                : _current == 2
                                    ? 'Fewer Buyer Roadblocks'
                                    : '',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: lightColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: false,
              // aspectRatio: 1.5,
              viewportFraction: 1.0,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgListdata.map((url) {
            int index = imgListdata.indexOf(url);
            return Container(
              width: 6.0,
              height: 6.0,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }).toList(),
        ),
        // CarouselSlider(
        //   items: [
        //     Card(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           decoration:
        //               BoxDecoration(borderRadius: BorderRadius.circular(15)),
        //           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               SizedBox(
        //                 width: MediaQuery.of(context).size.height * .04,
        //                 child: Image.asset(
        //                   'assets/images/left.png',
        //                   color: primaryColor,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   Text(
        //                     'DAZL IS A RESIDENTIAL REAL ESTATE \nCOLLABORATION HUB TO:',
        //                     maxLines: 2,
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w600,
        //                       fontSize: 14,
        //                       color: primaryColor,
        //                       letterSpacing: 0.3,
        //                     ),
        //                   ),
        //                   SizedBox(height: 5),
        //                   Row(
        //                     children: [
        //                       Icon(
        //                         Icons.add,
        //                         color: editColor,
        //                         size: 16,
        //                       ),
        //                       SizedBox(width: 5),
        //                       SizedBox(
        //                         width: MediaQuery.of(context).size.width * .76,
        //                         child: Text(
        //                           'Gain real-time, property specific intelligence and insight',
        //                           overflow: TextOverflow.ellipsis,
        //                           maxLines: 1,
        //                           softWrap: false,
        //                           style: TextStyle(
        //                             fontWeight: FontWeight.w600,
        //                             fontSize: 14,
        //                             color: blackColor,
        //                             letterSpacing: 0.3,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Row(
        //                     children: [
        //                       Icon(
        //                         Icons.add,
        //                         color: editColor,
        //                         size: 16,
        //                       ),
        //                       SizedBox(width: 5),
        //                       Text(
        //                         'Maximize home sales prices',
        //                         overflow: TextOverflow.ellipsis,
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.w600,
        //                           fontSize: 14,
        //                           color: blackColor,
        //                           letterSpacing: 0.3,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Row(
        //                     children: [
        //                       Icon(
        //                         Icons.add,
        //                         color: editColor,
        //                         size: 16,
        //                       ),
        //                       SizedBox(width: 5),
        //                       Text(
        //                         'Minimize number of days on market',
        //                         overflow: TextOverflow.ellipsis,
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.w600,
        //                           fontSize: 14,
        //                           color: blackColor,
        //                           letterSpacing: 0.3,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Card(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           decoration:
        //               BoxDecoration(borderRadius: BorderRadius.circular(15)),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(left: 8.0),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: [
        //                     Text(
        //                       'DAZL IS A RESIDENTIAL REAL ESTATE \nCOLLABORATION HUB TO:',
        //                       maxLines: 2,
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w600,
        //                         fontSize: 14,
        //                         color: primaryColor,
        //                         letterSpacing: 0.3,
        //                       ),
        //                     ),
        //                     SizedBox(height: 5),
        //                     Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Row(
        //                           children: [
        //                             Icon(
        //                               Icons.add,
        //                               color: editColor,
        //                               size: 16,
        //                             ),
        //                             SizedBox(width: 5),
        //                             Container(
        //                               // color: Colors.amber,
        //                               width:
        //                                   MediaQuery.of(context).size.width * .74,
        //                               child: Text(
        //                                 'Eliminate roadblocks preventing competitive buyer offers',
        //                                 overflow: TextOverflow.ellipsis,
        //                                 maxLines: 1,
        //                                 softWrap: false,
        //                                 style: TextStyle(
        //                                   fontWeight: FontWeight.w600,
        //                                   fontSize: 14,
        //                                   color: blackColor,
        //                                   letterSpacing: 0.3,
        //                                 ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             Icon(
        //                               Icons.add,
        //                               color: editColor,
        //                               size: 16,
        //                             ),
        //                             SizedBox(width: 5),
        //                             Text(
        //                               'Get tuned into market trends',
        //                               overflow: TextOverflow.ellipsis,
        //                               style: TextStyle(
        //                                 fontWeight: FontWeight.w600,
        //                                 fontSize: 14,
        //                                 color: blackColor,
        //                                 letterSpacing: 0.3,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             Icon(
        //                               Icons.add,
        //                               color: editColor,
        //                               size: 16,
        //                             ),
        //                             SizedBox(width: 5),
        //                             Text(
        //                               'Minimize number of days on market',
        //                               overflow: TextOverflow.ellipsis,
        //                               style: TextStyle(
        //                                 fontWeight: FontWeight.w600,
        //                                 fontSize: 14,
        //                                 color: blackColor,
        //                                 letterSpacing: 0.3,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: MediaQuery.of(context).size.height * .04,
        //                 child: Image.asset(
        //                   'assets/images/right.png',
        //                   color: primaryColor,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        //   options: CarouselOptions(
        //     height: MediaQuery.of(context).size.height * .18,
        //     autoPlay: false,
        //     enlargeCenterPage: false,
        //     // aspectRatio: 1.5,
        //     viewportFraction: 1.0,
        //     reverse: true,
        //     enableInfiniteScroll: false,

        //     autoPlayCurve: Curves.fastOutSlowIn,
        //     // onPageChanged: (index, reason) {
        //     //   setState(() {
        //     //     _current = index;
        //     //   });
        //     // }
        //   ),
        // ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: imgListdata.map((url) {
        //     int index = 2;
        //     return Container(
        //       width: 6.0,
        //       height: 6.0,
        //       alignment: Alignment.bottomCenter,
        //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: _current == index ? Colors.blueAccent : Colors.grey,
        //       ),
        //     );
        //   }).toList(),
        // ),
        SizedBox(height: 20)
      ],
    );
  }
}

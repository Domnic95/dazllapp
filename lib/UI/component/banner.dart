import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> imgListdata = [
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
    print(" immm" + imgListdata.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      CarouselSlider(
        items: imgListdata
            .map((item) => Container(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.all(8.0),
                    // child: ClipRRect(
                    //     borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    //     child: Image.asset(
                    //       item,
                    //       fit: BoxFit.cover,
                    //       width: MediaQuery.of(context).size.width,
                    //     )),
                  ),
                ))
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
      )
    ]);
  }
}

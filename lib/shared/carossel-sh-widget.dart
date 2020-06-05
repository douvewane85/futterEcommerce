import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';


class CarosselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      child: new Carousel(

        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotColor: Colors.red,
        dotBgColor: Colors.transparent,
      ),
    );

  }
}

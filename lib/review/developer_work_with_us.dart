import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DeveloperWorkWithUs extends StatefulWidget {
  const DeveloperWorkWithUs({Key? key}) : super(key: key);

  @override
  State<DeveloperWorkWithUs> createState() => _DeveloperWorkWithUsState();
}

class _DeveloperWorkWithUsState extends State<DeveloperWorkWithUs> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

      items: [
        Container(
         width: 80,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/img6.png"),
              // fit: BoxFit.fitH,
            ),
          ),
        ),
        Container(
          width: 80,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/img7.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
         width: 80,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/img8.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 80,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/img9.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 80,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/img10.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 80,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/img11.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 120.0,
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 0.8,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.15,


      ),
    );

  }
}

// /*
//     Dropdownbutton add in form add drop
// */
//
// // import 'package:carousel_pro/carousel_pro.dart';
// //import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
//
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Carousel Slider'),
//       ),
//       body: Container(
//         child: Center(
//             child: ListView(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 150.0,
//                       width: 150.0,
//                       child: Carousel(
//                         autoplay: false,
//                         dotSize: 6.0,
//                         dotSpacing: 15.0,
//                         dotPosition: DotPosition.bottomCenter,
//                         images: [
//                           Image.asset('assets/1.jpg', fit: BoxFit.cover),
//                           Image.asset('assets/2.jpg', fit: BoxFit.cover),
//                           Image.asset('assets/3.jpg', fit: BoxFit.cover),
//                           Image.asset('assets/4.jpg', fit: BoxFit.cover),
//                           Image.asset('assets/5.jpg', fit: BoxFit.cover),
//                           //Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 150.0,
//                       height: 150.0,
//                       color: Colors.amber,
//                     )
//                   ],
//                 )
//               ],
//             )),
//       ),
//     );;
//   }
// }
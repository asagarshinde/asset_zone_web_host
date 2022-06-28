import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_asset_zone_web/constants/theme_data.dart';
import 'package:the_asset_zone_web/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

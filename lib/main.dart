import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/theme_data.dart';
import 'controllers/nav_bar_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyBxh2B6H7ynAbIOCsHcqPndPN1e2ADRqfs",
        authDomain: "assets-zone.firebaseapp.com",
        projectId: "assets-zone",
        storageBucket: "assets-zone.appspot.com",
        messagingSenderId: "1001122158865",
        appId: "1:1001122158865:web:e458ae8a32388d4b2d54b0"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'The Assets Zone',
      theme: themeData,
    );
  }
}

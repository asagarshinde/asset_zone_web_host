import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:the_asset_zone_web/screens/city/city_screen.dart';
import 'package:the_asset_zone_web/screens/home/home_screen.dart';
import 'package:the_asset_zone_web/screens/project/project_screen.dart';
import 'package:the_asset_zone_web/screens/property/property_screen.dart';
import 'package:the_asset_zone_web/screens/services/services_screen.dart';

class NavBarController extends GetxController {
  // reactive map is not working. when clicked on any menu color is not changing.
  // after converting the Map to RxMap it started working.
  // Ref:- https://stackoverflow.com/questions/68249333/flutter-getx-updating-item-in-children-list-is-not-reactive
  RxMap<String, bool> menuSelectedMap =
      {"home": true, "property": false, "about us": false, "city": false, }.obs;

  bool homeSelected = true;



   GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen(title: "The Asset Zone");
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen(title: "The Asset Zone");
        },
      ),
      GoRoute(
        path: '/property',
        builder: (BuildContext context, GoRouterState state) {
          return const PropertyScreen();
        },
      ),
      GoRoute(
        path: '/project',
        builder: (BuildContext context, GoRouterState state) {
          return const ProjectScreen();
        },
      ),
      GoRoute(
        path: '/aboutus',
        builder: (BuildContext context, GoRouterState state) {
          return const AboutUs();
        },
      ),
      GoRoute(
        path: '/city',
        builder: (BuildContext context, GoRouterState state) {
          NavBarController().menuSelectedMap['city'] = true;
          print(NavBarController().menuSelectedMap);
          return const CityScreen();
        },
      ),
    ],
  );

  setSelectedMenu(menu) {
    Map<String, bool> _menuSelectedMap = {};
    menuSelectedMap.forEach(
      (key, value) {
        if (menu == key) {
          // print("clicked menu is $menu");
          menuSelectedMap[key] = true;
          // print(menuSelectedMap);
        } else {
          menuSelectedMap[key] = false;
        }
      },
    );
    menuSelectedMap.refresh();
  }
}


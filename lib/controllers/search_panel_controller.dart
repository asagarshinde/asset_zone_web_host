import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class SearchPanelController extends GetxController {

  Key dropDownKey = ValueKey("propertySearchPanel");

  String searchString = "Search Location".obs();
  String selectedPropertyType = "Property Type".obs();
  String selectedPropertySubType = "Property Sub Type".obs();
  String searchLocation = "".obs();
  double minBudget = 100000.0.obs();
  double maxBudget = 1000000.0.obs();
  RangeValues currentRangeValuesPrice = const RangeValues(100000, 1000000).obs();

}

List<DropdownMenuItem<String>> getMenuItems(Map<String, List<String>> items) {
  List<DropdownMenuItem<String>> menuItems = [];
  items.forEach((key, List<String> value) {
    menuItems.add(DropdownMenuItem(
        value: key,
        child: Text(
          textAlign: TextAlign.center,
          key,
        )));
    for (int i = 0; i < value.length; i++) {
      menuItems.add(DropdownMenuItem(value: value[i], child: Text(value[i])));
    }
  });
  print(menuItems);
  return menuItems;
}

List<DropdownMenuItem<String>> getPropertySubType(String propertyType) {
  List<DropdownMenuItem<String>> menuItems = [];
  List<String>? items = maxRoomsDD[propertyType];
  items?.forEach((element) {
    menuItems.add(DropdownMenuItem(
        value: element,
        child: RichText(text: TextSpan(
          text: element
        ),)));
  });
  return menuItems;
}
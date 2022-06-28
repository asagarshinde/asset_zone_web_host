import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPanelController extends GetxController {

  String searchString = "Search Location".obs();
  String selectedPropertyType = "Property Type".obs();
  String selectedPropertySubType = "Property Sub Type".obs();
  String searchLocation = "".obs();
  double minBudget = 100000.0.obs();
  double maxBudget = 1000000.0.obs();
  RangeValues currentRangeValuesPrice = const RangeValues(100000, 1000000).obs();
}
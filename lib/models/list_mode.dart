import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';

class PropertiesList{
  Future<List<Widget>?> propertyList() async {
    PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
  List<Widget> property_list = [];
  var properties = await dbservice.retrievePropertyDetails();

  for (var property in properties)
    //print(property["video"]);
      {
    Widget tile = propertyTile(
      propertyStatus: property["property_about"]["property_status"],
      propertyType: property["property_about"]["property_type"],
      inputImagePath: property["gallery"][0],
      price: property["property_about"]["price"],
      values: property["property_about"].getTiles());
    property_list.add(tile);
  }
  return property_list;
}

}
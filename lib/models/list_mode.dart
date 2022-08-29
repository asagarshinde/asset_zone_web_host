import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';

class PropertiesList{
  Future<List> propertyList() async {
    PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
  var property_list = [];
  var properties = await dbservice.retrievePropertyDetails();

  for (var property in properties)
    //print(property["video"]);
  property_list.add(propertyTile(propertyStatus: property["property_about"]["property_status"], propertyType: property["property_about"]["property_type"], inputImagePath: property["gallery"][0],));

  return property_list;
}

}
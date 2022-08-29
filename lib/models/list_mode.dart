import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';
class PropertiesList{
  propertyList() async {
    PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
  var property_list = [];
  var properties = await dbservice.retrievePropertyDetails();

  for (var property in properties)
    print(property);
  property_list.add(propertyTile(propertyStatus: '', propertyType: '', inputImagePath: '',));

  return property_list;
}

}
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';


class PropertyDetailsFirestore extends GetxController {
  var firestoreDB = FirebaseFirestore.instance;

  addPropertyDetails(PropertyDetails propertyDetails) async {
    await firestoreDB.collection("PropertyDetails").add(propertyDetails.toMap());
  }

  updatePropertyDetails(PropertyDetails propertyDetails) async {
    await firestoreDB.collection("PropertyDetails").doc(propertyDetails.id).update(propertyDetails.toMap());
  }

  Future<void> deletePropertyDetails(String documentId) async {
    await firestoreDB.collection("PropertyDetails").doc(documentId).delete();

  }

  Future<List<Map<String, dynamic>>> retrievePropertyDetails() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestoreDB.collection("PropertyDetails").get();
    return snapshot.docs
        .map((docSnapshot) => docSnapshot.data())//.fromDocumentSnapshot(docSnapshot).toMap())
        // .map((docSnapshot) => PropertyDetails.fromDocumentSnapshot(docSnapshot).toMap())
        .toList();
  }
}


class PropertiesList{
  Future<List<Widget>?> propertyList() async {
    PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
    List<Widget> property_list = [];
    var properties = await dbservice.retrievePropertyDetails();
    // print(properties);
    for (var property in properties)
    {
      // print(property["video"]);
      Widget dummy = Text(property.toString());
      List<String> values = [
        property["property_about"]["bedrooms"].toString(),
        property["property_about"]["bathroom"].toString(),
        property["property_about"]["property_size"].toString(),
      ];
      Widget tile = propertyTile(
          propertyStatus: property["property_about"]["property_status"],
          propertyType: property["property_about"]["property_type"],
          inputImagePath: property["gallery"][0],
          price: property["property_about"]["price"].toString(),
          values: values);
      property_list.add(tile);
    }
    return property_list;
  }
}
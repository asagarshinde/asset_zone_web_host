import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/search/search_page.dart';

import '../constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  var height;
  var width;
  var onTap;

  MyButton({Key? key, required this.title, this.height, this.width, this.onTap})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  List<PropertyDetails> lstPD = [];

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var records =
        await FirebaseFirestore.instance.collection('PropertyDetails').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    try {
      var properties = records.docs.map((docSnapshot) {
        Map out = {};
        out.addAll(docSnapshot.data());
        out["id"] = docSnapshot.id;
        return out;
      }).toList();

      setState(
        () {
          for (var property in properties) {
            var propertyAbout = PropertyAbout(
                property_type: property["property_about"]["property_type"],
                bathroom: property["property_about"]["bathroom"],
                property_id: property["property_about"]["property_id"],
                property_status: property["property_about"]["property_status"],
                city: property["property_about"]["city"],
                bedrooms: property["property_about"]["bedrooms"],
                price: property["property_about"]["price"],
                property_size: property["property_about"]["property_size"],
                balcony: property["property_about"]["balcony"]);

            List<String> lstGallery = [];
            for (var gallery in property["gallery"]) {
              lstGallery.add(gallery);
            }

            var propertyDetails = PropertyDetails(
                property["id"],
                lstGallery,
                propertyAbout,
                property["video"],
                property["floor_plan"],
                {
                  "lon": property["location"]["lon"],
                  "lat": property["location"]["lat"]
                },
                property['upload_date']);

            lstPD.add(propertyDetails);
          }
        },
      );
    } catch (e) {
      print("GettingError: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        highlightColor: Colors.white38,
        splashColor: Colors.white,
        onTap: () {
          setState(
            () {
              // print("video from list : ${lstPD.length}");
            },
          );

          List<PropertyDetails> lstPropertyDetails = <PropertyDetails>[];

          lstPropertyDetails.addAll(lstPD);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SearchButtonNavigatorPage(
          //       propertyDetails: lstPropertyDetails,
          //     ),
          //   ),
          // );
        },
        child: Center(
          child: Text(
            widget.title,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';

import '../constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  var height;
  var width;
  MyButton({Key? key, required this.title, this.height, this.width}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  widget.width ?? 100,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        highlightColor: Colors.white38,
        splashColor: Colors.white,
        onTap: () {
          PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
          PropertyAbout propertyAbout = PropertyAbout(property_type: "House", bathroom: 2, property_id: "AC3EE99", property_status: "For sale", city: "Pune", bedrooms: 1, price: 1500, property_size: 1500 , balcony: 3);
          PropertyDetails propertyDetails = PropertyDetails("AC3EE99", ['assets/3.jpg','assets/4.jpg'], propertyAbout, "ahahdh", "assets/2.jpg", {"lon": 22.687591323210615, "lat": 76.43698832653855});

          //dbservice.addPropertyDetails(propertyDetails);
          // Future<List<PropertyDetails>> out = dbservice.retrievePropertyDetails();
          // print(out.toString());
          PropertiesList pl = PropertiesList();
          var l = pl.propertyList();
          print(l);
          print("Clicked on me who");
        },
        child:  Center(
          child: Text(
            widget.title,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
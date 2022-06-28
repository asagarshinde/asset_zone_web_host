import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color.fromRGBO(243, 68, 81, 1);
const kAppBarPrimaryColor = Color.fromRGBO(255, 255, 255, 0);
const kAppBarMenuItems = ["home", "property", "project", "services", "city"];
const kSecondaryColor = Color.fromRGBO(243, 93, 67, 1);

const menus = {
  "home": [],
  "property": ["New Property", "Resell Properties", "Rental Properties"],
  "project": [""],
  "services": ["Interior Design", "Vastu", "Legal Advisor"],
  "city": ["Nashik", "Igatpuri"]
};

const propertySearch = {
  "Property Type": ["Residential", "Commercial", "Plot", "Indstrial"]
};

const maxRoomsDD = {
  "Property Type": ["Property Sub Type"],
  "Residential": ["Apartment", "Bunglow", "Row House", "Duplex", "Pent House"],
  "Commercial": ["Shop", "Office", "Showroom"],
  "Plot": ["Agriculture", "Industrial", "NA", "Resort NA", "Amenity"],
  "Industrial": ["Factory", "Shed"]
};

TextStyle kMenuItemStyle = GoogleFonts.rubik(fontSize: 18);
const kIconColor = Color.fromRGBO(243, 68, 81, 1);
const kIconBackgroundColor = Color.fromRGBO(254, 237, 238, 1);

const kdropDownTitleStyle = 15.0;
TextStyle khomePagePropertySearchPanelDDPanel =
    GoogleFonts.rubik(fontSize: kdropDownTitleStyle, color: Colors.black);

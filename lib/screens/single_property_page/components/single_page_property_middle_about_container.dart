import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';

class SinglePagePropertyMiddleAboutContainer extends StatelessWidget {
  var propertyDetails;

   SinglePagePropertyMiddleAboutContainer( {Key? key, required this.propertyDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var property_about = propertyDetails["property_about"];
    String propertyType = property_about["property_type"].toString();
    String price = property_about["price"].toString();
    String propertyId = property_about["property_id"].toString();
    String propertySize = property_about["property_size"].toString();
    String propertyStatus = property_about["property_status"].toString();
    String balcony = property_about["balcony"].toString();
    String city = property_about["city"].toString();
    String bedrooms = property_about["bedrooms"].toString();
    String bathrooms = property_about["bathroom"].toString();




    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AutoSizeText(
              "Property Details",
              style: GoogleFonts.rubik(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AutoSizeText(
                        "Property Type :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                     Expanded(flex:1, child: AutoSizeText(propertyType)),
                    Expanded(flex:2, child: Spacer())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Price :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(price)),
                    Expanded(child: Spacer())
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Property ID :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(propertyId)),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Poperty Size :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(propertySize)),
                    Expanded(child: Spacer())
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Property status :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(propertyStatus)),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Balcony :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(balcony)),
                    Expanded(child: Spacer())
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "City :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),                      ),
                    ),
                    Expanded(child: AutoSizeText(city)),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Bedrooms :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(bedrooms)),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Bathrooms :",
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color: Color.fromRGBO(88, 97, 103, 0.83)),
                      ),
                    ),
                    Expanded(child: AutoSizeText(bathrooms)),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }
}

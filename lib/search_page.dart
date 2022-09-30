import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_pro/carousel_pro.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/components/properties_for_rent_cards.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';


class SearchButtonNavigatorPage extends StatelessWidget {
  SearchButtonNavigatorPage({Key? key,required this.propertyDetails}) : super(key: key);
  final propertyDetails;


  final ScrollController scrollController = ScrollController();



  List<Widget> getFlatDetailsRow(context, bedrooms, halls, area, bathrooms,
      garage) {
    List<String> flatDetails = [
      "Bedrooms",
      "Bathrooms",
      "Halls",
      "Sq ft",
      "Garage"
    ];
    List<String> values = [
      propertyDetails["property_about"]["bedrooms"].toString(),
      propertyDetails["property_about"]["bathroom"].toString(),
      propertyDetails["property_about"]["halls"].toString(),
      propertyDetails["property_about"]["property_size"].toString(),
      propertyDetails["property_about"]["garage"].toString()
    ];
    // List<String> values = [bedrooms, bathrooms, halls, area, garage];
    List<IconData> flatDetailsIcons = [
      Icons.bathtub_rounded,
      Icons.bed_rounded,
      Icons.chair_rounded,
      Icons.square_foot_rounded,
      Icons.garage_rounded
    ];
    List<Widget> children = [];
    for (int i = 0; i < flatDetails.length; i++) {
      Responsive.isMobile(context)
          ? children.add(
        Row(
          children: [
            Icon(
              flatDetailsIcons[i],
              color: const Color(0xFF1c2d3a),

            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: AutoSizeText(values[i]),
            ),
            AutoSizeText(
              flatDetails[i],
              maxFontSize: 14,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1c2d3a)),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      )
          : children.add(
        Row(
          children: [
            Icon(
              flatDetailsIcons[i],
              color: const Color(0xFF1c2d3a),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: AutoSizeText(values[i]),
            ),
            AutoSizeText(
              flatDetails[i],
              maxFontSize: 14,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1c2d3a)),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      );
    }
    return children;
  }

  // final _imageUrls = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: const MyNavigationBar(),
      )
          : AppBar(backgroundColor: kPrimaryColor),
      drawer: const MyDrawer(),
      body: CustomScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 800,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 800,
                            child: Image.asset(
                              'assets/inner-background.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     Container(
                          //       padding: EdgeInsets.fromLTRB(30, 200, 0, 0),
                          //       child: AutoSizeText(
                          //         "Left Sidebar",
                          //         style: GoogleFonts.rubik(
                          //             fontSize: 25,
                          //             fontWeight: FontWeight.w700,
                          //             color: Colors.white),
                          //       ),
                          //     ),
                          //     Container(
                          //       padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          //       child: AutoSizeText(
                          //         "Listing >> Left Sidebar",
                          //         style: GoogleFonts.rubik(
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.w500,
                          //             color: Color.fromRGBO(255, 255, 255, 1)),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80,),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Advance search",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(28, 45, 58, 1)),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(height: 30,),
                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Filter",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(88, 97, 103, 1)),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: PropertySearchMobileView(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex:2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Properties Listing",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(28, 45, 58, 1)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 500,
                                  width: 800,
                                  child: ListView(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 200.0,
                                            width: 300.0,
                                            child: Carousel(
                                              autoplay: true,
                                              dotSize: 6.0,
                                              dotSpacing: 15.0,
                                              dotPosition: DotPosition.bottomCenter,
                                              images: [
                                                Image.asset('assets/1.jpg', fit: BoxFit.cover),
                                                Image.asset('assets/2.jpg', fit: BoxFit.cover),
                                                Image.asset('assets/3.jpg', fit: BoxFit.cover),
                                                Image.asset('assets/4.jpg', fit: BoxFit.cover),
                                                Image.asset('assets/5.jpg', fit: BoxFit.cover),
                                                //Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            height: 200.0,
                                            color: Colors.white,
                                            padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                    ("F R A N C E"),
                                                    style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                        color: Color.fromRGBO(149, 149, 149, 1),

                                                    ),
                                                ),
                                                SizedBox(height: 10,),
                                                AutoSizeText(
                                                  ("Little Acorn Farm"),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(28, 45, 58, 1),
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                AutoSizeText(
                                                  ("6558.00*"),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(255, 92, 65, 1),
                                                  ),
                                                ),
                                                SizedBox(height: 20,),
                                                Row(
                                                  children:
                                                    getFlatDetailsRow(context,
                                                        propertyDetails["property_about"]["bedrooms"].toString(),
                                                        propertyDetails["property_about"]["bathroom"].toString(),
                                                        propertyDetails["property_about"]["balcony"].toString(), "2",
                                                        "0"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )

                               //  Container(
                               //  child: ImageSliderWidget(
                               //  imageUrls: _imageUrls,
                               //  imageBorderRadius: BorderRadius.circular(10.0),
                               //  imageHeight: 8,
                               //  ),
                               // ),

                                //PropertiesForCardsView(),
                              ],
                            ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]))
          ]),
    );
  }
}




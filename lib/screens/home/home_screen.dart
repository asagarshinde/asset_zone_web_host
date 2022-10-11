import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/footer_section/footer_page.dart';
import 'package:the_asset_zone_web/review/developer_work_with_us.dart';
import 'package:the_asset_zone_web/screens/home/components/feature_property.dart';
import 'package:the_asset_zone_web/screens/home/components/featured_project.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/components/properties_for_buy_cards.dart';
import 'package:the_asset_zone_web/screens/home/components/properties_for_rent_cards.dart';
import 'package:the_asset_zone_web/screens/home/components/properties_for_sale_cards.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_desktop_view.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_tablet_view.dart';
//import 'package:the_asset_zone_web/screens/home/components/what_are_you_looking_for.dart';
import 'package:the_asset_zone_web/testinominal/testinominal.dart';
import '../../models/property_detail_model.dart';
import '../../responsive.dart';
import '../../review/what_are_you_looking_for.dart';
import '../../widgets/helper_widgets.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String title = 'The Assets Zone';
  List<PropertyDetails> lstPropDetails = <PropertyDetails>[];


  @override
  void initState() {
    super.initState();
    fetchList();
  }

  fetchList() {
    List<PropertyDetails> lstPropertyDetails = <PropertyDetails>[];
    lstPropertyDetails.add(PropertyDetails(
        "AC3EE99",
        ['assets/3.jpg', 'assets/4.jpg'],
        PropertyAbout(
            property_type: "House1",
            bathroom: 1,
            property_id: "AC3EE90",
            property_status: "For sale",
            city: "Pune",
            bedrooms: 1,
            price: 1500,
            property_size: 1500,
            balcony: 3),
        "ahahdh1",
        "assets/2.jpg",
        {"lon": 22.687591323210615, "lat": 76.43698832653855}));
    lstPropertyDetails.add(PropertyDetails(
        "AC33399",
        ['assets/1.jpg', 'assets/2.jpg'],
        PropertyAbout(
            property_type: "House2",
            bathroom: 3,
            property_id: "AC3EE91",
            property_status: "For rent",
            city: "Mumbai",
            bedrooms: 3,
            price: 2200,
            property_size: 2500,
            balcony: 2),
        "ahahdh2",
        "assets/3.jpg",
        {"lon": 22.687591323210615, "lat": 76.43698832653855}));
    lstPropertyDetails.add(PropertyDetails(
        "AC3aa99",
        ['assets/8.jpg', 'assets/5.jpg'],
        PropertyAbout(
            property_type: "House3",
            bathroom: 5,
            property_id: "AC3EE92",
            property_status: "For lease",
            city: "Nasik",
            bedrooms: 5,
            price: 4400,
            property_size: 3500,
            balcony: 4),
        "ahahdh4",
        "assets/4.jpg",
        {"lon": 22.687591323210615, "lat": 76.43698832653855}));
    lstPropertyDetails.add(PropertyDetails(
        "AC30099",
        ['assets/11.jpg', 'assets/21.jpg'],
        PropertyAbout(
            property_type: "House4",
            bathroom: 8,
            property_id: "AC3EE93",
            property_status: "For sale",
            city: "Surat",
            bedrooms: 2,
            price: 6600,
            property_size: 4500,
            balcony: 7),
        "ahahdh5",
        "assets/5.jpg",
        {"lon": 22.687591323210615, "lat": 76.43698832653855}));

    setState(() {
      lstPropDetails = lstPropertyDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: const MyNavigationBar(),
            )
          : AppBar(
           backgroundColor: kPrimaryColor,
      ),
      drawer: const MyDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      // when row not starting with start of axis then use expanded.
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 1000,
                            child: Image.asset(
                              'assets/building.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HomePageText(),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    width > 1200 ? width * 0.08 : 10, 0, 0, 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 45, 8, 8),
                                          child: MyButton(title: "For Rent"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 45, 8, 8),
                                          child: MyButton(title: "For Buy"),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 40),
                                    width < 700
                                        ? const PropertySearchMobileView()
                                        : width < 950
                                            ? const PropertySearchTabletView()
                                            : const PropertySearchPanel(),
                                    SizedBox(
                                      height: constraints.maxWidth < 900 ? 50 : 250,
                                    ),
                                    AutoSizeText(
                                      "Properties for rent.",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF586167)),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    AutoSizeText(
                                      "Elegant retreat in Coral Gables setting. This home provides entertaining spaces with kitchen opening",
                                      style: GoogleFonts.roboto(
                                          fontSize: 19,
                                          color: const Color(0xFF586167)),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),

                                  ],
                                ),
                              ),
                              // const PropertiesForRentGrid(),
                              width < 850
                                  ? PropertiesForCardsView()
                                  : width < 1600
                                      ? const PropertiesForCardsView()
                                      : const PropertiesForCardsView(),
                              const SizedBox(
                                height: 100,
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(
                                  width > 1200 ? width * 0.08 : 10, 0, 0, 50),),

                              AutoSizeText(
                                "Properties for Sale.",
                                style: GoogleFonts.montserrat(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF586167)),
                              ),

                              const SizedBox(
                                height: 12,
                              ),
                              AutoSizeText(
                                "Elegant retreat in Coral Gables setting. This home provides entertaining spaces with kitchen opening",
                                style: GoogleFonts.roboto(
                                    fontSize: 19,
                                    color: const Color(0xFF586167)),
                              ),
                              const SizedBox(
                                height: 100,
                              ),

                              width < 850
                                  ? PropertiesForSaleCardsView()
                                  : width < 1600
                                  ? const PropertiesForSaleCardsView()
                                  : const PropertiesForSaleCardsView(),
                              const SizedBox(
                                height: 100,
                              ),

                              Padding( padding: EdgeInsets.fromLTRB(
                                  width > 1200 ? width * 0.08 : 10, 0, 0, 50),),

                              AutoSizeText(
                                "Properties for Buy.",
                                style: GoogleFonts.montserrat(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF586167)),
                              ),

                              const SizedBox(
                                height: 12,
                              ),
                              AutoSizeText(
                                "Elegant retreat in Coral Gables setting. This home provides entertaining spaces with kitchen opening",
                                style: GoogleFonts.roboto(
                                    fontSize: 19,
                                    color: const Color(0xFF586167)),
                              ),
                              const SizedBox(
                                height: 100,
                              ),

                              width < 850
                                  ? PropertiesForBuyCardsView()
                                  : width < 1600
                                  ? const PropertiesForBuyCardsView()
                                  : const PropertiesForBuyCardsView(),
                              const SizedBox(
                                height: 100,
                              ),

                              Container(
                                color: Colors.white70,
                                //color: Colors.red,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: width< 500 ? FeaturedProjectMobile(): width < 900 ? FeaturedProjectTablet() : FeaturedProjectDesktop(),
                              ),


                              // SizedBox(height: 50,),
                              // WhatAreYouLookingFor(),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 32.0),
                              //   child: AutoSizeText(
                              //     "Featured Property",
                              //     minFontSize: 25,
                              //     style: GoogleFonts.rubik(
                              //         fontSize: 35, fontWeight: FontWeight.w500),
                              //   ),
                              // ),
                              // Text(
                              //   "Residences can be classified into different type of housing tenure can used for same physical type.",
                              //   style: GoogleFonts.rubik(fontSize: 20),
                              // ),
                              // width < 950 ? FeaturePropertyTablet(): FeatureProperty(),
                              // const SizedBox(
                              //   height: 100,
                              // ),
                              DeveloperWorkWithUs(),
                              Container(
                                height: 450,
                                  child: testinominal()
                              ),

                              //WhatAreYouLookingFor(propertyDetails: lstPropDetails,),
                              Container(
                                height: 500,
                                  child: WhatAreYouLookingFor(propertyDetails: lstPropDetails)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: width, child: FooterPage()),
              ],
            ),
          );
        },
      ),
    );
  }
}

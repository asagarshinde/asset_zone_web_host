import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/screens/home/components/feature_property.dart';
import 'package:the_asset_zone_web/screens/home/components/featured_project.dart';
import 'package:the_asset_zone_web/screens/home/components/home_screen_widgets.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/components/properties_for_rent_cards.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_desktop_view.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_tablet_view.dart';
import 'package:the_asset_zone_web/screens/home/components/what_are_you_looking_for.dart';
import '../../responsive.dart';
import '../../widgets/helper_widgets.dart';

class HomeScreen extends StatelessWidget {
  final String title = 'The Assets Zone';

  const HomeScreen({Key? key, required String title}) : super(key: key);

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
          : AppBar(backgroundColor: kPrimaryColor),
      drawer: const MyDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Row(
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
                          Container(
                            color: Colors.red,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: width< 500 ? FeaturedProjectMobile(): width < 900 ? FeaturedProjectTablet() : FeaturedProjectDesktop(),
                          ),
                          SizedBox(height: 50,),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

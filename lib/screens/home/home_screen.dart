import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/screens/home/widgets/feature_property.dart';
import 'package:the_asset_zone_web/screens/home/widgets/featured_project.dart';
import 'package:the_asset_zone_web/screens/home/widgets/home_screen_widgets.dart';
import 'package:the_asset_zone_web/screens/home/widgets/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/widgets/properties_for_rent_cards.dart';
import '../../responsive.dart';

class HomeScreen extends StatelessWidget {
  final String title = '';

  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(MediaQuery.of(context).size);
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: const MyNavigationBar(),
            )
          : AppBar(),
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
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/building.jpg')),
                      Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(width * 0.14, 0, 0, 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FrontLeft(),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 35, 0, 0),
                                  child: Text(
                                      'Residences can be classified by and connected to residences. Different types of housing can be use same    \nphysical type.',
                                      style: GoogleFonts.rubik(fontSize: 15),
                                      textAlign: TextAlign.start),
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
                                const PropertySearchPanel(),
                                const SizedBox(
                                  height: 250,
                                ),
                                Text(
                                  "Properties for rent.",
                                  style: GoogleFonts.rubik(
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                // Text("Elegant retreat in Coral Gables setting. This home provides entertaining spaces with kitchen opening", style: GoogleFonts.rubik(fontSize: 15,  color: Colors.black54),),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                          PropertiesForRentCards(),
                          const SizedBox(
                            height: 100,
                          ),
                          const FeaturedProject(
                            firstImageName: 'assets/banner-3.jpg',
                            secondImageName: 'assets/2.jpg',
                            cityName: "nashik city",
                            projectDescription: "Different types of housing can be use same physical type. connected \nresidences might be owned by a single entity or owned separately with an \naggrement covering the relationship between units and common areas \nand concerns",
                            projectType: "Open house",
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32.0),
                            child: Text(
                              "Featured Property",
                              style: GoogleFonts.rubik(
                                  fontSize: 45, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Residences can be classified into different type of housing tenure can used for same physical type.",
                            style: GoogleFonts.rubik(fontSize: 20),
                          ),
                          const FeatureProperty(),
                          const SizedBox(
                            height: 100,
                          )
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

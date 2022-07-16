import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/screens/home/widgets/home_screen_widgets.dart';

import '../../../constants/constants.dart';

class FeaturedProject extends StatelessWidget {
  final String firstImageName;
  final String secondImageName;
  final String cityName;
  final String projectType;
  final String projectDescription;


  const FeaturedProject(
      {Key? key,
      required this.firstImageName,
      required this.secondImageName,
      required this.cityName,
      required this.projectType,
      required this.projectDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              firstImageName,
              color: Colors.black.withOpacity(0.46),
              colorBlendMode: BlendMode.srcOver,
            ),
          ),
        ),
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Center(
                child: CustomTextStyle(
                  title: 'Featured Project',
                  fontWeight: FontWeight.bold,
                  size: 35,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Divider(
                color: Colors.white,
                thickness: 3,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(700, 200, 300, 0),
          child: Card(
            color: Colors.black.withOpacity(1),
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Container(
              height: 630,
              width: 860,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Image.asset(secondImageName),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(350, 700, 0, 0),
          child: Container(
            width: 600,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.white),
            child: FeaturedProjectDescriptionTile( cityName: cityName, projectType: projectType, projectDescription: projectDescription,)
          ),
        )
      ],
    );
  }
}

class FeaturedProjectDescriptionTile extends StatelessWidget {
  final String cityName;
  final String projectType;
  final String projectDescription;
  FeaturedProjectDescriptionTile({Key? key, required this.cityName, required this.projectType, required this.projectDescription, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 32.0, 0, 4),
          child: Text(
            cityName.toUpperCase(),
            textAlign: TextAlign.start,
            style: GoogleFonts.rubik(
                fontSize: 15, letterSpacing: 4, color: Colors.black38),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 12, 4),
              child: Text(
                "Merric in spring way",
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 2.0),
                child: Text(
                  projectType.toUpperCase(),
                  style: GoogleFonts.rubik(
                      fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 2, 12, 4),
          child: Text(
            "\u{20B9}5000000.00*",
            style: GoogleFonts.rubik(fontSize: 20, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 2, 12, 4),
          child: Text(
            projectDescription,
            style: GoogleFonts.rubik(
                color: Colors.black38, fontSize: 16, height: 1.6),
          ),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 5, 5),
              child: Icon(
                Icons.bed_rounded,
                color: Colors.black,
              ),
            ),
            Text("Bed: 5"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                height: 12,
                child: VerticalDivider(
                  thickness: 2,
                  color: Colors.black38,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 5, 5),
              child: Icon(
                Icons.bathtub_rounded,
                color: Colors.black,
              ),
            ),
            Text("Baths: 3"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                height: 12,
                child: VerticalDivider(
                  thickness: 2,
                  color: Colors.black38,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 5, 5),
              child: Icon(
                Icons.square_foot_outlined,
                color: Colors.black,
              ),
            ),
            Text("Sq. Foot: 5000"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                height: 12,
                child: VerticalDivider(
                  thickness: 2,
                  color: Colors.black38,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 8, 0, 15),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: kSecondaryColor, width: 2),
                borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 8.0),
              child: Text(
                "OPEN HOUSE",
                style: GoogleFonts.rubik(
                    fontSize: 12, color: kSecondaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen_widgets.dart';

class PropertiesForRentCards extends StatelessWidget {
  const PropertiesForRentCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        propertyTile(inputImagePath: 'assets/2.jpg'),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg'),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg'),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg'),
      ],
    );
  }
}

class PropertiesForRentTablet extends StatelessWidget {
  const PropertiesForRentTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}

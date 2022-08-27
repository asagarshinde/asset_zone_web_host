import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen_widgets.dart';

class PropertiesForRentCardsDesktop extends StatelessWidget {
  const PropertiesForRentCardsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "rent", propertyStatus: "For Sale"),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
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
            propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "rent", propertyStatus: "For Sale"),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}


class PropertiesForRentMobile extends StatelessWidget {
  const PropertiesForRentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
          const SizedBox(
            width: 25,
          ),
          propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
          const SizedBox(
            width: 25,
          ),
          propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
          const SizedBox(
            width: 25,
          ),
          propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale"),
          const SizedBox(
            width: 25,
          )
        ],
      ),
    );
  }
}

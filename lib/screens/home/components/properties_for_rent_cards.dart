import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/models/list_mode.dart';
import 'home_screen_widgets.dart';

class PropertiesForRentCardsDesktop extends StatelessWidget {
  const PropertiesForRentCardsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PropertiesList pl = PropertiesList();
    var l = pl.propertyList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: l,
    );
  }
}

class PropertiesForRentTablet extends StatelessWidget {
  const PropertiesForRentTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PropertiesList pl = PropertiesList();
    var l = pl.propertyList();
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<String>>(
          future: l,
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(snapshot.data!.length,
                    (index) {
                  return Text(snapshot.data?[index] ?? "null") ;
                },
              ),
            );
          },
        ),
      ),
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

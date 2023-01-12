import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: SimpleMenuBar(),
      )
          : AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Text("This is property screen."),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/single_property_page/single_page_property.dart';
import 'package:the_asset_zone_web/search/search_page.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// https://themes.pixelstrap.com/sheltos/main/list-left-sidebar.html
    return FutureBuilder(
      future: getPropertyView(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Widget page = snapshot.data! as Widget;
          return page;
        } else if (snapshot.hasError) {
          return Text("Errored out ${snapshot.error}", style: TextStyle( fontSize: 56),);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
    // Scaffold(
    //   appBar: Responsive.isDesktop(context)
    //       ? PreferredSize(
    //     preferredSize: Size(MediaQuery.of(context).size.width, 70),
    //     child: SimpleMenuBar(),
    //   )
    //       : AppBar(
    //     backgroundColor: kPrimaryColor,
    //   ),
    //   body: getPropertyView(),
    // );
  }
}

Future<Widget> getPropertyView() async {
  PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
  List<PropertyDetails> properties_list = [];
  await dbservice.retrieveAllPropertyDetails().then(
    (value) {
      if (value != null) {
        value.forEach(
          (element) {
            properties_list.add(element);
          },
        );
      }
    },
  );
  try {
    return SearchButtonNavigatorPage(propertyDetails: properties_list);
  } catch (e) {
    return Text("$e");
  }
}

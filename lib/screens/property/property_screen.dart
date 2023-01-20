import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/properties_state_controller.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/search/search_page.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

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
          return Text(
            "Errored out ${snapshot.error}",
            style: TextStyle(fontSize: 56),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}


Future<Widget> getPropertyView() async {
  PropertyDetailsFirestore dbService = PropertyDetailsFirestore();
  List<PropertyDetails> propertiesList = [];
  propertiesList = await dbService.retrieveAllPropertyDetails();
  try {
    return SearchButtonNavigatorPage(propertyDetails: propertiesList);
  } catch (e) {
    return Text("$e");
  }
}

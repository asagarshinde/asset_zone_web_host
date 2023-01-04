import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';

class PropertiesForSaleCardsView extends StatefulWidget {
  const PropertiesForSaleCardsView({Key? key}) : super(key: key);

  @override
  State<PropertiesForSaleCardsView> createState() =>
      _PropertiesForSaleCardsViewState();
}

class _PropertiesForSaleCardsViewState
    extends State<PropertiesForSaleCardsView> {
  Future<List<Widget>?> getData() async {
    PropertiesList propertiesList = PropertiesList();
    List<Widget>? pl = await propertiesList.propertyListSale();
    return pl;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> data = snapshot.data! as List<Widget>;
          return Center(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: data,
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';

class PropertiesForCardsView extends StatefulWidget {
  final double width;

  final String propertiesFor;

  const PropertiesForCardsView(
      {Key? key, required this.width, required this.propertiesFor})
      : super(key: key);

  @override
  State<PropertiesForCardsView> createState() => _PropertiesForCardsViewState();
}

class _PropertiesForCardsViewState extends State<PropertiesForCardsView> {
  Future<List<Widget>?> getData() async {
    PropertiesList propertiesList = PropertiesList();
    List<Widget>? pl = await propertiesList.propertyList(widget.propertiesFor);
    // await Future.delayed(Duration(seconds: 5));
    return pl;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> data = snapshot.data! as List<Widget>;
          return Padding(
            padding: EdgeInsets.fromLTRB(
                widget.width > 1200 ? widget.width * 0.08 : 10, 0, 0, 10),
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

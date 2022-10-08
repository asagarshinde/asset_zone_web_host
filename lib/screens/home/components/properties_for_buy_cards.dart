import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';

import 'home_screen_widgets.dart';

class PropertiesForBuyCardsView extends StatefulWidget {
  const PropertiesForBuyCardsView({Key? key}) : super(key: key);

  @override
  State<PropertiesForBuyCardsView> createState() => _PropertiesForBuyCardsViewState();
}

class _PropertiesForBuyCardsViewState extends State<PropertiesForBuyCardsView> {

  Future<List<Widget>?> getData() async{
    PropertiesList propertiesList = PropertiesList();
    List<Widget>? pl = await propertiesList.propertyListBuy();
    // await Future.delayed(Duration(seconds: 5));
    //print(pl);
    return pl;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
      future: getData(),
      builder: (context, snapshot){
       // print(snapshot.error);
       // print(snapshot.data);
        if (snapshot.hasData){

          List<Widget> data = snapshot.data! as List<Widget>;
          return Center(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: data,
            ),
          );
        }
        else if (snapshot.hasError){
          return Text("${snapshot.error}");
        }
        else {
          return CircularProgressIndicator();
        }
        // return CircularProgressIndicator();
      },
    );
  }
}
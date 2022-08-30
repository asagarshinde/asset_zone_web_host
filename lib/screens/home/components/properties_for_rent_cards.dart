import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/controllers/home_page_card_controller.dart';
import 'package:the_asset_zone_web/models/list_mode.dart';
import 'home_screen_widgets.dart';

// class PropertiesForRentCardsDesktop extends StatelessWidget {
//   const PropertiesForRentCardsDesktop({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     PropertiesList pl = PropertiesList();
//     var l = pl.propertyList();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: l,
//     );
//   }
// }

// class PropertiesForRentTablet extends StatelessWidget {
//   const PropertiesForRentTablet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     PropertiesList pl = PropertiesList();
//     var l = pl.propertyList();
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<List<String>>(
//           future: l,
//           builder: (context, snapshot) {
//             return l.
//             // return snapshot.connectionState == ConnectionState.waiting
//             //     ? const CircularProgressIndicator()
//             //     : Column(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: List.generate(snapshot.data!.length,
//             //         (index) {
//             //       return Text(snapshot.data?[index] ?? "null") ;
//             //     },
//             //   ),
//             // );
//           },
//         ),
//       ),
//     );
//   }
// }


// class PropertiesForRentMobile extends StatelessWidget {
//   const PropertiesForRentMobile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale", price: '',),
//           const SizedBox(
//             width: 25,
//           ),
//           propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale", price: '',),
//           const SizedBox(
//             width: 25,
//           ),
//           propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale", price: '',),
//           const SizedBox(
//             width: 25,
//           ),
//           propertyTile(inputImagePath: 'assets/2.jpg', propertyType: "buy", propertyStatus: "For Sale", price: '',),
//           const SizedBox(
//             width: 25,
//           )
//         ],
//       ),
//     );
//   }
// }



class PropertiesForRentCardAsync extends StatefulWidget {
  const PropertiesForRentCardAsync({Key? key}) : super(key: key);

  @override
  State<PropertiesForRentCardAsync> createState() => _PropertiesForRentCardAsyncState();
}

class _PropertiesForRentCardAsyncState extends State<PropertiesForRentCardAsync> {
  PropertyDetailsFirestore dbservice = PropertyDetailsFirestore();
  Future<List<Map<String, dynamic>>>? propertiesList;
  List<Map<String, dynamic>>? retrievedPropertyList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    propertiesList = dbservice.retrievePropertyDetails();
    retrievedPropertyList = await dbservice.retrievePropertyDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FutureBuilder(builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)
        {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Text(retrievedPropertyList![0].toString());
          }else {
            const Center(child: CircularProgressIndicator());
          }
                return Center(
                  child: ListView(
                    children: const <Widget>[
                   Align(alignment: AlignmentDirectional.center,
                    child: Text('No data available')),
        ],
        ),
        );
          }),
      ],
    );
}
}

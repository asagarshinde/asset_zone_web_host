import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_property_middle_about_container.dart';

class SinglePagePropertyMiddleDesktop extends StatefulWidget {
  SinglePagePropertyMiddleDesktop({Key? key,required this.propertyDetails}) : super(key: key);
  final propertyDetails;
  @override
  State<SinglePagePropertyMiddleDesktop> createState() =>
      _SinglePagePropertyMiddleDesktopState();
}

class _SinglePagePropertyMiddleDesktopState
    extends State<SinglePagePropertyMiddleDesktop> {
  //late bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width > 950 ? width * 0.08 : width * 0.08),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: buildMenuBar()),
                  SinglePagePropertyMiddleAboutContainer(propertyDetails: widget.propertyDetails,)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: const Text("right"),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  List<Widget> buildMenuBar() {
    List<Widget> menu = [];
    for (var element in [
      "ABOUT",
      "FEATURE",
      "GALLERY",
      "VIDEO",
      "FLOOR PLAN",
      "LOCATION"
    ]) {
      menu.add(
        Material(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                element,
                style: const TextStyle(color: Colors.black
                    //color: _isHover ? Colors.deepOrangeAccent : Colors.black12
                    ),
              ),
            ),
            // onHover: (value) {
            //   setState(
            //     () {
            //       if (_isHover = value) {
            //         _isHover = true;
            //       }
            //     },
            //   );
            // },
            onTap: () {
              print("Tapped");
            },
          ),
        ),
      );
      menu.add(const SizedBox(
        width: 20,
      ));
    }
    return menu;
  }
}

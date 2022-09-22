import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/controllers/single_page_property_controller.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/right_side_controller_container.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_property_middle_about_container.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_prperty_middle_location_container.dart';

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
  final controller = Get.put(SinglePagePropertyController());
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    //print(widget.propertyDetails["location"]);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width > 950 ? width * 0.08 : width * 0.08),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  // middle_map = {'ABOUT': about_widget, 'LOCATION': location_widget}
                  // getMiddleWidget(widget_name)
                  //      retrun
                  // getMiddleWidget(controller.middle_widget.value)
                  SizedBox(height: width/2, width: width,child: SinglePagePropertyMiddleLocationContainer(location: widget.propertyDetails["location"],))
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 250,
            height: 1200,
            color: Colors.red,
            child: const RightSideControllerContainer(),
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
              setState(() {
                controller.middle_widget.value = element;
              });
              print("Tapped $element");
              print("fron state ${controller.middle_widget.value}");
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

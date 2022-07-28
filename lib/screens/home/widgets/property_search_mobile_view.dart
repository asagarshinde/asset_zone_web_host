import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';
import 'PropertySearchWidgets.dart';

class PropertySearchMobileView extends StatelessWidget {
  const PropertySearchMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                const PropertySearchCardSearchField(),
                const PropertyTypeDropDown(),
                PropertySubTypeDropDown(),
                const PropertySearchCardSearchRangeSlider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Budget ",
                        style: khomePagePropertySearchPanelDDPanel,
                      ),
                    ),
                    PropertySearchCardSearchRangeSliderSelectedValue(
                        select: "start"),
                    PropertySearchCardSearchRangeSliderSelectedValue(
                        select: "end"),
                  ],
                ),
                Center(child: MyButton(title: "Search")),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

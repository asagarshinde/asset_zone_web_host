import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/screens/property/components/property_photo_carousel.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class PropertyCardGridView extends StatefulWidget {
  const PropertyCardGridView({Key? key}) : super(key: key);

  @override
  State<PropertyCardGridView> createState() => _PropertyCardGridViewState();
}

class _PropertyCardGridViewState extends State<PropertyCardGridView> {
  @override
  initState() {
    super.initState();
    getAllProperties();
  }

  List<Widget> getIconDescriptionRow(index) {
    List<IconData> icons = [
      Icons.bedroom_parent,
      Icons.bathroom,
      Icons.area_chart
    ];
    List<String> texts = ["Bed:", "Bath:", "Sq Ft:"];
    List<Widget> row = [];
    PropertyDetails property = propertyController.propertiesList[index];
    List<String> values = [
      property.property_about.bedrooms.toString(),
      property.property_about.bathroom.toString(),
      property.property_about.property_size.toString()
    ];

    for (int i = 0; i < icons.length; i++) {
      if (i != icons.length) {
        row.add(DescriptionRowElement(
            icon: icons[i], text: texts[i], value: values[i]));
        row.add(const VerticalDivider(
          color: Colors.black,
          thickness: 2.0,
        ));
      }
    }
    row.removeAt(row.length - 1);
    return row;
  }

  getAllProperties() async {
    List<PropertyDetails> allProperties =
        await propertyController.retrieveAllPropertyDetails();
    setState(
      () {
        for (var property in allProperties) {
          propertyController.propertiesList.add(property);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeLeft: true,
        removeRight: true,
        child: Expanded(
          flex: 3,
          child: Column(
            children: [
              AutoSizeText(
                "Properties Listing",
                style: GoogleFonts.rubik(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(8),
                height: 650,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2),
                  padding: kDefaultPadding,
                  itemCount: propertyController.propertiesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: kElevation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PropertyPhotoCarousel(
                              imageList: propertyController
                                  .propertiesList[index].gallery),
                          //widget.propertyDetails[index].gallery),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                        (propertyController
                                            .propertiesList[index]
                                            .property_about
                                            .city
                                            .toUpperCase()),
                                        style: kTextDefaultStyle.copyWith(
                                            letterSpacing: 3)),
                                    kDefaultSizedBox,
                                    AutoSizeText("Little Acorn Farm",
                                        style: kTextHeader2Style),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: kDefaultSizedBoxWidth),
                                      child: AutoSizeText(
                                          (propertyController
                                              .propertiesList[index]
                                              .property_about
                                              .price
                                              .toString()),
                                          style: kTextHeader2Style.copyWith(
                                              color: kSecondaryColor)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: kDefaultSizedBoxWidth),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children:
                                              getIconDescriptionRow(index),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(kDateformat.format(
                                            propertyController
                                                .propertiesList[index]
                                                .upload_date
                                                .toDate())),
                                        const SizedBox(width: 40),
                                        const MyButton(
                                          title: "Details",
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionRowElement extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const DescriptionRowElement(
      {Key? key, required this.icon, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(text),
        const SizedBox(width: 5),
        Text(value),
      ],
    );
  }
}

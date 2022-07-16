import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import '../../../controllers/search_panel_controller.dart';
import '../../../widgets/helper_widgets.dart';

class FrontLeft extends StatelessWidget {
  const FrontLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, width > 1200 ? 100 : width > 800 ? 50: width > 500 ? 30 : 10, 0, 0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "You're Local Real Estate \nProfessionals",
              style: GoogleFonts.rubik(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 3,
                  letterSpacing: 3),
            ),
          ),
        ),
      ),
    );
  }
}



class PropertySearchPanel extends StatefulWidget {
  const PropertySearchPanel({Key? key}) : super(key: key);

  @override
  State<PropertySearchPanel> createState() => _PropertySearchPanelState();
}

class _PropertySearchPanelState extends State<PropertySearchPanel> {
  final _searchPanelController = Get.put(SearchPanelController());

  String propertyType = "Property Type";
  String propertySubType = "";

  List<DropdownMenuItem<String>> subPropertyitems = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   propertySubType = maxRoomsDD[propertyType]![0];
  //   subPropertyitems = getPropertySubType(propertyType);
  //   print("***************8");
  //   print(subPropertyitems);
  //   super.initState();
  // }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Container(
        width: 850,
        child: Card(
            color: Colors.white,
            // elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            margin: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                Border.all(width: 1.0, color: Colors.black12),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _searchPanelController.searchLocation = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _searchPanelController.searchLocation = value!;
                              });
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15.0),
                                border: InputBorder.none),
                            initialValue: "Search Location",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(width: 1.0, color: Colors.black12),
                          ),
                          child: DropdownButtonHideUnderline(
                            key: _searchPanelController.dropDownKey,
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.center,
                              value: _searchPanelController.selectedPropertyType,
                              items: getMenuItems(propertySearch),
                              onChanged: (String? value) {
                                setState(() {
                                  if (value != null) {
                                    _searchPanelController.selectedPropertyType = value;
                                    getPropertySubType(
                                        _searchPanelController.selectedPropertyType);
                                    _searchPanelController.selectedPropertySubType = maxRoomsDD[
                                    _searchPanelController.selectedPropertyType]![0];
                                    print(
                                        "Selected property type is ${_searchPanelController.selectedPropertyType} and selected sub property is ${_searchPanelController.selectedPropertySubType}");
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      key: _searchPanelController.dropDownKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                Border.all(width: 1.0, color: Colors.black12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                alignment: AlignmentDirectional.center,
                                value: _searchPanelController
                                    .selectedPropertySubType,
                                items: getPropertySubType(_searchPanelController
                                    .selectedPropertyType),
                                onChanged: (String? value) {
                                  setState(() {
                                    _searchPanelController
                                        .selectedPropertySubType = value!;
                                    print(
                                        "selected Property sub type is ${_searchPanelController.selectedPropertySubType}");
                                  });
                                }),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Budget ",
                                style: khomePagePropertySearchPanelDDPanel,
                              ),
                            ),
                            Text(
                              "${_searchPanelController.currentRangeValuesPrice.start / 1000}K - ",
                              // "${_currentRangeValuesPrice.start.toInt()} - ",
                              style: khomePagePropertySearchPanelDDPanel,
                            ),
                            Text(
                              "${_searchPanelController.currentRangeValuesPrice.end / 1000}K",
                              // "${_currentRangeValuesPrice.end.toInt()}",
                              style: khomePagePropertySearchPanelDDPanel,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: RangeSlider(
                          values:
                              _searchPanelController.currentRangeValuesPrice,
                          max: _searchPanelController.maxBudget,
                          divisions: 1000,
                          activeColor: kPrimaryColor,
                          inactiveColor: Colors.black12,
                          labels: RangeLabels(
                            _searchPanelController.currentRangeValuesPrice.start
                                .round()
                                .toString(),
                            _searchPanelController.currentRangeValuesPrice.end
                                .round()
                                .toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _searchPanelController.currentRangeValuesPrice =
                                  values;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:
                                    Container(child: MyButton(title: "Search")),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 120,
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}

class PropertySearchDropDownButton extends StatefulWidget {

  List<DropdownMenuItem<String>> items = [];

  PropertySearchDropDownButton({
    Key? key,
    required List<DropdownMenuItem<String>> items
  }) : super(key: key);

  @override
  State<PropertySearchDropDownButton> createState() =>
      _PropertySearchDropDownButtonState();
}

class _PropertySearchDropDownButtonState extends State<PropertySearchDropDownButton> {
  final _searchPanelController = Get.put(SearchPanelController());

  String propertyType = "Property Type";
  String propertySubType = "";

  List<DropdownMenuItem<String>> subPropertyitems = [];

  @override
  void initState() {
    // TODO: implement initState
    propertySubType = maxRoomsDD[propertyType]![0];
    subPropertyitems = getPropertySubType(propertyType);
    print("***************8");
    print(subPropertyitems);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1.0, color: Colors.black12),
          ),
          child: DropdownButtonHideUnderline(
            key: _searchPanelController.dropDownKey,
            child: DropdownButton<String>(
              alignment: AlignmentDirectional.center,
              value: _searchPanelController.selectedPropertyType,
              items: widget.items,
              onChanged: (String? value) {
                setState(() {
                  if (value != null) {
                    _searchPanelController.selectedPropertyType = value;
                    getPropertySubType(
                        _searchPanelController.selectedPropertyType);
                    _searchPanelController.selectedPropertySubType = maxRoomsDD[
                        _searchPanelController.selectedPropertyType]![0];
                    print(
                        "Selected property type is ${_searchPanelController.selectedPropertyType} and selected sub property is ${_searchPanelController.selectedPropertySubType}");
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class propertyTile extends StatefulWidget {
  final String inputImagePath;

  propertyTile({Key? key, required this.inputImagePath}) : super(key: key);

  @override
  State<propertyTile> createState() => _propertyTileState();
}

class _propertyTileState extends State<propertyTile> {
  bool _isHover = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        if (value) {
          setState(() {
            _isHover = true;
          });
        } else {
          setState(() {
            _isHover = false;
          });
        }
      },
      onTap: () {
        print("Clicked on property card");
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Container(
          height: 350,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.inputImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Center(
                    child: Text(
                      "Rent",
                      style:
                          GoogleFonts.rubik(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Govind Nagar",
                            style: GoogleFonts.rubik(
                                fontSize: 25, color: Colors.white70),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                          child: Text(
                            "₹13,000/month",
                            style: GoogleFonts.rubik(
                                fontSize: 15, color: Colors.white70),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                      child: MyButton(title: "Details"),
                    ),
                  ],
                ),
                if (_isHover)
                  AnimatedOpacity(
                      opacity: _isHover ? 1 : 0,
                      duration: Duration(milliseconds: _isHover ? 1000 : 100),
                      child: onHoverStrip())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class onHoverStrip extends StatelessWidget {
  onHoverStrip({Key? key}) : super(key: key);
  List<Widget> items = [];
  List<Color> colors = [
    Colors.black38,
    Colors.black45,
    Colors.black54,
    Colors.black87
  ];
  List<String> text1 = ["Beds", "Baths", "Carpet Area"];
  List<String> text2 = ["1", "2", "1000m2"];

  List<Widget> getTiles() {
    for (int i = 0; i <= 2; i++) {
      items.add(onHoverSingleTile(
          color: colors[i], text1: text1[i], text2: text2[i]));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(children: getTiles()),
    );
  }
}

class onHoverSingleTile extends StatelessWidget {
  final color;
  final text1;
  final text2;

  onHoverSingleTile({Key? key, this.color, this.text1, this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: GoogleFonts.rubik(color: Colors.white, fontSize: 17),
            ),
            Text(
              text2,
              style: GoogleFonts.rubik(color: Colors.white, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final FontWeight fontWeight;
  final double size;
  final String title;
  final color;

  const CustomTextStyle(
      {Key? key,
      required this.title,
      this.size = 15.0,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.rubik(
          fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}

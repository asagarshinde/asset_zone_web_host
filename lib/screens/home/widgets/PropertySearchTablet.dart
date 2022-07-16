import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants.dart';
import '../../../controllers/search_panel_controller.dart';
import '../../../widgets/helper_widgets.dart';

class PropertySearchTablet extends StatefulWidget {
  const PropertySearchTablet({Key? key}) : super(key: key);

  @override
  State<PropertySearchTablet> createState() => _PropertySearchTabletState();
}

class _PropertySearchTabletState extends State<PropertySearchTablet> {
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
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth );
      return Container(
        width: MediaQuery.of(context).size.width * 0.6,
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
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
                      ),
                      Expanded(
                        flex: 1,
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
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                )
              ],
            )),
      );
    });
  }
}



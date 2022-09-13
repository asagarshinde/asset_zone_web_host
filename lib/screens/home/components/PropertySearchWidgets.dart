import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../../controllers/search_panel_controller.dart';

class PropertySearchCardSearchField extends StatefulWidget {
  const PropertySearchCardSearchField({Key? key}) : super(key: key);

  @override
  State<PropertySearchCardSearchField> createState() =>
      _PropertySearchCardSearchFieldState();
}

class _PropertySearchCardSearchFieldState
    extends State<PropertySearchCardSearchField> {
  final _searchPanelController = Get.put(SearchPanelController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: Colors.black12),
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
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              border: InputBorder.none),
          initialValue: "Search Location",
        ),
      ),
    );
  }
}

class PropertySearchCardSearchRangeSlider extends StatefulWidget {
  const PropertySearchCardSearchRangeSlider({Key? key}) : super(key: key);

  @override
  State<PropertySearchCardSearchRangeSlider> createState() =>
      _PropertySearchCardSearchRangeSliderState();
}

class _PropertySearchCardSearchRangeSliderState
    extends State<PropertySearchCardSearchRangeSlider> {
  final _searchPanelController = Get.put(SearchPanelController());

  @override // const SizedBox(
  //   width: 120,
  // )
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _searchPanelController.currentRangeValuesPrice.value,
      max: _searchPanelController.maxBudget.value,
      divisions: 1000,
      activeColor: kPrimaryColor,
      inactiveColor: Colors.black12,
      labels: RangeLabels(
        _searchPanelController.currentRangeValuesPrice.value.start
            .round()
            .toString(),
        _searchPanelController.currentRangeValuesPrice.value.end
            .round()
            .toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _searchPanelController.currentRangeValuesPrice.value = values;
          print(_searchPanelController.currentRangeValuesPrice);
        });
      },
    );
  }
}

class PropertySearchCardSearchRangeSliderSelectedValue extends StatelessWidget {
  PropertySearchCardSearchRangeSliderSelectedValue(
      {Key? key, required this.select})
      : super(key: key);
  final select;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _searchPanelController = Get.put(SearchPanelController());
      var myselect = select == "end"
          ? _searchPanelController.currentRangeValuesPrice.value.end
          : _searchPanelController.currentRangeValuesPrice.value.start;
      return AutoSizeText(
        select == "end" ? "${myselect / 1000}K" : "${myselect / 1000}K - ",
        // "${_currentRangeValuesPrice.end.toInt()}",
        style: khomePagePropertySearchPanelDDPanel,
      );
    });
  }
}

class dummyTextWidget extends StatelessWidget {
  final _searchPanelController = Get.put(SearchPanelController());

  dummyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        _searchPanelController.currentRangeValuesPrice.value.start.toString());
  }
}

class PropertyTypeDropDown extends StatefulWidget {
  const PropertyTypeDropDown({Key? key}) : super(key: key);

  @override
  State<PropertyTypeDropDown> createState() => _PropertyTypeDropDownState();
}

class _PropertyTypeDropDownState extends State<PropertyTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    final searchPanelController = Get.put(SearchPanelController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: Colors.black12),
        ),
        child: DropdownButtonHideUnderline(
          // key: _searchPanelController.dropDownKey,
          child: DropdownButton<String>(
            isExpanded: true,
            alignment: AlignmentDirectional.center,
            value: searchPanelController.selectedPropertyType.value,
            items: getMenuItems(propertySearch),
            onChanged: (String? value) {
              setState(() {
                if (value != null) {
                  searchPanelController.selectedPropertyType.value =
                      value.toString();
                  searchPanelController.selectedPropertySubType.value =
                      maxRoomsDD[
                          searchPanelController.selectedPropertyType.value]![0];
                  searchPanelController.getPropertySubType(value);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

class PropertySubTypeDropDown extends StatefulWidget {
  PropertySubTypeDropDown({Key? key}) : super(key: key);

  @override
  State<PropertySubTypeDropDown> createState() =>
      _PropertySubTypeDropDownState();
}

class _PropertySubTypeDropDownState extends State<PropertySubTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final searchPanelController = Get.put(SearchPanelController());
      return DropdownButtonHideUnderline(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: DropdownButton(
                    isExpanded: true,
                    alignment: AlignmentDirectional.center,
                    value: searchPanelController.selectedPropertySubType.value,
                    // items: searchPanelController.setItems(),
                    // hint: Center(child: const Text("Property Sub Type")),
                    items: searchPanelController.propertySubTypeMenu,
                    onChanged: (value) {
                      setState(() {
                        searchPanelController.selectedPropertySubType.value =
                            value.toString();
                      });
                    }))),
      );
    });
  }
}

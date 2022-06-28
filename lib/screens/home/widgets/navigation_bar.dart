import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/constants.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  List<Widget> getMenuItems() {
    List<Widget> myMenuItems = [];
    menus.forEach(
      (key, value) {
        myMenuItems.add(
          AppBarDropDownButton(
            itemString: [key.toUpperCase(), ...value],
          ),
        );
        myMenuItems.add(
          const SizedBox(
            width: 60,
          ),
        );
      },
    );
    return myMenuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: kAppBarPrimaryColor),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                child: Text(
                  "The Asset Zone",
                  style: kMenuItemStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
            ),
            ...getMenuItems(),
            const SizedBox(width: 40),
            const Expanded(
              flex: 3,
              child: Icon(
                size: 45,
                Icons.person_outline_rounded,
                color: kIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarDropDownButton extends StatefulWidget {
  List<String> itemString = [];

  AppBarDropDownButton({Key? key, required List<String> this.itemString})
      : super(key: key);

  @override
  State<AppBarDropDownButton> createState() => _AppBarDropDownButtonState();
}

class _AppBarDropDownButtonState extends State<AppBarDropDownButton> {
  // List<String> itemStrings = ["HOME", "1", "2", "3"];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            isExpanded: false,
            value: widget.itemString[0],
            items: widget.itemString.map(
              (String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item, style: kMenuItemStyle),
                );
              },
            ).toList(),
            onChanged: (selectedValue) {
              setState(() {
                selectedValue = selectedValue.toString();
              });
            }),
      ),
    );
  }
}

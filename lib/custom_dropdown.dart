import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';

class CustomDropdown extends StatefulWidget {
  final String text;

  CustomDropdown({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey? actionKey;
  double? height, width, xPosition, yPosition;
  bool isDropDownedOpen = false;
  OverlayEntry? floatingDropDown;

  @override
  void initState() {
    // TODO: implement initState
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void findDropDownData() {
    RenderBox renderBox = actionKey?.currentContext
        ?.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }

  OverlayEntry _createFloatingDropDown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        right: yPosition,
        top: yPosition! + 40,
        height: 4 * height! + 40,
        child: DropDown(
          itemHeight: height,
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropDownedOpen) {
            floatingDropDown?.remove();
          } else {
            findDropDownData();
            floatingDropDown = _createFloatingDropDown();
            Overlay.of(context)?.insert(floatingDropDown!);
          }

          isDropDownedOpen = !isDropDownedOpen;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.text.toUpperCase(),
              style: const TextStyle(color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black12,
            )
          ],
        ),
      ),
    );
  }
}


class DropDown extends StatelessWidget {
  final double? itemHeight;

  DropDown({Key? key, required this.itemHeight, double? itemHeitht}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        // Align(
        //   alignment: Alignment(-0.85, 0),
        //   child: ClipPath(
        //     clipper: ArrowClipper(),
        //     child: Container(
        //       height: 20,
        //       width: 30,
        //       decoration: BoxDecoration(
        //           color: Colors.white
        //       ),
        //     ),
        //   ),
        // ),
        Material(
          elevation: 20,
          // shape: ArrowShape(),
          child: Container(
              height: 4 * itemHeight!,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Column(
                children: <Widget>[
                  DropDownItem.first(
                    text: "Add new",
                    isSelected: false,
                  ),
                  DropDownItem(
                    text: "View Profile",
                    isSelected: false,
                  ),
                  DropDownItem(
                    text: "Settings",
                    isSelected: false,
                  ),
                  DropDownItem.last(
                    text: "Logout",
                    isSelected: true,
                  ),
                ],
              )
          ),
        )
      ],
    );
  }
}


class DropDownItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;

  DropDownItem(
      {required this.text, this.isSelected = false, this.isFirstItem = false, this.isLastItem = false});

  factory DropDownItem.first(
      {required String text, required bool isSelected}) {
    return DropDownItem(
      text: text,
      isSelected: isSelected,
      isFirstItem: true,
    );
  }

  factory DropDownItem.last({required String text, required bool isSelected}) {
    return DropDownItem(
      text: text,
      isSelected: isSelected,
      isLastItem: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirstItem ? Radius.circular(8) : Radius.zero,
          bottom: isLastItem ? Radius.circular(8) : Radius.zero,
        ),
        color: isSelected ? Colors.red.shade900 : Colors.red.shade600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Text(
            text.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

// class ArrowClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//
//     path.moveTo(0, size.height);
//     path.lineTo(size.width / 2, 0);
//     path.lineTo(size.width, size.height);
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }

// class ArrowShape extends ShapeBorder {
//   @override
//   // TODO: implement dimensions
//   EdgeInsetsGeometry get dimensions => throw UnimplementedError();
//
//   @override
//   Path getInnerPath(Rect rect, {required TextDirection textDirection}) {
//     // TODO: implement getInnerPath
//     throw UnimplementedError();
//   }
//
//   @override
//   Path getOuterPath(Rect rect, {required TextDirection textDirection}) {
//     // TODO: implement getOuterPath
//     return getClip(rect.size);
//   }
//
//   @override
//   void paint(Canvas canvas, Rect rect, {required TextDirection textDirection}) {
//     // TODO: implement paint
//   }
//
//   @override
//   ShapeBorder scale(double t) {
//     // TODO: implement scale
//     throw UnimplementedError();
//   }
//
//   Path getClip(Size size) {
//     Path path = Path();
//
//     path.moveTo(0, size.height);
//     path.lineTo(size.width / 2, 0);
//     path.lineTo(size.width, size.height);
//
//     return path;
//   }
// }
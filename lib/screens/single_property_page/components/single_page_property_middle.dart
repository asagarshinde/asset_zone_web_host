import 'package:flutter/material.dart';

class SinglePagePropertyMiddleDesktop extends StatefulWidget {
  const SinglePagePropertyMiddleDesktop({Key? key}) : super(key: key);

  @override
  State<SinglePagePropertyMiddleDesktop> createState() =>
      _SinglePagePropertyMiddleDesktopState();
}

class _SinglePagePropertyMiddleDesktopState
    extends State<SinglePagePropertyMiddleDesktop> {
  late bool _isHover = false;

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
              child: Column(
                children: [Row(children: buildMenuBar())],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Text("right"),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  List<Widget> buildMenuBar() {
    List<Widget> menu = [];
    ["About", "FEATURE", "GALLERY", "VIDEO", "FLOOR PLAN", "LOCATION"].forEach(
      (element) {
        menu.add(
          InkWell(
            child: Text(
              element,
              style: TextStyle(
                  color: _isHover ? Colors.deepOrangeAccent : Colors.black12),
            ),
            onHover: (value) {
              setState(
                () {
                  if (_isHover = value) {
                    _isHover = true;
                  }
                },
              );
            },
            onTap: () {
              print("Tapped");
            },
          ),
        );
      },
    );
    return menu;
  }
}

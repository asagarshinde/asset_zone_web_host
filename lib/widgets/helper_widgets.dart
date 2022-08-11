import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  var height;
  var width;
  MyButton({Key? key, required this.title, this.height, this.width}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  widget.width ?? 100,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        highlightColor: Colors.white38,
        splashColor: Colors.white,
        onTap: () {
          print("Clicked on me who");
        },
        child:  Center(
          child: Text(
            widget.title,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
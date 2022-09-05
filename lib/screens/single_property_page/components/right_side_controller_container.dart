import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSideControllerContainer extends StatelessWidget {
  const RightSideControllerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(700, 30,150, 0),
            child: Text(
                "Contact Info",
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.right,
            ),
            ),
          Row(

            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(700, 30,10, 0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                    NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStp3rqrXNW3bha_MHg5OcCnst_boF_rN-k1nu-nZg&s"),
                    backgroundColor: Colors.transparent,
                  )
             ),
              //SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                   // padding: EdgeInsets.fromLTRB(10, 30,0, 0),
                    child: Text(
                      "Jonathan Scott",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.fromLTRB(10, 30,0, 0),
                    child: Text(
                      "Contact@gmail.com",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(700, 30,50, 0),
            child: ListTile(
              title: Text('A-32, Albany, Newyork.'),
              leading: Icon(Icons.location_on_outlined),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(700, 0,50, 0),
            child: ListTile(
              title: Text('(+066) 518 - 457 - 5181'),
              leading: Icon(Icons.wifi_calling),
            ),
          ),
        ],
      ),
    );
  }
}

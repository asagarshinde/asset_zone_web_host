import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class RightSideControllerContainer extends StatelessWidget {
  const RightSideControllerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 50,top: 10),
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
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStp3rqrXNW3bha_MHg5OcCnst_boF_rN-k1nu-nZg&s"),
                    backgroundColor: Colors.transparent,
                  )),
              SizedBox(width: 20,),
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
            child: ListTile(
              title: Text('A-32, Albany, Newyork.'),
              leading: Icon(Icons.location_on_outlined),
            ),
          ),
          Container(

            child: ListTile(
              title: Text('(+066) 518 - 457 - 5181'),
              leading: Icon(Icons.wifi_calling),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            child: Text(
              "Request Exploration",
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ),
          Form(
              child:Column(
                children: [
               Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                  icon: const Icon(Icons.person,color: Colors.deepOrangeAccent,),
                    hintText: 'Enter your full name',
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.deepOrangeAccent,

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent
                        )
                    ),
                ),
                ),
              ),
                  SizedBox(height: 7,),
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email,color: Colors.deepOrangeAccent,),
                        hintText: 'Enter your Email',
                        labelText: 'Email ID',
                        labelStyle: TextStyle(
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone,color: Colors.deepOrangeAccent,),
                        hintText: 'Enter your Phone No.',
                        labelText: 'Phone No.',
                        labelStyle: TextStyle(
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.message,color: Colors.deepOrangeAccent,),
                        hintText: 'Message',
                        labelText: 'Message',
                        labelStyle: TextStyle(
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  MyButton(title: "Submit Request", width: 200,height: 40,)
                  ],
              )
          ),
          SizedBox(height: 20,),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(right: 100),
            child: Text(
              "Filter",
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            child: PropertySearchMobileView(),

          ),
        ],
    );
  }
}

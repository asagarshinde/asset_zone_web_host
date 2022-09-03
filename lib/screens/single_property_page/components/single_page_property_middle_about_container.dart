import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SinglePagePropertyMiddleAboutContainer extends StatelessWidget {
  const SinglePagePropertyMiddleAboutContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AutoSizeText(
              "Property Details",
              style: GoogleFonts.rubik(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AutoSizeText(
                        "Property Type :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                     Expanded(flex:1, child: AutoSizeText("House")),
                    Expanded(flex:2, child: Spacer())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Price :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    Expanded(child: AutoSizeText("\$ 1,50,000")),
                    Expanded(child: Spacer())
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Property ID :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    const Expanded(child: AutoSizeText("ABCDE3")),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Poperty Size :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    Expanded(child: AutoSizeText("1730 sq/ ft")),
                    Expanded(child: Spacer())
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Property status :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    const Expanded(child: AutoSizeText("For Sale")),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Balcony :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    Expanded(child: AutoSizeText("2")),
                    Expanded(child: Spacer())
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "City :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    const Expanded(child: AutoSizeText("Jalgaon")),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Bedrooms :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    const Expanded(child: AutoSizeText("8")),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Bathrooms :",
                        style: GoogleFonts.rubik(fontSize: 15),
                      ),
                    ),
                    const Expanded(child: AutoSizeText("4")),
                    const Expanded(child: Spacer())
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }
}

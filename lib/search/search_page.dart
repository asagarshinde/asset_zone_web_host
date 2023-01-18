import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/models/property_detail_model.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/home/components/property_search_mobile_view.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';

class SearchButtonNavigatorPage extends StatelessWidget {
  SearchButtonNavigatorPage({Key? key, required this.propertyDetails})
      : super(key: key);
  final List<PropertyDetails> propertyDetails;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 70),
              child: SimpleMenuBar(),
            )
          : AppBar(backgroundColor: kPrimaryColor),
      drawer: const MyDrawer(),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: MediaQuery.of(context).size.height + 400,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 800,
                              child: Image.asset(
                                'assets/inner-background.jpg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 200,
                          ),
                          // vertical advance search
                          const AdvanceSearchVerticalPanel(),
                          PropertyCardVerticalListView(
                              propertyDetails: propertyDetails),
                          // PropertyPhotoCarousel(),
                          const SizedBox(
                            width: 200,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PropertyCardVerticalListView extends StatelessWidget {
  const PropertyCardVerticalListView({
    Key? key,
    required this.propertyDetails,
  }) : super(key: key);

  final List<PropertyDetails> propertyDetails;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeLeft: true,
      removeRight: true,
      child: Expanded(
        flex: 3,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 650,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
            padding: EdgeInsets.all(8.0),
            itemCount: propertyDetails.length,
            itemBuilder: (BuildContext context, int index) {
              final format = DateFormat('MMMM dd, yyyy');
              return Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PropertyPhotoCarousel(imageList: propertyDetails[index].gallery),
                    // Container(
                    //   height: 316,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage(
                    //         propertyDetails[index].gallery.first,
                    //       ),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                (propertyDetails[index]
                                    .property_about
                                    .city
                                    .toUpperCase()),
                                style: GoogleFonts.roboto(
                                  letterSpacing: 3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(149, 149, 149, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText(
                                ("Little Acorn Farm"),
                                style: GoogleFonts.montserrat(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(28, 45, 58, 1),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: AutoSizeText(
                                  (propertyDetails[index]
                                      .property_about
                                      .price
                                      .toString()),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 92, 65, 1),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.bedroom_parent),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text("Bed:"),
                                          Text(propertyDetails[index]
                                              .property_about
                                              .bedrooms
                                              .toString()),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2.0,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.bathroom),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text("Bath:"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(propertyDetails[index]
                                              .property_about
                                              .bathroom
                                              .toString()),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.area_chart),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text("Sq Ft:"),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(propertyDetails[index]
                                                .property_about
                                                .property_size
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(format.format(propertyDetails[index]
                                      .upload_date
                                      .toDate())),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  MyButton(
                                    title: "Details",
                                    height: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AdvanceSearchVerticalPanel extends StatelessWidget {
  const AdvanceSearchVerticalPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Advance search",
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(28, 45, 58, 1)),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Filter",
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(88, 97, 103, 1)),
                textAlign: TextAlign.left,
              ),
            ),
            const PropertySearchMobileView(),
          ],
        ),
      ),
    );
  }
}

class PropertyPhotoCarousel extends StatefulWidget {
  PropertyPhotoCarousel({Key? key,double? height, List<String>? this.imageList}) : super(key: key);
  final imageList;

  @override
  State<PropertyPhotoCarousel> createState() => _PropertyPhotoCarouselState();
}

class _PropertyPhotoCarouselState extends State<PropertyPhotoCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    List<String> image_list = [];
    for (String url in widget.imageList){
      image_list.add(url);
    }
    print(image_list);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 600,
          height: 316,
          child: GFCarousel(
            autoPlay: true,
            height: 316,
            items: image_list.map<Widget>(
              (url) {
                print("%%%%%%%%%%% $url");
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 316,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "${url.toString()}",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
            onPageChanged: (index) {
              setState(
                () {
                  _current = index;
                },
              );
            },
          ),
        ),
        Positioned(
            top: 280,
            child: Row(
                children: widget.imageList.map<Widget>((url) {
              int index = widget.imageList.indexOf(url);
              return Container(
                margin: const EdgeInsets.all(4.0),
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Colors.red
                      : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList()))
      ],
    );
  }
}

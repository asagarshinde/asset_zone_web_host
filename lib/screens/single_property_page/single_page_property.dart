import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/single_page_property_middle.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/top_images_view.dart';

class SinglePagePropertyView extends StatelessWidget {
  SinglePagePropertyView(this.propertyDetails);

  final ScrollController scrollController = ScrollController();
  final Key singlePropertyKey = const Key("singlePageProperty");
  final propertyDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
           preferredSize: Size(MediaQuery.of(context).size.width, 70),
           child: const MyNavigationBar(),
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
                const TopImagesView(),
                const SizedBox(
                  height: 60,
                ),
                Responsive(
                  key: singlePropertyKey,
                  mobile: ShortDetailCardMobile(),
                  tablet: ShortDetailCardDesktop(propertyDetails: propertyDetails,),
                  desktop: ShortDetailCardDesktop(propertyDetails: propertyDetails),
                ),
                const SizedBox(
                  height: 60,
                ),
                SinglePagePropertyMiddleDesktop(propertyDetails: this.propertyDetails,)
              ],
            ),
          )
        ],
      ),
    );
  }
}






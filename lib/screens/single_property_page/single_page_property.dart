import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/short_detail_card.dart';
import 'package:the_asset_zone_web/screens/single_property_page/components/top_images_view.dart';
import 'package:the_asset_zone_web/widgets/helper_widgets.dart';

class SinglePagePropertyView extends StatelessWidget {
  SinglePagePropertyView({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();
  final Key singlePropertyKey = const Key("singlePageProperty");

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                tablet: ShortDetailCardDesktop(),
                desktop: ShortDetailCardDesktop(),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        )
      ],
    );
  }
}






import 'package:flutter/material.dart';
import 'package:the_asset_zone_web/constants/constants.dart';
import 'package:the_asset_zone_web/responsive.dart';
import 'package:the_asset_zone_web/screens/home/components/navigation_bar.dart';
import 'components/advance_search_vertical_panel.dart';
import 'components/property_card_grid_view.dart';

class PropertyScreen extends StatelessWidget {
  PropertyScreen({Key? key}) : super(key: key);
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
                      const SizedBox(height: 80),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(width: 200),
                          // vertical advance search
                          AdvanceSearchVerticalPanel(),
                          PropertyCardGridView(),
                          SizedBox(width: 200),
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

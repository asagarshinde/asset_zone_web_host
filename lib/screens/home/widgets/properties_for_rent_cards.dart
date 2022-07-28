import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen_widgets.dart';

class PropertiesForRentCards extends StatelessWidget {
  const PropertiesForRentCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        propertyTile(inputImagePath: 'assets/2.jpg'),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg'),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg'),
        const SizedBox(
          width: 15,
        ),
        propertyTile(inputImagePath: 'assets/2.jpg'),
      ],
    );
  }
}

class PropertiesForRentTablet extends StatelessWidget {
  const PropertiesForRentTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}

class PropertiesForRentGrid extends StatelessWidget {
  const PropertiesForRentGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: constraints.maxWidth < 500
              ? 1
              : constraints.maxWidth < 1000
                  ? 2
                  : 4,
          children: [
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
            propertyTile(inputImagePath: 'assets/2.jpg'),
            const SizedBox(
              width: 15,
            ),
          ],
        );
      },
    );
  }
}

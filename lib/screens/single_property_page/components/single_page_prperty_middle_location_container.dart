import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SinglePagePropertyMiddleLocationContainer extends StatefulWidget {
  const SinglePagePropertyMiddleLocationContainer({Key? key}) : super(key: key);

  @override
  State<SinglePagePropertyMiddleLocationContainer> createState() => _SinglePagePropertyMiddleLocationContainerState();
}

class _SinglePagePropertyMiddleLocationContainerState extends State<SinglePagePropertyMiddleLocationContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(19.018255973653343, 72.84793849278007),
          zoom: 15,
        ),
      ),
    );
  }
}

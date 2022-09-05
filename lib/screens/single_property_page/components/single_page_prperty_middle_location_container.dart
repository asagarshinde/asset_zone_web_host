import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SinglePagePropertyMiddleLocationContainer extends StatefulWidget {
  final location;

  SinglePagePropertyMiddleLocationContainer({Key? key,  this.location}) : super(key: key);

  @override
  State<SinglePagePropertyMiddleLocationContainer> createState() => _SinglePagePropertyMiddleLocationContainerState();
}

class _SinglePagePropertyMiddleLocationContainerState extends State<SinglePagePropertyMiddleLocationContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location["lat"],widget.location["lon"]),
          zoom: 8,
        ),
      ),
    );
  }
}

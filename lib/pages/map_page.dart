import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);
  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //List of polylineCoordinates
  List<LatLng> polylineCoordinates =[];
  final Completer<AndroidGoogleMapsFlutter> _controller = Completer();
  static const LatLng sourceLocation = LatLng(22.6411468, 75.8808385);
  static const LatLng destinationLocation = LatLng(22.6678997, 75.8882395);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: sourceLocation,
         // target: destinationLocation,
            zoom: 14.5,
          ),
          markers: {
            const Marker(
              markerId: MarkerId("source"),
              position: sourceLocation,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: destinationLocation,
            ),
          },
          onMapCreated: (mapController) {
            _controller.complete();
            // mapController
          },
        // List<LatLng> polylineCoordinates = [];
          polylines: {
            const Polyline (
              polylineId: PolylineId("route"),
               // points: polylineCoordinates,
              color: Color(0xFFf44336),
              width: 6,
            ),
          },

      ),

    );
  }
}

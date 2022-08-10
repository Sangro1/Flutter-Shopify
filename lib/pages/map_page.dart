
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  // LatLng userPosition;//
late GoogleMapController _controller ;

  GlobalKey<ScaffoldState> ScaffoldKey =  GlobalKey<ScaffoldState>();
  final _mapMarkerSC = StreamController<List<Marker>>();
  StreamSink<List<Marker>> get _mapMarkerSink => _mapMarkerSC.sink;
   Stream<List<Marker>> get mapMarkerStream => _mapMarkerSC.stream;
@override
Widget build(BuildContext context){
  final currentLocationCamera = const CameraPosition(
      target: LatLng( 22.6711468,75.8808385),
        zoom: 14.4746,
      );
    final googleMap = StreamBuilder<List<Marker>>(
      stream: mapMarkerStream,
      builder: ( context, snapshot){
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: currentLocationCamera,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          mapToolbarEnabled: false,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {

            _controller = controller;
          },
          markers: Set<Marker>.of(snapshot.data ?? []),
          padding: EdgeInsets.all(8),
        );
      });


          )
         }
      },
    );
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'services/location_service.dart';

class GoogleMapsLabPage extends StatefulWidget {
  @override
  State<GoogleMapsLabPage> createState() => GoogleMapsLabPageState();
}

class GoogleMapsLabPageState extends State<GoogleMapsLabPage> {
  GoogleMapController _mapController;
  StreamSubscription _streamSubscription;
  double _zoom = 9.0;

  @override
  void initState() {
    _streamSubscription = LocationService().locationStream.listen((event) {
      print('${event.latitude} ${event.longitude}');
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(event.latitude, event.longitude), zoom: _zoom)));
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(target: LatLng(37.7, -122.2), zoom: _zoom),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onCameraMove: (CameraPosition pos) {
          _zoom = pos.zoom;
        },
      ),
    );
  }
}

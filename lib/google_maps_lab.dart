import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsLabPage extends StatefulWidget {
  @override
  State<GoogleMapsLabPage> createState() => GoogleMapsLabPageState();
}

class GoogleMapsLabPageState extends State<GoogleMapsLabPage> {
  final preset = [
    {"id": "mountain-view", "lat": 37.421512, "lng": -122.084101},
    {"id": "san-bruno", "lat": 37.62816, "lng": -122.426491},
    {"id": "san-francisco", "lat": 37.789972, "lng": -122.390013},
    {"id": "sunnyvale", "lat": 37.403694, "lng": -122.031583}
  ];

  String _selectedOffice = '';

  List<Marker> _buildMarkers() {
    return preset.map((office) {
      return Marker(
          markerId: MarkerId(office['id']),
          position: LatLng(office['lat'], office['lng']),
          icon: office['id'] == _selectedOffice
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
              : BitmapDescriptor.defaultMarker,
          consumeTapEvents: true,
          onTap: () {
            setState(() {
              _selectedOffice = office['id'];
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(37.7, -122.2), zoom: 9.0),
        markers: _buildMarkers().toSet(),
      ),
    );
  }
}

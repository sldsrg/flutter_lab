import 'package:flutter/material.dart';
import 'package:labs/services/location_service.dart';
import 'package:provider/provider.dart';

import 'models/user_location.dart';

class LocationLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Indicator()),
    );
  }
}

class Indicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserLocation>(
      stream: LocationService().locationStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error!");
        } else if (snapshot.data == null) {
          return Text("NO DATA!");
        } else {
          return Column(
            children: <Widget>[
              Text('Lat: ${snapshot.data?.latitude}'),
              Text('Long: ${snapshot.data?.longitude}'),
              Text('Alt: ${snapshot.data?.altitude}'),
              Text('Accuracy: ${snapshot.data?.accuracy}'),
              Text('Time: ${DateTime.fromMillisecondsSinceEpoch(snapshot.data?.time?.toInt())}')
            ],
          );
        }
      },
    );
  }
}

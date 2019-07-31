import 'package:flutter/material.dart';

class StackLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Text('Align Centre', textAlign: TextAlign.center)),
          Positioned.fill(
              child: Text('Align Right', textAlign: TextAlign.right)),
        ],
      ),
    );
  }
}

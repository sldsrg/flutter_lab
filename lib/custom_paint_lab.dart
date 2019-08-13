import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPaintLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  ui.Image image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Title')),
      body: Center(
          child: image == null
              ? CircularProgressIndicator()
              : _buildCustomPaint()),
    );
  }

  void _loadImage() async {
    ByteData bd = await rootBundle.load("assets/sample.jpg");

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    setState(() {
      image = frame.image;
    });
  }

  _buildCustomPaint() {
    return FittedBox(
      fit: BoxFit.fill,
      child: CustomPaint(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        painter: ImageEditor(image),
      ),
    );
  }
}

class ImageEditor extends CustomPainter {
  final ui.Image image;

  ImageEditor(this.image);

  @override
  paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.drawImage(image, Offset(0.0, 0.0), Paint());
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

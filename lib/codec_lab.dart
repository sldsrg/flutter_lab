import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class CodecLabPage extends StatelessWidget {
  Future<ui.Image> makeImage() async {
    final c = Completer<ui.Image>();
    final bd = await rootBundle.load('assets/double-ring-spinner.gif');
    final Uint8List bytes = Uint8List.view(bd.buffer);
    final gif = img.decodeGif(bytes);
    ui.decodeImageFromPixels(
      gif.getBytes(),
      gif.width,
      gif.height,
      ui.PixelFormat.rgba8888,
      c.complete,
    );
    return c.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: makeImage(),
        builder: (context, snapshot) => snapshot.hasData
            ? RawImage(image: snapshot.data)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

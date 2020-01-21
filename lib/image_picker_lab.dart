import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const String url = 'http://192.168.43.205:8888/media';

class ImagePickerLabPage extends StatefulWidget {
  @override
  _ImagePickerLabPageState createState() => _ImagePickerLabPageState();
}

class _ImagePickerLabPageState extends State<ImagePickerLabPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          child: Text('upload'),
          onPressed: _upload,
        )
      ],
    );
  }

  void _upload() async {
    if (_image == null) return;
    final fileName = _image.path.split('/').last;
    final length = await _image.length();
    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..files.add(http.MultipartFile(
        'avatar',
        _image.openRead(),
        length,
        filename: fileName,
      ));
    final response = await http.Response.fromStream(await request.send());
    print("Result: ${response.statusCode} ${response.reasonPhrase}");
  }
}

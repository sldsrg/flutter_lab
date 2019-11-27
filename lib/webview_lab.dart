import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewLabPage extends StatefulWidget {
  @override
  _WebViewLabPageState createState() => _WebViewLabPageState();
}

class _WebViewLabPageState extends State<WebViewLabPage> {
  var url = 'file:///data/data/com.example.labs/app_flutter/temp.html';
  //"https://www.google.com";
  static const volumeChannel = const MethodChannel('samples.flutter.io/volume');
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    volumeChannel.setMethodCallHandler(_handleVolume);
  }

  Future _handleVolume(MethodCall call) async {
    switch (call.method) {
      case 'volume':
        if (call.arguments == 'up') {
          flutterWebviewPlugin.pageScroll(-0.85);
        } else {
          flutterWebviewPlugin.pageScroll(0.85);
        }
        return Future.value(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withLocalUrl: true,
      appBar: AppBar(
        title: Text("Widget webview"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              getContent();
            },
            child: Text('File'),
          ),
        ],
      ),
    );
  }

  getContent() async {
    try {
      final contents = await http.read(
          'https://api.github.com/repos/octokit/octokit.rb/contents/README.md',
          headers: {'Accept': 'application/vnd.github.v3.html'});
      final directory = await getApplicationDocumentsDirectory();
      final file = io.File('${directory.path}/temp.html');
      await file.writeAsString(contents);
    } catch (err) {
      print(err);
    }
  }

  changeUrl() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      url = '${directory.path}/temp.html';
    });
  }
}

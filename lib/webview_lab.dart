import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewLabPage extends StatefulWidget {
  @override
  _WebViewLabPageState createState() => _WebViewLabPageState();
}

class _WebViewLabPageState extends State<WebViewLabPage> {
  var url = 'file:///data/data/com.example.labs/app_flutter/test.html'; //"https://www.google.com";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withLocalUrl: true,
      appBar: new AppBar(
        title: new Text("Widget webview"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              getContent();
            },
            child: Text('File'),
          ),
          FlatButton(
            onPressed: () {
              changeUrl();
            },
            child: Text('Url'),
          )
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
      final file = io.File('$directory/temp2.html');
      await file.writeAsString(contents);
    } catch (HttpException) {}
  }

  changeUrl() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      url = '$directory/temp2.html';
    });
  }
}

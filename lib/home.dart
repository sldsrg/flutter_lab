import 'package:flutter/material.dart';

import 'codec_lab.dart';
import 'custom_paint_lab.dart';
import 'draggable_scrollable_sheet.dart';
import 'firestore_lab.dart';
import 'flex_lab.dart';
import 'google_maps_lab.dart';
import 'image_picker_lab.dart';
import 'localizations_lab.dart';
import 'location_lab.dart';
import 'markdown_lab.dart';
import 'multi_grid_lab.dart';
import 'next_lab.dart';
import 'provider_lab.dart';
import 'stack_lab.dart';
import 'table_lab.dart';
import 'webview_lab.dart';

Map<String, Builder> labs = {
  'Next lab': (_) => NextLabPage(),
  'WebView plugin lab': (_) => WebViewLabPage(),
  'Location lab': (_) => LocationLabPage(),
  'Google Maps lab': (_) => GoogleMapsLabPage(),
  'Localizations lab': (_) => LocalizationsLabPage(),
  'Provider lab': (_) => ProviderLabPage(),
  'Image picker lab': (_) => ImagePickerLabPage(),
  'Codec lab': (_) => CodecLabPage(),
  'Firestore lab': (_) => FirestoreLabPage(),
  'Flex lab': (_) => FlexLabPage(),
  'Markdown lab': (_) => MarkdownPage(),
  'DraggableScrollableSheet lab': (_) => DSSLabPage(),
  'Table lab': (_) => TableLabPage(),
  'Multi GridView lab': (_) => MultiGridLabPage(),
  'Stack lab': (_) => StackLabPage(),
  'CustomPaint lab': (_) => CustomPaintLabPage(),
};

typedef Widget Builder(BuildContext context);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: labs.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(labs.keys.elementAt(i)),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: labs.values.elementAt(i)),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'draggable_scrollable_sheet.dart';
import 'markdown_lab.dart';
import 'multi_grid_lab.dart';
import 'table_lab.dart';

Map<String, Builder> labs = {
  'Markdown lab': (_) => MarkdownPage(),
  'DraggableScrollableSheet lab': (_) => DSSLabPage(),
  'Table lab': (_) => TableLabPage(),
  'Multi GridView lab': (_) => MultiGridLabPage(),
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

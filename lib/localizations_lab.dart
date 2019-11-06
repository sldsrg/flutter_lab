import 'package:flutter/material.dart';

import 'app_localizations.dart';

class LocalizationsLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.helloWorld,
              textScaleFactor: 2.5,
            ),
            Text(localizations.localeHint)
          ],
        ),
      ),
    );
  }
}

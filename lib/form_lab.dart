import 'package:flutter/material.dart';

import 'controls/SpzTextFormField.dart';

class FormLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FormLab(),
    );
  }
}

class FormLab extends StatefulWidget {
  @override
  _FormLabState createState() => _FormLabState();
}

class _FormLabState extends State<FormLab> {
  final _key = GlobalKey<FormState>();
  String _login;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(children: [
        SpzTextFormField(
          label: 'Login',
          onChange: (value) {
            setState(() {
              _login = value;
            });
          },
        ),
        SpzTextFormField(
          label: 'Password',
          onChange: (value) {
            setState(() {
              _password = value;
            });
          },
        ),
        FlatButton(
          child: Text('Test'),
          onPressed: () async {
            if (_key.currentState.validate()) {
              await Future.delayed(Duration(seconds: 3));
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('user: $_login, password: $_password')));
            }
          },
        ),
      ]),
    );
  }
}

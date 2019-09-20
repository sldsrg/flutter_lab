import 'package:flutter/material.dart';

typedef StringCallback = void Function(String value);

class SpzTextFormField extends StatefulWidget {
  final String label;
  final String initialText;
  final StringCallback onChange;

  const SpzTextFormField({Key key, this.label, this.initialText, this.onChange})
      : super(key: key);

  @override
  _SpzTextFormFieldState createState() => _SpzTextFormFieldState();
}

class _SpzTextFormFieldState extends State<SpzTextFormField> {
  TextEditingController _controller;
  InputDecoration _decoration;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.onChange != null) {
      _controller.addListener(() => widget.onChange(_controller.text));
    }
    _decoration = InputDecoration(labelText: widget.label);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _decoration,
      controller: _controller,
    );
  }
}

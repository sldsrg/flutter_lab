import 'package:flutter/material.dart';

@immutable
class Item {
  static int nextId = 0;
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.name)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : id = nextId,
        color = Colors.primaries[nextId % Colors.primaries.length] {
    nextId++;
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

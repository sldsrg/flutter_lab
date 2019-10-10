import 'package:flutter_test/flutter_test.dart';

import 'package:labs/models/cart.dart';
import 'package:labs/models/item.dart';

void main() {
  test('adding item increases total cost', () {
    final cart = Cart();
    final startingPrice = cart.totalPrice;
    cart.addListener(() {
      expect(cart.totalPrice, greaterThan(startingPrice));
    });
    cart.add(Item('Dash'));
  });
}

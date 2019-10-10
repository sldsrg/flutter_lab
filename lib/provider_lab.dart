import 'package:flutter/material.dart';
import 'package:labs/models/cart.dart';
import 'package:provider/provider.dart';

import 'models/item.dart';

class ProviderLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      builder: (context) => Cart(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<Cart>(
            builder: (context, cart, child) {
              return Text('Total price: ${cart.totalPrice}');
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              return Column(
                children: <Widget>[
                  FlatButton(
                    child: Text('Add item'),
                    onPressed: () {
                      cart.add(Item('New Item'));
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

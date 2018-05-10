import 'package:flutter/material.dart';

import './components.dart';

import './globals.dart' as globals;

class CartSideBar extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      print("object");
      final items = <Widget>[];
      items.add(
          new Center(
            child: new Text("CART"),
          )
        );
      items.add(new Divider());
      globals.cart.forEach((id) => items.add(new Item(id)));
      items.add(new Divider());
      items.add(
        new Row(
          children: <Widget>[
            new Expanded(
              child: new RaisedButton(
                onPressed: () {
                  print(globals.cart);
                },
                child: new Text("Checkout"),
                color: Colors.blueAccent,
                textColor: Colors.white,
              )
            )
          ],
        )
      );
      return new Container(
        padding: EdgeInsets.all(8.0),
        child: new ListView(
          children: items,
        ),
      );
    }
}
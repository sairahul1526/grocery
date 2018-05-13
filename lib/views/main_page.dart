import 'package:flutter/material.dart';

import './components.dart';

import './globals.dart' as globals;

class MainPage extends StatelessWidget {

  final electedPayment = "Card";

  @override
    Widget build(BuildContext context) {
      var padding = new Padding(padding: EdgeInsets.all(5.0),);

      return new ListView(
        children: <Widget>[
          new Material(
            elevation: 10.0,
            child: new Carousal(globals.banners, MediaQuery.of(context).size.width * 0.51),
          ),
          padding,
          new Material(
            elevation: 10.0,
            child: new Catergories(globals.categories),
          ),
          padding,
          new Material(
            elevation: 10.0,
            child: new HorizontalList("Fruits & Vegetables - Best Offers", globals.fruitsVegetables),
          )
        ],
      );
    }
    
}
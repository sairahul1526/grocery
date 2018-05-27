import 'package:flutter/material.dart';

import './views/side_bar.dart';
import './views/cart.dart';
import './views/main_page.dart';

import './views/globals.dart' as globals;

import 'package:material_search/material_search.dart';

void main() => runApp(
  new MaterialApp(
    home: new RealWorldApp(),
    debugShowCheckedModeBanner: false,
  )
);

class RealWorldApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new RealWorldState();
    }
}

class RealWorldState extends State<RealWorldApp> {

  final _names =  [
    "New Potato - Onion - Tomato (Hybrid)",
    "Safeda Mango",
    "Cucumber",
    "Large Round Brinjal (Bharta)",
    "Kiwi - Imported",
    "Green Chilli",
    "Fresh Beans",
    "Bitter Gaurd (Karela)"
  ];

  String _name = 'No one';

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
      settings: new RouteSettings(
        name: 'material_search',
        isInitialRoute: false,
      ),
      builder: (BuildContext context) {
        return new Material(
          child: new MaterialSearch<String>(
            placeholder: 'Search for products',
            results: _names.map((String v) => new MaterialSearchResult<String>(
              // icon: Icons.person,
              value: v,
              text: v,
            )).toList(),
            filter: (dynamic value, String criteria) {
              return value.toLowerCase().trim()
                .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
            },
            onSelect: (dynamic value) => Navigator.of(context).pop(value),
            onSubmit: (String value) => Navigator.of(context).pop(value),
          ),
        );
      }
    );
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
      .push(_buildMaterialSearchPage(context))
      .then((dynamic value) {
        print(value);
        setState(() => _name = value as String);
      });
  }

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
    Widget build(BuildContext context) {
        return new Scaffold(
          key: _scaffoldkey,
          endDrawer: new Drawer(
            child: new CartSideBar(),
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          appBar: new AppBar(
            title: new Text("GROCERY", style: new TextStyle(fontSize: 18.0),),
            actions: <Widget>[
              new IconButton(
                onPressed: () {
                  _showMaterialSearch(context);
                },
                tooltip: 'Search',
                icon: new Icon(Icons.search),
              ),
              new IconButton(icon: new Icon(Icons.shopping_cart),
                onPressed: () {
                  print(globals.cart);
                  _scaffoldkey.currentState.openEndDrawer();
                },
              )
            ],
          ),
          drawer: new Drawer(
            child: new SideBar(_scaffoldkey),
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          body: new MainPage()
          ,
        );
    }
}
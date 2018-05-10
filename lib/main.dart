import 'package:flutter/material.dart';

import './views/side_bar.dart';
import './views/cart.dart';
import './views/main_page.dart';

import './views/globals.dart' as globals;

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
              new IconButton(icon: new Icon(Icons.shopping_cart),
                onPressed: () {
                  print(globals.cart);
                  _scaffoldkey.currentState.openEndDrawer();
                },
              )
            ],
          ),
          drawer: new Drawer(
            child: new SideBar(),
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          body: new MainPage()
          ,
        );
    }
}
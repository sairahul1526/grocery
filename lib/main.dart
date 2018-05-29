import 'package:flutter/material.dart';

import './views/side_bar.dart';
import './views/cart.dart';
import './views/main_page.dart';

import './views/globals.dart' as globals;
import './views/search_view.dart';

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

  String numOfItems = "0";

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    globals.server.messages.listen((no) {
      setState(() {
        numOfItems = no;
      });
    });
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
        return new Scaffold(
          key: _scaffoldkey,
          endDrawer: new Drawer(
            child: new CartSideBar(),
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          appBar: new AppBar(
            title: new Center(
              child: new Text("GROCERY", style: new TextStyle(fontSize: 18.0),),
            ),
            actions: <Widget>[
              new IconButton(
                onPressed: () {
                  SearchView().showMaterialSearch(context);
                },
                tooltip: 'Search',
                icon: new Icon(Icons.search),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: new Stack(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart),
                      onPressed: () {
                        print(globals.cart);
                        _scaffoldkey.currentState.openEndDrawer();
                      },
                    ),
                    (numOfItems != "0") ?
                    new Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 22.0, 
                        color: Colors.redAccent),
                    ) : new Text(""),
                    (numOfItems != "0") ?
                    new Positioned(
                      top: 2.0,
                      right: 7.5,
                      child: new Text(numOfItems,
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ) : new Text("")
                  ],
                ),
              ),
            ],
          ),
          drawer: new Drawer(
            child: new SideBar(_scaffoldkey),
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          body: new MainPage(),
        );
    }
}
import 'package:flutter/material.dart';

import './views/side_bar.dart';
import './views/main_page.dart';

void main() => runApp(
  new MaterialApp(
    home: new RealWorldApp(),
  )
);

class RealWorldApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new RealWorldState();
    }
}

class RealWorldState extends State<RealWorldApp> {

  @override
    Widget build(BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("GROCERY"),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.refresh),
                onPressed: () {
                  print("Reloading..");
                },
              )
            ],
          ),
          drawer: new Drawer(
            child: new SideBar(),
          ),
          body: new MainPage()
          ,
        );
    }
}
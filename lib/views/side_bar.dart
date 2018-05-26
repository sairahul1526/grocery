import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';

import './components.dart';

class SideBar extends StatelessWidget {

  final _scaffoldkey;

  SideBar(this._scaffoldkey);

  @override
    Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      return new ListView(
        padding: EdgeInsets.only(top: width * 0.125),
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(width * 0.05),
            child: new Text("My Information"),
          ),
          new ListTile(
            title: new Text("Login"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("Address"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              dialog(context, "address");
            },
          ),
          new ListTile(
            title: new Text("Orders"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              dialog(context, "orders");
            },
          ),
          new ListTile(
            title: new Text("Cart"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              _scaffoldkey.currentState.openEndDrawer();
            },
          ),
          new ListTile(
            title: new Text("Offer Zone"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              dialog(context, "offers");
            },
          ),
          new Divider(),
          new Container(
            padding: EdgeInsets.all(16.0),
            child: new Text("Others"),
          ),
          new ListTile(
            title: new Text("Need Help?"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              dialog(context, "faq");
            },
          ),
          new ListTile(
            title: new Text("Rate Us"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              LaunchReview.launch(androidAppId: "com.bigbasket.mobileapp", iOSAppId: "660683603");
            },
          ),
          new ListTile(
            title: new Text("Share"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              share("Shop best quality grocerirs online from GROCERY app and get delivery within a day - Download GROCERY app - https:///www.google.com");
            },
          ),
          new ListTile(
            title: new Text("About Us"),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              dialog(context, "about");
            },
          ),
        ],
      );
    }
}
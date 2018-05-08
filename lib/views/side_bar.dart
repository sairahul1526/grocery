import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {

  final address = "100 Feet Rd-Koramangala, Bangalore, 560095";

  @override
    Widget build(BuildContext context) {
      return new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(address),
            onTap: () => print("location clicked..."),
          ),
          new Divider(),
          new Container(
            padding: EdgeInsets.all(16.0),
            child: new Text("My Information"),
          ),
          new ListTile(
            title: new Text("Login"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("My Addresses"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("My Orders"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("My Cart"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("Offer Zone"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new Divider(),
          new Container(
            padding: EdgeInsets.all(16.0),
            child: new Text("Others"),
          ),
          new ListTile(
            title: new Text("Need Help?"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("Rate Us"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("Share"),
            trailing: new Icon(Icons.arrow_right)
          ),
          new ListTile(
            title: new Text("About Us"),
            trailing: new Icon(Icons.arrow_right)
          ),
        ],
      );
    }
}
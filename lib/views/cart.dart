import 'package:flutter/material.dart';

import './components.dart';

import './globals.dart' as globals;

class CartSideBar extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return CartSideBarState();
    }
}

class CartSideBarState extends State<CartSideBar> {

  Widget item(id) {
    var width = MediaQuery.of(context).size.width;
    var price = (globals.items[id]["variants"] as Map)[1]["price"];
    var sale = (globals.items[id]["variants"] as Map)[1]["sale"];
    var off = ((price - sale) / price) * 100;
    
    return new Container(
      width: width * 0.5,
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(width * 0.025),
          child: new Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Image.network(globals.items[id]["image"], width: width * 0.4,),
                  (price == sale) ? new Text("") : 
                    new Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.lightGreen, width: width * 0.00625),
                        color: Colors.lightGreen[100]
                      ),
                      child: new Text(off.round().toString() + "% OFF", style: new TextStyle(fontSize: width * 0.03),),
                    ),
                ],
              ),
              new Container(
                height: width * 0.11,
                child: new Column(
                  children: <Widget>[
                    new Text(globals.items[id]["name"], overflow: TextOverflow.ellipsis, maxLines: 2, style: new TextStyle(fontSize: width * 0.045),),
                  ],
                ),
              ),
              new Text((globals.items[id]["variants"] as Map)[1]["quantity"], style: new TextStyle(color: Colors.grey),),
              new Container(
                padding: new EdgeInsets.only(top: width * 0.022),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("₹" + (globals.items[id]["variants"] as Map)[1]["sale"].toString(), style: new TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.05),),
                    (price == sale) ? new Text("") : 
                      Padding(
                        padding: new EdgeInsets.all(width * 0.022),
                      ),
                    (price == sale) ? new Text("") :
                      Container(
                        foregroundDecoration: new StrikeThroughDecoration(),
                        child: new Text("₹" + (globals.items[id]["variants"] as Map)[1]["price"].toString(), style: new TextStyle(fontSize: width * 0.05, color: Colors.grey),)
                      )
                  ],
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(top: width * 0.022),
                child: ((globals.items[id]["variants"] as Map)[1]["amount"] == 0) ? 
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new RaisedButton(
                        onPressed: () {
                          setState(() {
                            (globals.items[id]["variants"] as Map)[1]["amount"] = 1;
                          });
                          globals.cart.add(id);
                          globals.server.simulateMessage(globals.cart.length.toString());
                        },
                        child: new Text("Add To Cart"),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                      )
                    )
                  ],
                ) :
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      width: width * 0.16,
                      child: new RaisedButton(
                        onPressed: () => setState(() {
                          (globals.items[id]["variants"] as Map)[1]["amount"] += 1;
                        }),
                        child: new Text("+", style: new TextStyle(fontSize: width * 0.07),),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                      ),
                    ),
                    new Container(
                      width: width * 0.1,
                      child: new Text((globals.items[id]["variants"] as Map)[1]["amount"].toString(), textAlign: TextAlign.center,),
                    ),
                    new Container(
                      width: width * 0.16,
                      child: new RaisedButton(
                        onPressed: () {
                          setState(() {
                            (globals.items[id]["variants"] as Map)[1]["amount"] -= 1;
                          });
                          if ((globals.items[id]["variants"] as Map)[1]["amount"] == 0) {
                            globals.cart.remove(id);
                            globals.server.simulateMessage(globals.cart.length.toString());
                          }
                        },
                        child: new Text("-", style: new TextStyle(fontSize: width * 0.07),),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
    Widget build(BuildContext context) {

      var width = MediaQuery.of(context).size.width;
      var price = 0;
      var sale = 0;
      for (var id in globals.cart) {
        price = price + (globals.items[id]["variants"] as Map)[1]["price"];
        sale = sale + (globals.items[id]["variants"] as Map)[1]["sale"];
      }
      setState(() {
        globals.price = price;
        globals.sale = sale;
      });
      var itemString = (globals.cart.length > 1) ? "(" + globals.cart.length.toString() + " items)" : 
        (globals.cart.length == 1) ? "(" + globals.cart.length.toString() + " item)" : "";
      return new Container(
        padding: EdgeInsets.all(width * 0.02),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: width * 0.1),
              child: new Center(
                child: new Text("CART" + itemString),
              ),
            ),
            new Divider(),
            new Expanded(
              child: (globals.cart.length == 0) ?
                new Center(child: new Text("No items in your cart") ,):
                new ListView.builder(
                  shrinkWrap: true,
                  itemCount: globals.cart.length,
                  itemBuilder: (c, i) {
                    return item(globals.cart.elementAt(i));
                  },
                ),
            ),
            new Divider(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        (globals.cart.length == 0) ? print("no items") : dialog(context, "payment");
                      },
                      child: (globals.cart.length == 0) ? new Text("Start Shopping") : new Text("Checkout"),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
            )
          ],
        )
      );
    }
}
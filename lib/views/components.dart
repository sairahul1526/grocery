import 'package:flutter/material.dart';
import 'dart:async';

import 'package:carousel/carousel.dart';

import './globals.dart' as globals;

class Carousal extends StatelessWidget {

  final images;
  final height;

  Carousal(this.images, this.height);

  @override
    Widget build(BuildContext context) {
      
      var width = MediaQuery.of(context).size.width;

      final slides = [];
      for (var i = 0; i < images.length; i++) {
        slides.add(new NetworkImage(images[i]));
      }

      return  new Container(
        height: height,
        padding: new EdgeInsets.fromLTRB(width * 0.023, width * 0.023, width * 0.023, 0.0),
        child: new Carousel(
          children: slides.map((bgImg) => new Image(image: bgImg, fit: BoxFit.cover)).toList(),
          displayDuration: const Duration(seconds: 5),
        ),
      );
    }
}

class Catergories extends StatelessWidget {

  final catergories;

  Catergories(this.catergories);

  @override
    Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      return new Container(
        height: width * 0.33,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catergories.length,
          itemBuilder: (context, i) {
            final category = catergories[i];
            final padding = (i == 0) ? 10.0 : 0.0;
            return new GestureDetector(
              onTap: () => print(MediaQuery.of(context).size),
              child: new Container(
                margin: new EdgeInsets.only(left: padding),
                width: width * 0.22,
                child: new Column(
                  children: <Widget>[
                    new Image.network(category["image"], height: width * 0.19,),
                    new Text(category["name"], style: new TextStyle(fontSize: width * 0.035), textAlign: TextAlign.center,)
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
}

class Item extends StatefulWidget {

  final id;

  Item(this.id);

  @override
    State<StatefulWidget> createState() {
      return new ItemState(id);
    }

}

class ItemState extends State<Item> {

  final id;

  ItemState(this.id);

  @override
    Widget build(BuildContext context) {
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
                            print(globals.cart);
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
                          // icon: new Icon(Icons.add),
                          // label: new Text(""),
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
                            }
                          },
                          child: new Text("-", style: new TextStyle(fontSize: width * 0.07),),
                          // icon: new Icon(Icons.add),
                          // label: new Text(""),
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
}

class StrikeThroughDecoration extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return new _StrikeThroughPainter();
  }
}

class _StrikeThroughPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = new Paint()
      ..strokeWidth = 1.0
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final rect = offset & configuration.size;
    canvas.drawLine(new Offset(rect.left, rect.top + rect.height / 2), new Offset(rect.right, rect.top + rect.height / 2), paint);
    canvas.restore();
  }
}

class HorizontalList extends StatelessWidget {

  final heading;
  final ids;

  HorizontalList(this.heading, this.ids);

  @override
    Widget build(BuildContext context) {

      var items = <Widget>[];
      items.add(
        new Padding(
          padding: EdgeInsets.all(3.0),
        )
      );
      ids.forEach((id) => items.add(new Item(id)));
      items.add(
        new Padding(
          padding: EdgeInsets.all(3.0),
        )
      );

      return new Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: new Column(
          children: <Widget>[
            new Container(
              // color: Colors.black,
              padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text(heading, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  new RaisedButton(
                    child: new Text("See all"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      print("See all");
                    },
                  )
                ],
              ),
            ),
            new Divider(
              height: 5.0,
            ),
            // new Divider(),
            new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Row(
                children: items,
              ),
            ),
          ],
        ),
      );
    }
}

class AddAddress extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new AddAddressState();
    }
}

class AddAddressState extends State<AddAddress> {
  
  var name = "";
  var flat = "";
  var street = "";
  var area = "";

  @override
    Widget build(BuildContext context) {

      return new AlertDialog(
        title: new Center(child: new Text('Add New Address'),),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'Name'
                ),
                onChanged: (String e) {
                  setState(() {
                    name = e;             
                  });
                },
              ),
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'House/Flat'
                ),
                onChanged: (String e) {
                  setState(() {
                    flat = e;             
                  });
                },
              ),
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'Street/Colony/Locality'
                ),
                onChanged: (String e) {
                  print(e);
                  setState(() {
                    street = e;             
                  });
                },
              ),
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'Area'
                ),
                onChanged: (String e) {
                  setState(() {
                    area = e;             
                  });
                },
              ),
              new Container(
                margin: EdgeInsets.only(top: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new RaisedButton(
                        onPressed: () {
                          print("added new addresss");
                          print(name);
                          print(flat + "\n" + street + "\n" + area);
                          setState(() {
                            globals.addresses.add(
                              [
                                name,
                                flat + "\n" + street + "\n" + area
                              ]
                            );
                            globals.name = name;
                            globals.address = flat + "\n" + street + "\n" + area;                       
                          });
                          Navigator.of(context).pop();
                        },
                        child: new Text("Deliver to this address"),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
    }
}

class Address extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      
      var address = <Widget>[];

      for (var add in globals.addresses) {
        address.add(
          new Card(
            child: new Container(
              padding: EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Text(add[0], style: new TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                  ),
                  new Text(add[1]),
                  new Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              print(add[1] + "address selected");
                              globals.name = add[0];
                              globals.address = add[1];
                            },
                            child: new Text("Deliver to this address"),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        );
      }

      address.add(
        new Container(
          padding: EdgeInsets.only(top: 15.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("add new address");
                    dialog(context, "add address");
                  },
                  child: new Text("Add New Address"),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                )
              )
            ],
          ),
        )
      );


      return new AlertDialog(
        title: new Center(child: new Text('Delivery Address'),),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: address,
          ),
        )
      );
    }
}

class Offers extends StatelessWidget {
  @override
    Widget build(BuildContext context) {

      var images = <Widget>[];

      for (var image in globals.offers) {
        images.add(new Image.network(image));
      }


      return new AlertDialog(
        title: new Center(child: new Text('Offers'),),
        content: new Column(
          children: <Widget>[
            new Expanded(
              child: new SingleChildScrollView(
                child: new Wrap(
                  spacing: 28.0,
                  runSpacing: 6.0,
                  children: images,
                ),
              ),
            )
          ],
        )
      );
    }
}

class FAQ extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;

      var texts = <Widget>[];

      for (var h in globals.faqs) {
        texts.add(new Container(
          padding: EdgeInsets.only(top: width * 0.07),
          child: new Text(h[0], style: new TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.bold),),)
        );
        for (var q in h[1]) {
          texts.add(new Container(
            padding: EdgeInsets.only(top: width * 0.07),
            child: new Text(q[0], style: new TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),),)
          );
          texts.add(new Container(child: new Text(q[1], style: new TextStyle(fontSize: width * 0.04),),));
        }
      }


      return new AlertDialog(
        title: new Center(child: new Text('FAQs'),),
        content: new Column(
          children: <Widget>[
            new Expanded(
              child: new SingleChildScrollView(
                child: new Wrap(
                  spacing: 28.0,
                  runSpacing: 6.0,
                  children: texts,
                ),
              ),
            )
          ],
        )
      );
    }
}

class Payment extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      var payment = new AlertDialog(
        title: new Center(child: new Text('Order Information'),),
        content: new Column(
          children: <Widget>[
            new Expanded(
              child: new SingleChildScrollView(
                child: new Wrap(
                  spacing: 28.0,
                  runSpacing: 6.0,
                  children: <Widget>[
                    new Text("Delivery Address", style: new TextStyle(color: Colors.grey),),
                    new Divider(),
                    new Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: new Text(globals.name + "\n" + globals.address),
                    ),
                    new Text("Delivery Date & Time", style: new TextStyle(color: Colors.grey),),
                    new Divider(),
                    new Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: new Text("Tue, 15 May, 6AM - 9AM", style: new TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    new Text("Payment Options", style: new TextStyle(color: Colors.grey),),
                    new Divider(),
                    new Text("Amount Payable (Incl. of all taxes)", style: new TextStyle(fontWeight: FontWeight.bold),),
                    new Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: new Text("₹2374"),
                    ),
                  ],
                ),
              ),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                    onPressed: () {
                      print(globals.cart);
                      Navigator.of(context).pop();
                    },
                    child: new Text("Proceed to Payment"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                  )
                )
              ],
            )
          ],
        ),
      );

      return payment;
    }
}

Future<Null> dialog(BuildContext context, String select)  async {

  return showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      if (select == "payment") {
        return new Payment();
      } else if (select == "faq"){
        return new FAQ();
      } else if (select == "offers"){
        return new Offers();
      } else if (select == "address"){
        return new Address();
      } else if (select == "add address"){
        return new AddAddress();
      } else {
        return new Payment();
      }
    },
  );
}
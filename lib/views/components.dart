import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:carousel/carousel.dart';

import './globals.dart' as globals;
import './category_items.dart';

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
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => 
                    new CategoryItemsView(
                      [globals.fruitsVegetables, globals.fruitsVegetables, globals.fruitsVegetables, globals.fruitsVegetables, globals.fruitsVegetables, globals.fruitsVegetables, globals.fruitsVegetables, globals.fruitsVegetables],
                      ["Fresh Fruits", "Vegetables", "Fresh Meat", "Exotic Fruits", "Fresh Fruits", "Vegetables", "Fresh Meat", "Exotic Fruits"],
                      6,
                      "Fruits & Vegetables"
                    )
                  ),
                );
              },
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

class Orders extends StatelessWidget {
  @override
    Widget build(BuildContext context) {

      var items = <Widget>[];

      for (var order in globals.orders) {
        items.add(new Divider());
        items.add(
          new Container(
            child: new Column(
              children: <Widget>[
                new Text(order[0], style: new TextStyle(fontWeight: FontWeight.bold),),
                new Text("on " + order[1], style: new TextStyle(color: Colors.grey),),
                new Text("Order ID:" + order[2], style: new TextStyle(color: Colors.grey),),
                new ExpansionTile(
                  title: new Text("View " + ((order[3] as List).length).toString() + " items ordered"),
                  children: (order[3] as List).map((val) => new ListTile(
                      title: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(globals.items[val[0]]["name"].toString()),
                          ),
                          new Text(" x " + val[1].toString())
                        ],
                      )
                    ))
                  .toList(),
                )
              ],
            ),
          )
        );
      }

      return new AlertDialog(
        title: new Center(child: new Text('Orders'),),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: items,
          ),
        )
      );
    }
}

class AddAddress extends StatefulWidget {

  final address;

  AddAddress(this.address);

  @override
    State<StatefulWidget> createState() {
      return new AddAddressState(address);
    }
}

class AddAddressState extends State<AddAddress> {
  
  var name = "";
  var flat = "";
  var street = "";
  var area = "";
  var address;

  AddAddressState(this.address);

  final GlobalKey<FormFieldState> nameKey = new GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> flatKey = new GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> streetKey = new GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> areaKey = new GlobalKey<FormFieldState>();

  @override
    Widget build(BuildContext context) {

      if (address != null) {
        setState(() {
          name = address[0];
          flat = address[1];
          street = address[2];
          area = address[3]; 
        });
      }

      return new AlertDialog(
        title: new Center(child: new Text(address == null ? 'Add New Address' : 'Edit Address'),),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new TextFormField(
                key: nameKey,
                initialValue: name,
                decoration: new InputDecoration(
                  labelText: 'Name'
                ),
              ),
              new TextFormField(
                key: flatKey,
                initialValue: flat,
                decoration: new InputDecoration(
                  labelText: 'House/Flat'
                ),
              ),
              new TextFormField(
                key: streetKey,
                initialValue: street,
                decoration: new InputDecoration(
                  labelText: 'Street/Colony/Locality '
                ),
              ),
              new TextFormField(
                key: areaKey,
                initialValue: area,
                decoration: new InputDecoration(
                  labelText: 'Area'
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 30.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new RaisedButton(
                        onPressed: () {
                          print("added new addresss");
                          print(nameKey.currentState.value);
                          print(flatKey.currentState.value + "\n" + streetKey.currentState.value + "\n" + areaKey.currentState.value);
                          setState(() {

                            if (address == null) {
                              globals.addresses.add(
                                [
                                  nameKey.currentState.value,
                                  flatKey.currentState.value,
                                  streetKey.currentState.value,
                                  areaKey.currentState.value
                                ]
                              );
                            } else {
                              var index = globals.addresses.indexOf(address);
                              globals.addresses.remove(address);
                              globals.addresses.insert(index, [
                                nameKey.currentState.value,
                                flatKey.currentState.value,
                                streetKey.currentState.value,
                                areaKey.currentState.value
                              ]);
                            }
                            
                            globals.name = nameKey.currentState.value;
                            globals.address = flatKey.currentState.value + "\n" + streetKey.currentState.value + "\n" + areaKey.currentState.value;                       
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

enum WhyFarther { edit, delete }
var editAddress;

class Address extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new AddressState();
    }
}

class AddressState extends State<Address> {
  @override
    Widget build(BuildContext context) {
      
      var address = <Widget>[];

      for (var add in globals.addresses) {
        address.add(
          new Divider()
        );
        address.add(
          new Container(
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                        child: new Text(add[0], style: new TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                      ),
                    ),
                    new PopupMenuButton<WhyFarther>(
                      onSelected: (WhyFarther result) {
                        if (result == WhyFarther.delete) {
                          setState(() {
                            globals.addresses.remove(add);                           
                          });
                          print("address deleted ");
                        } else {
                          editAddress = add;
                          print(editAddress);
                          Navigator.of(context).pop();
                          print("edit address");
                          dialog(context, "edit address");
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.edit,
                          child: const Text('Edit'),
                        ),
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.delete,
                          child: const Text('Delete'),
                        ),
                      ],
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: new Text(add[1] + "\n" + add[2] + "\n" + add[3]),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            print(add[1] + add[2] + add[3] + "address selected");
                            globals.name = add[0];
                            globals.address = add[1] + "\n" + add[2] + "\n" + add[3];
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

class FAQAboutUs extends StatelessWidget {

  final faq;

  FAQAboutUs(this.faq);

  @override
    Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;

      var texts = <Widget>[];

      for (var h in (faq ? globals.faqs : globals.about)) {
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
        title: new Center(child: new Text(faq ? 'FAQs' : 'About Us'),),
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
                      child: new FlatButton(
                        child: new Text(globals.name + "\n" + globals.address),
                        onPressed: () {
                          Navigator.of(context).pop();
                          dialog(context, "address");
                        },
                      ),
                    ),
                    new Text("Delivery Date & Time", style: new TextStyle(color: Colors.grey),),
                    new Divider(),
                    new Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          dialog(context, "delivery time");
                        },
                        child: new Text("Tue, 15 May, 6AM - 9AM", style: new TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    new Text("Payment Options", style: new TextStyle(color: Colors.grey),),
                    new Divider(),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text("Your total savings", style: new TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        new Text("₹" + (globals.price - globals.sale).toString())
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text("Amount Payable", style: new TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        new Text("₹" + globals.sale.toString())
                      ],
                    ),
                    new Text("(Incl. of all taxes)", style: new TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal),),
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

class SelectDeliveryTimePayment extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new SelectDeliveryTimePaymentState();
    }
}

class SelectDeliveryTimePaymentState extends State<SelectDeliveryTimePayment> {

  String valueDate;
  var valuesDate = [];

  String valueTime;
  var valuesTime = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    var format = new DateFormat("MMMEd");
    var today = new DateTime.now();

    valuesDate.addAll(["Tomorrow", format.format(today.add(new Duration(days: 2))), format.format(today.add(new Duration(days: 3))), format.format(today.add(new Duration(days: 4))), format.format(today.add(new Duration(days: 5)))]);
    valueDate = valuesDate[0];

    valuesTime.addAll(["10 AM - 1PM", "5 PM - 8 PM", "8 PM - 11 PM"]);
    valueTime = valuesTime[0];
  }

  @override
    Widget build(BuildContext context) {

      var payment = new AlertDialog(
        title: new Center(child: new Text('Schedule Delivery Date & Time '),),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new DropdownButton(
                      iconSize: 0.0,
                      value: valueDate,
                      items: valuesDate.map((v) {
                        return new DropdownMenuItem(
                          value: v,
                          child: new Text(v),
                        );
                      }).toList(),
                      onChanged: (v) {
                        print(v);
                        setState(() {
                          valueDate = v;               
                        });
                      },
                    ),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new DropdownButton(
                      iconSize: 0.0,
                      value: valueTime,
                      items: valuesTime.map((v) {
                        return new DropdownMenuItem(
                          value: v,
                          child: new Text(v),
                        );
                      }).toList(),
                      onChanged: (v) {
                        print(v);
                        setState(() {
                          valueTime = v;               
                        });
                      },
                    ),
                  ),
                ],
              ),
              new Container(
                padding: EdgeInsets.only(top: 15.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          dialog(context, "payment");
                        },
                        child: new Text("Done "),
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

      return payment;
    }
}

class Login extends StatelessWidget {
  @override
    Widget build(BuildContext context) {

      return new AlertDialog(
        title: new Center(child: new Text('Log In '),),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  // new Icon(Icons.),
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("login with google");
                      },
                      child: new Text("Sign in with Google", style: new TextStyle(color: Colors.black),),
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
              ),
              new Row(
                children: <Widget>[
                  // new Icon(Icons.),
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("login with google");
                      },
                      child: new Text("Sign in with Facebook"),
                      color: Color.fromRGBO(48, 60, 136, 1.0),
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
              ),
              new Row(
                children: <Widget>[
                  // new Icon(Icons.),
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("login with google");
                      },
                      child: new Text("Sign in with Twitter"),
                      color: Color.fromRGBO(47, 125, 231, 1.0),
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
              ),
              new Row(
                children: <Widget>[
                  // new Icon(Icons.),
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("login with google");
                      },
                      child: new Text("Sign in with phone"),
                      color: Color.fromRGBO(0, 194, 152, 1.0),
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
              ),
              new Row(
                children: <Widget>[
                  // new Icon(Icons.),
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("login with google");
                      },
                      child: new Text("Sign in with email"),
                      color: Color.fromRGBO(215, 0, 0, 1.0),
                      textColor: Colors.white,
                    )
                  )
                ],
              )
            ],
          ),
        )
      );
    }
}

Future<Null> dialog(BuildContext context, String select)  async {

  return showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      if (select == "payment") {
        return new Payment();
      } else if (select == "delivery time"){
        return new SelectDeliveryTimePayment();
      } else if (select == "faq"){
        return new FAQAboutUs(true);
      } else if (select == "about"){
        return new FAQAboutUs(false);
      } else if (select == "orders"){
        return new Orders();
      } else if (select == "offers"){
        return new Offers();
      } else if (select == "address"){
        return new Address();
      } else if (select == "add address"){
        return new AddAddress(null);
      } else if (select == "login"){
        return new Login();
      } else if (select == "edit address"){
        return new AddAddress(editAddress);
      } else if (select == "search select"){
        return new Item(2);
      } else {
        return new Payment();
      }
    },
  );
}
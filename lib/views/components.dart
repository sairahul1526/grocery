import 'package:flutter/material.dart';

import 'package:carousel/carousel.dart';

import './globals.dart' as globals;

class Carousal extends StatelessWidget {

  final images;
  final height;

  Carousal(this.images, this.height);

  @override
    Widget build(BuildContext context) {
      
      final slides = [];
      for (var i = 0; i < images.length; i++) {
        slides.add(new NetworkImage(images[i]));
      }

      return  new Container(
        height: height,
        padding: new EdgeInsets.all(8.0),
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
      return new Container(
        height: width * 0.83,
        width: width * 0.5,
        child: new Card(
          child: new Container(
            padding: new EdgeInsets.all(width * 0.025),
            child: new Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    new Image.network(globals.items[id]["image"], width: width * 0.4,),
                    new Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.lightGreen, width: width * 0.00625),
                        color: Colors.lightGreen[100]
                      ),
                      child: new Text("10% OFF", style: new TextStyle(fontSize: width * 0.03),),
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
                      new Padding(
                        padding: new EdgeInsets.all(width * 0.022),
                      ),
                      new Container(
                        foregroundDecoration: new StrikeThroughDecoration(),
                        child: new Text("₹" + (globals.items[id]["variants"] as Map)[1]["price"].toString(), style: new TextStyle(fontSize: width * 0.05, color: Colors.grey),)
                      )
                    ],
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.only(top: width * 0.022),
                  child:                 ((globals.items[id]["variants"] as Map)[1]["amount"] == 0) ? 
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new RaisedButton(
                          onPressed: () => setState(() {
                            (globals.items[id]["variants"] as Map)[1]["amount"] = 1;
                          }),
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
                          onPressed: () => setState(() {
                            (globals.items[id]["variants"] as Map)[1]["amount"] -= 1;
                          }),
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





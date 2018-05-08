import 'package:flutter/material.dart';

import 'package:carousel/carousel.dart';

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
      return new Container(
        height: 130.0,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catergories.length,
          itemBuilder: (context, i) {
            final category = catergories[i];
            final padding = (i == 0) ? 10.0 : 0.0;
            return new GestureDetector(
              onTap: () => print(category["name"]),
              child: new Container(
                margin: new EdgeInsets.only(left: padding),
                width: 80.0,
                child: new Column(
                  children: <Widget>[
                    new Image.network(category["image"], height: 70.0,),
                    new Text(category["name"], style: new TextStyle(fontSize: 13.0), textAlign: TextAlign.center,)
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
}
import 'package:flutter/material.dart';

import 'package:carousel/carousel.dart';

class Carousal extends StatelessWidget {

  var images = [];
  var height = 190.0;

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
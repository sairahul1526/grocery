import 'package:flutter/material.dart';

import './components.dart';

class MainPage extends StatelessWidget {

  final banners = [
    "https://www.bigbasket.com/media/uploads/section_item/images/hdpi/HP-Bigdays_F_V_1440X692-6thMay.jpg",
    "https://www.bigbasket.com/media/uploads/section_item/images/hdpi/HP-Bigdays_Staples_1440X692-6thMay.jpg",
    "https://www.bigbasket.com/media/uploads/section_item/images/xhdpi/App-HP-HUL-1440x692-1may18.jpg",
  ];

  final categories = [
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-15.jpg",
      "name": "Noodles, Sauces & Instant Food"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-13.jpg",
      "name": "Biscuits, Snacks & Chocolates"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-14.jpg",
      "name": "Breakfast & Diary"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-163.jpg",
      "name": "Personal Care"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-18.jpg",
      "name": "Household Needs"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-1047.jpg",
      "name": "Home & Kitchen"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-12.jpg",
      "name": "Bevarages"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-16.jpg",
      "name": "Grocery & Staples"
    },
    {
      "image": "https://webcdn.grofers.com/cdn/pdp/category-l0-9.jpg",
      "name": "Fruits & Vegetable"
    }
  ];

  @override
    Widget build(BuildContext context) {
      return new ListView(
        children: <Widget>[
          new Carousal(banners, MediaQuery.of(context).size.width * 0.51),
          new Catergories(categories),
          new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: new Row(
              children: <Widget>[
                new Item(1),
                new Item(2),
                new Item(1),
                new Item(2)
              ],
            ),
          )
        ],
      );
    }
    
}
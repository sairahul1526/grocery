import 'package:flutter/material.dart';

import './components.dart';

class MainPage extends StatelessWidget {

  final images = [
    "https://www.bigbasket.com/media/uploads/section_item/images/hdpi/HP-Bigdays_F_V_1440X692-6thMay.jpg",
    "https://www.bigbasket.com/media/uploads/section_item/images/hdpi/HP-Bigdays_Staples_1440X692-6thMay.jpg",
    "https://www.bigbasket.com/media/uploads/section_item/images/xhdpi/App-HP-HUL-1440x692-1may18.jpg",
  ];

  @override
    Widget build(BuildContext context) {
      return new ListView(
        children: <Widget>[
          new Carousal(images, 190.0),
        ],
      );
    }
    
}
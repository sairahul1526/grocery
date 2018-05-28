import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';

import './components.dart';

class SearchView {
  final _names =  [
    "New Potato - Onion - Tomato (Hybrid)",
    "Safeda Mango",
    "Cucumber",
    "Large Round Brinjal (Bharta)",
    "Kiwi - Imported",
    "Green Chilli",
    "Fresh Beans",
    "Bitter Gaurd (Karela)"
  ];

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
      settings: new RouteSettings(
        name: 'material_search',
        isInitialRoute: false,
      ),
      builder: (BuildContext context) {
        return new Material(
          child: new MaterialSearch<String>(
            placeholder: 'Search for products',
            results: _names.map((String v) => new MaterialSearchResult<String>(
              // icon: Icons.person,
              value: v,
              text: v,
            )).toList(),
            filter: (dynamic value, String criteria) {
              return value.toLowerCase().trim()
                .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
            },
            onSelect: (dynamic value) => Navigator.of(context).pop(value),
            onSubmit: (String value) => Navigator.of(context).pop(value),
          ),
        );
      }
    );
  }

  showMaterialSearch(BuildContext context) {
    Navigator.of(context)
      .push(_buildMaterialSearchPage(context))
      .then((dynamic value) {
        print(value);
        if (value != null) {
          dialog(context, "search select");
        }
      });
  }
}
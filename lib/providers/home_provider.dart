import 'dart:collection';

import 'package:chemistry_calculator/services/pubchem_api/element.dart';
import 'package:chemistry_calculator/services/pubchem_api/element_api.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {


  HomeProvider(this.context) {
    getElements().then((value) => elements = value);
  }

  final BuildContext context;
  List<PeriodicElement> _elements;

  double _scale = 1.0;
  double prevScale = 1.0;

  Offset _off = Offset(8, 8);
  Offset prevFocal;

  bool _gettingData = false;
  bool _error = false;

  ElementPalette _elementPalette;

  ElementPalette get elementPalette => _elementPalette;
  set elementPalette(ElementPalette elementPalette) => _update(_elementPalette = elementPalette);

  Future<List<PeriodicElement>> getElements() async {
    gettingData = true;
    return await ElementApi.getElements()
        .timeout(Duration(seconds: 15))
        .catchError((e, s) {
          print("$e\n$s");
          error = true;
        })
        .whenComplete(() => gettingData = false);
  }

  _update(dynamic assignmentStatement) => notifyListeners();

  UnmodifiableListView<PeriodicElement> get elements => UnmodifiableListView(_elements);
  set elements(List<PeriodicElement> value) => _update(_elements = value);

  bool get gettingData => _gettingData;
  set gettingData(bool value) => _update(_gettingData = value);

  bool get error => _error;
  set error(bool value) => _update(_error = value);

  double get scale => _scale;
  set scale(double value) => _update(_scale = value);

  Offset get off => _off;
  set off(Offset value) => _update(_off = value);
}

enum ElementPalette {
  elementBlock,
  default_,
}

extension ElementPaletteDecoratorMethods on ElementPalette {
  static const List<ElementPalette> values = [
    ElementPalette.default_,
    ElementPalette.elementBlock,
  ];

  static const Map<ElementPalette, String> displayNames = {
    ElementPalette.default_: "Default",
    ElementPalette.elementBlock: "Group Block"
  };

  int get index => values.indexOf(this);
  String get displayName => displayNames[this];
}
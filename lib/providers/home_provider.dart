import 'dart:collection';

import 'package:chemistry_calculator/services/pubchem_api/element.dart';
import 'package:chemistry_calculator/services/pubchem_api/element_api.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {

  HomeProvider(this.context) : assert(context != null)
  {
    getElements().then((value) => elements = value);
  }

  final BuildContext context;
  List<PeriodicElement> _elements;

  double _scale = 1.0, prevScale = 1.0;
  Offset _off = Offset.zero, prevFocal = Offset.zero;

  double get scale => _scale;
  set scale(double value) {
    _scale = value;
    notifyListeners();
  }

  Offset get off => _off;
  set off(Offset value) {
    _off = value;
    notifyListeners();
  }

  bool _gettingData = false;
  bool _error = false;

  UnmodifiableListView<PeriodicElement> get elements => UnmodifiableListView(_elements);
  set elements(List<PeriodicElement> value) {
    _elements = value;
    notifyListeners();
  }

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

  bool get gettingData => _gettingData;
  set gettingData(bool value) {
    _gettingData = value;
    notifyListeners();
  }

  bool get error => _error;
  set error(bool value) {
    _error = value;
    notifyListeners();
  }
}
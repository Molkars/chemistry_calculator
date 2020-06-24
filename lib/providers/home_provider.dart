import 'package:chemistry_calculator/services/periodic_elements/periodic_elements.dart';
import 'package:chemistry_calculator/util/element_color_palettes.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {

  HomeProvider(this.context);

  final BuildContext context;

  double _scale = 1.0, prevScale = 1.0;
  Offset _off = Offset(8, 8), prevFocal;

  ElementPalette _elementPalette = ElementPalette.groupBlock;

  _update(dynamic statement) => notifyListeners();

  double get scale => _scale;
  set scale(double value) => _update(_scale = value);

  Offset get off => _off;
  set off(Offset value) => _update(_off = value);

  ElementPalette get elementPalette => _elementPalette;
  set elementPalette(ElementPalette elementPalette) => _update(_elementPalette = elementPalette);

  List<PeriodicElement> get elements => PeriodicElements.values;
}
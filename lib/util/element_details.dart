import 'dart:ui';

import 'package:chemistry_calculator/services/periodic_elements/periodic_elements.dart';

class ElementDetails {
  final PeriodicElement element;
  final Color light, primary, dark;
  final String electronConfiguration;

  const ElementDetails({
    this.element,
    this.light,
    this.primary,
    this.dark,
    this.electronConfiguration
  });
}
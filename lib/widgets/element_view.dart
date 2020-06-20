import 'package:chemistry_calculator/services/pubchem_api/element.dart';
import 'package:chemistry_calculator/widgets/element_app_bar.dart';
import 'package:flutter/material.dart';

class ElementView extends StatelessWidget {
  final PeriodicElement element;

  const ElementView(this.element);

  @override
  Widget build(BuildContext context) {
    final Color light = Color.lerp(element.cpkHexColor, Colors.white, 0.5);
    final Color color = element.cpkHexColor.withOpacity(1.0);
    final Color dark = Color.lerp(element.cpkHexColor, Colors.black, 0.5);

    return Theme(
      data: ThemeData(
        primaryColorLight: light,
        primaryColor: color,
        primaryColorDark: dark,
        brightness: ThemeData.estimateBrightnessForColor(color),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                ElementAppBar(this.element),
              ],
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.topLeft,
            ),
          );
        },
      ),
    );
  }
}

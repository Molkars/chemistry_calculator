import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:flutter/material.dart';

class PeriodicElementTile extends StatelessWidget {
  final PeriodicElement element;

  const PeriodicElementTile(this.element);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = TextStyle(color: element.cpkHexColor.inverse);

    return Hero(
      tag: element.symbol,
      child: Container(
        color: element.cpkHexColor ?? Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(element.atomicNumber.toString(), style: style),
            Text(element.symbol, style: style),
            Text(element.name, style: style),
          ],
        ),
      ),
    );
  }
}

extension ColorMethods on Color {

  Color get inverse {
    var r = 255 - red;
    var g = 255 - green;
    var b = 255 - blue;
    return Color.fromARGB(255, r, g, b);
  }

}
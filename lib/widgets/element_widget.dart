import 'package:chemistry_calculator/chemistry/chemistry.dart';
import 'package:flutter/material.dart';

class ElementWidget extends StatelessWidget {
  final PeriodicElement element;
  final double width;
  final double height;

  const ElementWidget({this.element, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Positioned(
      left: 32 + (width * (element.group - 1.0)),
      top: 32 + (height * (element.period - 1.0)),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getBackgroundColor()[200],
              getBackgroundColor()[300]
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(element.symbol, style: TextStyle(fontSize: 24)),
            Positioned(
              top: 4,
              right: 4,
              child: Text(element.atomicNumber.toString(), style: TextStyle(fontSize: 18)),
            ),
            Positioned(
              bottom: 4,
              child: Text(element.name, style: TextStyle(fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }

  MaterialColor getBackgroundColor() {
    switch (element.type) {
      case ElementType.AlkaliMetal: return Colors.blue;
      case ElementType.AlkalineEarthMetal: return Colors.lightBlue;
      case ElementType.TransitionMetal: return Colors.lime;
      case ElementType.NobleGas: return Colors.amber;
      default: return Colors.grey;
    }
  }
}
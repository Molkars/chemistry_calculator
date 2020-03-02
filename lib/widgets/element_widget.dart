import 'package:chemistry_calculator/chemistry/chemistry.dart';
import 'package:flutter/material.dart';

class ElementWidget extends StatelessWidget {
  final PeriodicElement element;
  final double scale;
  final Offset translation;


  const ElementWidget({this.element, this.scale, this.translation});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Positioned(
      left: 32 + (64 * (element.group - 1.0)),
      top: 32 + (72 * (element.period - 1.0)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ElementFocus(this.element),
            maintainState: true,
          ));
        },
        child: Container(
          width: 64 * scale,
          height: 72 * scale,
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
              Text(element.symbol, style: TextStyle(fontSize: 24 * scale)),
              Positioned(
                top: 4,
                right: 4,
                child: Hero(
                  tag: this.element.name,
                  child: Text(element.atomicNumber.toString(), style: TextStyle(fontSize: 18 * scale))
                ),
              ),
              Positioned(
                bottom: 4,
                child: Text(element.name, style: TextStyle(fontSize: 12 * scale)),
              )
            ],
          ),
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

class ElementFocus extends StatelessWidget {
  final PeriodicElement element;
  ElementFocus({this.element});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 8,
            right: 8,
            child: Hero(
              tag: element.name,
              child: Text(element.symbol),
            ),
          )
        ],
      ),
    );
  }
}
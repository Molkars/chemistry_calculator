import 'package:chemistry_calculator/chemistry/chemistry.dart';
import 'package:flutter/material.dart';

class ElementWidget extends StatelessWidget {
  final PeriodicElement element;
  final double width;
  final double height;

  const ElementWidget({Key key, this.element, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double _width = width;
    double _height = height;

    if (width == null || height == null) {
      MediaQueryData mediaQuery = MediaQuery.of(context);
      _width = (mediaQuery.size.width - 64) / 18;
      _height = (mediaQuery.size.height - 80) / 9;
    }

    return Positioned(
      left: 32 + (_width * (element.group - 1.0)),
      top: 32 + (_height * (element.period - 1.0)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ElementFocus(element: element),
            maintainState: true,
          ));
        },
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
              // Element Symbol
              FittedBox(child: Text(element.symbol, style: TextStyle(fontSize: 24))),

              // Element
              Positioned(
                top: 2,
                right: 2,
                child: Hero(
                  tag: this.element.name,
                  child: FittedBox(child: Text(element.atomicNumber.toString(), style: TextStyle(fontSize: 18)))
                ),
              ),

              // Element Name
              Positioned(
                bottom: 2,
                child: FittedBox(child: Text(element.name, style: TextStyle(fontSize: 12))),
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
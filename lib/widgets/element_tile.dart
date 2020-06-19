import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeriodicElementTile extends StatelessWidget {
  final PeriodicElement element;

  const PeriodicElementTile(this.element);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return LayoutBuilder(
      builder: (context, layout) {
        final padding = layout.maxWidth / 18;
        final style = TextStyle(color: element.cpkHexColor.contrasting, fontWeight: FontWeight.bold);

        return Hero(
          tag: element.symbol,
          child: Material(
            color: element.cpkHexColor.opacity != 1.0 ? element.cpkHexColor.withOpacity(provider.elements.indexOf(element) / provider.elements.length.toDouble()) : element.cpkHexColor,
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: element.cpkHexColor.withOpacity(1.0),
                    title: Text(element.name, style: style),
                  ),
                  backgroundColor: Color.lerp(element.cpkHexColor.withOpacity(1.0), Colors.white, 0.75),
                )
              )),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FittedBox(
                      child: Text(element.name, style: style),
                    ),
                  ),
                  Positioned(
                    top: padding,
                    right: padding,
                    child: FittedBox(
                      child: Text(element.atomicNumber.toString(), style: style),
                    ),
                  )
                ],
              )
            ),
          ),
        );
      },
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

  Color get contrasting {
    return ThemeData.estimateBrightnessForColor(this) == Brightness.light ? Colors.black : Colors.white;
  }
}
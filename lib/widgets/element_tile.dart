import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:chemistry_calculator/util/element_color_maps.dart';
import 'package:chemistry_calculator/widgets/element_view.dart';
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
        final color = _whichColor(provider.elementPalette).opacity == 0.0 ? Colors.white : _whichColor(provider.elementPalette);
        final style = TextStyle(color: color.contrasting, fontWeight: FontWeight.bold);

        return Hero(
          tag: element.symbol,
          child: Material(
            elevation: 16,
            color: color,
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => ElementView(element),
              )),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: kStatePalette[element.defaultState] ?? Colors.black,
                    width: 3,
                  ),
                ),
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
                ),
              )
            ),
          ),
        );
      },
    );
  }

  Color _whichColor(ElementPalette palette) {
    switch (palette) {
      case ElementPalette.elementBlock: return kBlockPalette[element.groupBlock];
      case ElementPalette.default_:
      default:
        return element.cpkHexColor;
    }
  }
}

extension ColorMethods on Color {

  Color get inverse {
    var r = 255 - red;
    var g = 255 - green;
    var b = 255 - blue;
    return Color.fromARGB(255, r, g, b);
  }

  Color get contrasting => ThemeData.estimateBrightnessForColor(this) == Brightness.light ? Colors.black : Colors.white;
}
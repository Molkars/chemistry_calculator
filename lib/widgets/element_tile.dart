import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/services/periodic_elements/periodic_elements.dart';
import 'package:chemistry_calculator/util/electron_config.dart';
import 'package:chemistry_calculator/util/element_color_palettes.dart';
import 'package:chemistry_calculator/util/element_details.dart';
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
                builder: (context) => Provider<ElementDetails>(
                  create: (_) => ElementDetails(
                      dark: darken(element.cpkHexColor),
                      light: lighten(element.cpkHexColor),
                      primary: element.cpkHexColor,
                      electronConfiguration: parseElectronConfig(element.electronConfiguration),
                      element: element
                    ),
                  child: ElementView(),
                ),
              )),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(element.symbol, style: style.copyWith(fontSize: 28)),
                  Positioned(
                    bottom: padding,
                    child: FittedBox(child: Text(element.name, style: style,)),
                  ),
                  Positioned(
                    top: padding,
                    right: padding,
                    child: FittedBox(
                      child: Text(element.atomicNumber.toString(), style: style),
                    ),
                  ),
                  Positioned(
                    top: padding,
                    left: padding,
                    child: Text(element.atomicMass.toStringAsPrecision(4), style: style),
                  )
                ],
              )
            ),
          ),
        );
      },
    );
  }

  Color _whichColor(ElementPalette palette) {
    switch (palette) {
      case ElementPalette.groupBlock: return kBlockPalette[element.groupBlock];
      case ElementPalette.none: return Colors.grey;
      case ElementPalette.atomicMass: return getAtomicMassShade(element.atomicMass);
      case ElementPalette.density: return getDensityShade(element.density);
      case ElementPalette.boilingPoint: return getBoilingPointShade(element.boilingPoint);
      case ElementPalette.meltingPoint: return getMeltingPointShade(element.meltingPoint);
      case ElementPalette.electronAffinity: return getElectronAffinityShade(element.electronAffinity);
      case ElementPalette.ionizationEnergy: return getIonizationEnergyShade(element.ionizationEnergies.first);
      case ElementPalette.electronConfig: return getElectronConfigurationColor(element);
      case ElementPalette.electronegativity: return getElectronegativityShade(element.electronegativity);
      case ElementPalette.standardState: return kStatePalette[element.defaultState] ?? Colors.white;
      case ElementPalette.cpk:
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
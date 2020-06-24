import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/services/periodic_elements/periodic_elements.dart';
import 'package:chemistry_calculator/util/element_color_palettes.dart';
import 'package:chemistry_calculator/widgets/custom_gesture_detector.dart';
import 'package:chemistry_calculator/widgets/element_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Size kElementSize = const Size(72, 72);
const double kDivisionSize = 20.0;
const double kPadding = 8.0;
const double kSpacing = 4.0;

class ChemistryCalculator extends StatelessWidget {

  const ChemistryCalculator();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    PreferredSizeWidget _appBar() {
      PreferredSizeWidget appBar;

      appBar = AppBar(
        actions: [
          PopupMenuButton<ElementPalette>(
            icon: Icon(Icons.more_vert),
            onSelected: (palette) => provider.elementPalette = palette,
            itemBuilder: (context) {
              List<PopupMenuEntry> entries = ElementPalette.values.reversed.map<PopupMenuEntry<ElementPalette>>((item) {
                return PopupMenuItem(
                  child: provider.elementPalette == item
                    ? ColoredBox(color: Colors.grey, child: Text(item.displayName))
                    : Text(item.displayName),
                  value: item,
                );
              }).toList();

              return entries;
            },
          )
        ],
      );

      return appBar;
    }

    return Scaffold(
      appBar: _appBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints layout) {

          _body() {
            List<Widget> _children =
            provider.elements.map<Widget>((PeriodicElement element) {



              Offset position = Offset(
                  (element.position.dx * (kElementSize.width + kSpacing)),
                  (element.position.dy * (kElementSize.height + kSpacing)) + (element.position.dy > 6 ? kDivisionSize : 0.0)
              );

              return Positioned(
                top: provider.off.dy + position.dy * provider.scale,
                left: provider.off.dx + position.dx * provider.scale,
                child: Transform.scale(
                  scale: provider.scale,
                  alignment: Alignment.topLeft,
                  child: SizedBox.fromSize(
                    size: kElementSize,
                    child: PeriodicElementTile(element)
                  )
                ),
              );
            }).toList();

            return Stack(
              children: _children,
              overflow: Overflow.clip,
            );
          }

          return ColoredBox(
            color: Colors.blue,
            child: CustomGestureDetector(child: _body()),
          );
        },
      ),
    );
  }
}


import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:chemistry_calculator/widgets/custom_gesture_detector.dart';
import 'package:chemistry_calculator/widgets/element_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Size kElementSize = const Size(72, 72);
const double kDivisionSize = 20.0;
const double kPadding = 8.0;

class ChemistryCalculator extends StatelessWidget {

  const ChemistryCalculator();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<ElementPalette>(
            icon: Icon(Icons.more_vert),
            onSelected: (palette) => provider.elementPalette = palette,
            itemBuilder: (context) {
              List<PopupMenuEntry> entries = ElementPalette.values.reversed.map<PopupMenuEntry<ElementPalette>>((item) {
                return PopupMenuItem(
                  child: Text(item.displayName),
                  value: item,
                );
              }).toList();

              return entries;
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints layout) {

          _body() {
            List<Widget> _children =
            provider.elements.map<Widget>((PeriodicElement element) {


              return Positioned(
                // Offset plus the height of the tile + 20 pixels if the element is an actinide or lanthanide
                top: provider.off.dy + (element.position.dy * kElementSize.height * provider.scale) + (element.position.dy > 6 ? kDivisionSize : 0),
                // Offset plus the width of the tile(posX * width * scale)
                left: provider.off.dx + (element.position.dx * kElementSize.width * provider.scale),
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

          if (provider.gettingData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ColoredBox(
              color: Colors.blue,
              child: CustomGestureDetector(child: _body()),
            );
          }
        },
      ),
    );
  }
}
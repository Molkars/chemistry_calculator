import 'dart:math' as math;

import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:chemistry_calculator/widgets/element_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChemistryCalculator extends StatelessWidget {

  static const kElementSize = const Size(56, 64);

  const ChemistryCalculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints layout) {
          final provider = Provider.of<HomeProvider>(context);

          _body() {
            List<Widget> _children =
            provider.elements.map<Widget>((PeriodicElement element) {
              return Positioned(
                // Offset plus the height of the tile + 20 pixels if the element is an actinide or lanthanide
                top: provider.off.dy + (element.position.dy * kElementSize.height * provider.scale) + (element.position.dy > 6 ? 20 : 0),
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

          _padding() {
            final mq = MediaQuery.of(context);
            if (mq.orientation == Orientation.landscape) {
              return EdgeInsets.only(left: 8, top: 8);
            } else {
              return EdgeInsets.fromLTRB(8, 8, 8, 0);
            }
          }

          if (provider.gettingData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ColoredBox(
              color: Colors.blue,
              child: Padding(
                padding: _padding(),
                child: CustomGestureDetector(_body())
              ),
            );
          }
        },
      ),
    );
  }
}

class CustomGestureDetector extends StatelessWidget {

  final Widget child;
  static const Size kElementSize = ChemistryCalculator.kElementSize;
  static final Size kPeriodicTableSize = Size(kElementSize.width * 18 + 8, kElementSize.height * 9 + 36);

  const CustomGestureDetector(this.child);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints layout) {

        return GestureDetector(
          onScaleUpdate: (ScaleUpdateDetails details) {
            double minScale = 1.0, maxScale = layout.maxHeight / (5 * kElementSize.height);
            if (layout.maxWidth == kPeriodicTableSize.width && layout.maxHeight == kPeriodicTableSize.height) {
              maxScale = minScale = 1.0;
            } else if (layout.maxWidth > kPeriodicTableSize.width && layout.maxHeight > kPeriodicTableSize.height) {
              double scaleX = layout.maxWidth / kPeriodicTableSize.width;
              double scaleY = layout.maxHeight / kPeriodicTableSize.height;

              maxScale = math.max(scaleX, scaleY);
            } else {
              double scaleX = layout.maxWidth / kPeriodicTableSize.width;
              double scaleY = layout.maxHeight / kPeriodicTableSize.height;

              minScale = math.min(scaleX, scaleY);
            }

            // Calculate Translation
            Offset translationDelta = details.focalPoint - provider.prevFocal;
            provider.prevFocal = details.focalPoint;

            // Get the focal point of the screen
            print(context.size);
            Offset focalPoint = Alignment.center.alongSize(context.size);

            // Calculate Screen Scaling
            double scaleDelta = details.scale / provider.prevScale;
            provider.prevScale = details.scale;

            // Calculate the offset created by scaling
            // This creates the effect of zooming in on something instead of
            // zooming relative to a corner
            // Copied from MatrixGestureDetector
            Offset scaleOffset = Offset(
              (1 - scaleDelta) * focalPoint.dx,
              (1 - scaleDelta) * focalPoint.dy,
            );

            double newScale = provider.scale * scaleDelta;

            if (newScale < minScale) {
              double t = (provider.scale - minScale) / (provider.scale -
                  newScale);
              scaleOffset = Offset.lerp(Offset.zero, scaleOffset, t);

              newScale = minScale;
            }

            if (newScale > maxScale) {
              double t = (maxScale - provider.scale) / (newScale -
                  provider.scale);
              scaleOffset = Offset.lerp(Offset.zero, scaleOffset, t);

              newScale = maxScale;
            }

            Offset newOff = provider.off + translationDelta + scaleOffset;

            final overflow = Size(
              (kPeriodicTableSize.width * newScale) - layout.maxWidth,
              (kPeriodicTableSize.height * newScale) - layout.maxHeight,
            );

            newOff = Offset(
              newOff.dx.clamp(-overflow.width > 0 ? 0.0 : -overflow.width, 0.0),
              newOff.dy.clamp(-overflow.height > 0 ? 0.0 : -overflow.height,0.0)
            );

            provider.scale = newScale;
            provider.off = newOff;
          },
          onScaleStart: (ScaleStartDetails details) {
            provider.prevScale = 1.0;
            provider.prevFocal = details.focalPoint;
          },
          behavior: HitTestBehavior.translucent,
          child: child,
        );
      },
    );
  }
}

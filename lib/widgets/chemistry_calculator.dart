import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/util/element_positions.dart';
import 'package:chemistry_calculator/widgets/element_tile.dart';
import 'package:chemistry_calculator/widgets/matrix_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

typedef VFn = Vector4 Function(double x, double y, double z, double w);
typedef MathF<T extends num> = T Function(T, T);

class ChemistryCalculator extends StatelessWidget {

  static const kElementSize = const Size(72, 90);

  const ChemistryCalculator();

  final double minScale = 0.8, maxScale = 1.2;
  final Offset sizeConstraints = const Offset(2000.0, 1000.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints layout) {
          final provider = Provider.of<HomeProvider>(context);

          _child(Widget child) {
            return ModifiedMatrixGestureDetector(
              onMatrixUpdate: (m, tm, sm, rm) {
                double newScale = provider.scale * sm.storage[0];
                Offset _offset = Offset.zero;

                if (newScale >= minScale && newScale <= maxScale) {
                  _offset = Offset(sm.storage[12], sm.storage[13]);
                }

                provider.scale = newScale.clamp(minScale, maxScale);
                Offset _newTranslation = provider.translation +
                    Offset(tm.storage[12], tm.storage[13]) +
                    _offset;
                provider.translation = Offset(
                    _newTranslation.dx
                        .clamp(-sizeConstraints.dx, sizeConstraints.dx),
                    _newTranslation.dy
                        .clamp(-sizeConstraints.dy, sizeConstraints.dy));
              },
              behavior: HitTestBehavior.translucent,
              focalPointAlignment: Alignment.center,
              shouldRotate: false,
              child: Transform(
                  transform: Matrix4.identity()
                    ..scale(provider.scale)
                    ..translate(provider.translation.dx / provider.scale,
                        provider.translation.dy / provider.scale),
                  child: child),
            );
          }

          _body() {
            List<Widget> _children =
              provider.elements.map<Widget>((element) {
                final pos = elementPositions[element.symbol.toLowerCase()];

                return Positioned(
                  left: pos.dx * kElementSize.width,
                  top: pos.dy * kElementSize.height,
                  width: kElementSize.width,
                  height: kElementSize.height,
                  child: PeriodicElementTile(element),
                );
              }).toList();

            return Stack(
              children: _children,
              overflow: Overflow.visible,
            );
          }

          return provider.gettingData ? Center(child: CircularProgressIndicator()) : _child(_body());
        },
      ),
    );
  }
}
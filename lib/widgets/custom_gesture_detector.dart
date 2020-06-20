import 'dart:math' as math;

import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/widgets/chemistry_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double _kMinFlingVelocity = 800.0;

class CustomGestureDetector extends StatefulWidget {

  final Widget child;
  static Size kPeriodicTableSize = Size(kElementSize.width * 18 + 2 * kPadding, kElementSize.height * 9 + kDivisionSize + 2 * kPadding);

  const CustomGestureDetector({this.child});

  @override
  _CustomGestureDetectorState createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _flingAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)
      ..addListener(() {
        Provider.of<HomeProvider>(context, listen: false).off = _flingAnimation.value;
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _clampOffset(Offset input, Size overflow) {
    return Offset(
        input.dx.clamp(-overflow.width > 0 ? 0.0 : -overflow.width - kPadding, kPadding),
        input.dy.clamp(-overflow.height > 0 ? 0.0 : -overflow.height - kPadding, kPadding)
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints layout) {

        return GestureDetector(
          onScaleUpdate: (ScaleUpdateDetails details) {
            double minScale = 1.0, maxScale = layout.maxHeight / (5 * kElementSize.height);
            if (layout.maxWidth == CustomGestureDetector.kPeriodicTableSize.width && layout.maxHeight == CustomGestureDetector.kPeriodicTableSize.height) {
              maxScale = minScale = 1.0;
            } else if (layout.maxWidth > CustomGestureDetector.kPeriodicTableSize.width && layout.maxHeight > CustomGestureDetector.kPeriodicTableSize.height) {
              double scaleX = layout.maxWidth / CustomGestureDetector.kPeriodicTableSize.width;
              double scaleY = layout.maxHeight / CustomGestureDetector.kPeriodicTableSize.height;

              maxScale = math.max(scaleX, scaleY);
            } else {
              double scaleX = layout.maxWidth / CustomGestureDetector.kPeriodicTableSize.width;
              double scaleY = layout.maxHeight / CustomGestureDetector.kPeriodicTableSize.height;

              minScale = math.min(scaleX, scaleY);
            }

            // Calculate Translation
            Offset translationDelta = details.focalPoint - provider.prevFocal;
            provider.prevFocal = details.focalPoint;

            // Get the focal point of the screen
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
              (CustomGestureDetector.kPeriodicTableSize.width * newScale) - layout.maxWidth,
              (CustomGestureDetector.kPeriodicTableSize.height * newScale) - layout.maxHeight,
            );

            newOff = _clampOffset(newOff, overflow);

            provider.scale = newScale;
            provider.off = newOff;
          },
          onScaleStart: (ScaleStartDetails details) {
            provider.prevScale = 1.0;
            provider.prevFocal = details.focalPoint;
          },
          onScaleEnd: (ScaleEndDetails details) {
            final double magnitude = details.velocity.pixelsPerSecond.distance;
            if (magnitude < _kMinFlingVelocity) return;
            final Offset direction = details.velocity.pixelsPerSecond / magnitude;
            final double distance = (Offset.zero & context.size).shortestSide;

            final overflow = Size(
              (CustomGestureDetector.kPeriodicTableSize.width * provider.scale) - layout.maxWidth,
              (CustomGestureDetector.kPeriodicTableSize.height * provider.scale) - layout.maxHeight,
            );

            _flingAnimation = _controller.drive(Tween<Offset>(
                begin: provider.off, end: _clampOffset(provider.off + direction * distance, overflow)));
            _controller
              ..value = 0.0
              ..fling(velocity: magnitude / 1000.0);
          },
          behavior: HitTestBehavior.translucent,
          child: widget.child,
        );
      },
    );
  }
}

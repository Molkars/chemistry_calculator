import 'package:chemistry_calculator/chemistry/chemistry.dart';
import 'package:chemistry_calculator/widgets/element_widget.dart';
import 'package:chemistry_calculator/widgets/gesture_transformable.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PeriodicTable(),
    );
  }
}

@immutable
class PeriodicTable extends StatefulWidget {
  final double elementWidth;
  final double elementHeight;

  PeriodicTable({Key key, this.elementHeight = 72, this.elementWidth = 64}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
//          var visibleSize = Size(
//             64 + (18.0 * widget.elementWidth),
//              64 + (9.0 * widget.elementHeight)
//          );
          var visibleSize = Size(
            3 * constraints.maxWidth,
            2 * constraints.maxHeight,
          );

          return GestureTransformable(
            disableRotation: true,
            disableScale: false,
            disableTranslation: false,
            maxScale: 3,
            minScale: 0.01,
            size: Size(constraints.maxWidth, constraints.maxHeight),
            boundaryRect: Rect.fromLTWH(
              -visibleSize.width / 2,
              -visibleSize.height / 2,
              visibleSize.width / 2,
              visibleSize.height / 2
            ),
            initialTranslation: Offset(constraints.maxWidth / 2, constraints.maxHeight / 2),
            child: SizedBox.expand(
              child: Container(
                child: Stack(
                  children: ElementInteraction.elements.values.map((e) => ElementWidget(
                    element: e,
                    width: widget.elementWidth,
                    height: widget.elementHeight,
                  )).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


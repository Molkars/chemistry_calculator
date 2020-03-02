import 'package:chemistry_calculator/chemistry/chemistry.dart';
import 'package:chemistry_calculator/widgets/element_widget.dart';
import 'package:chemistry_calculator/widgets/gesture_transformable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

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
  Matrix4 _matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return MatrixGestureDetector(
            focalPointAlignment: Alignment.center,
            shouldRotate: false,
            onMatrixUpdate: (m, tm, sm, rm) => setState(() => _matrix = m),
            child: Container(
              color: Colors.green,
              child: Transform(
                transform: _matrix,
                child: Stack(
                  overflow: Overflow.visible,
                  children: getElements(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> getElements(BuildContext context) {
    return ElementInteraction.elements.values.map((PeriodicElement e) {
      return ElementWidget(
        translation: Offset.zero,
        scale: 1.0,
        element: e,
      );
    }).toList();
  }
}


import 'package:chemistry_calculator/chemistry/chemistry.dart';
import 'package:chemistry_calculator/widgets/element_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(MyApp());
}

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
  double _scale = 1.0;
  Matrix4 _translation = Matrix4.identity();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            body: MatrixGestureDetector(
              shouldRotate: false,
              shouldScale: false,
              onMatrixUpdate: (m, tm, sm, rm) {
                if (sm.storage[0] < 0.5) {
                  sm.storage[0] = 0.5;
                  setState(() {
                    _translation = sm;
                  });
                } else if (sm.storage[5] > 2.5) {
                  sm.storage[5] = 2.5;
                  setState(() {
                    _translation = sm;
                  });
                } else {
                  setState(() {
                    _translation = m;
                  });
                }
              },
              child: Container(
                color: Colors.amber,
                child: Transform.scale(
                  scale: _scale,
                  child: Transform(
                    transform: _translation,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        ...getElements(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  mini: true,
                  child: Icon(Icons.zoom_in),
                  onPressed: () {
                    if (_scale < 2) {
                      setState(() => _scale += 0.25);
                    }
                  },
                ),
                FloatingActionButton(
                  mini: true,
                  child: Icon(Icons.zoom_out),
                  onPressed: () {
                    if (_scale > 0.5) {
                      setState(() => _scale -= 0.25);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> getElements(BuildContext context) {
    return ElementInteraction.elements.values.map((PeriodicElement e) {
      var mq = MediaQuery.of(context);

      return ElementWidget(
        width: 64,
        height: 72,
        element: e,
      );
    }).toList();
  }
}


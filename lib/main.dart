import 'package:chemistry_calculator/providers/home_provider.dart';
import 'package:chemistry_calculator/widgets/chemistry_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setEnabledSystemUIOverlays([]);


  runApp(AppView());
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => HomeProvider(context)),
      ],
      child: MaterialApp(
        theme: ThemeData.dark()..copyWith(accentColor: Colors.amber),
        home: ChemistryCalculator(),
      ),
    );
  }
}

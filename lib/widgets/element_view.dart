import 'package:chemistry_calculator/util/element_details.dart';
import 'package:chemistry_calculator/widgets/element_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElementView extends StatelessWidget {

  const ElementView();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ElementDetails>(context);

    // TODO Use Hero(tag: element.symbol),

    return Theme(
      data: ThemeData(
        primaryColorLight: provider.light,
        primaryColor: provider.primary,
        primaryColorDark: provider.dark,
        brightness: ThemeData.estimateBrightnessForColor(provider.primary),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);

          return Scaffold(
            backgroundColor: provider.light,
            body: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topLeft,
              children: [
                ElementAppBar(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ElectronConfigCard(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ElectronConfigCard extends StatelessWidget {

  const ElectronConfigCard();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ElementDetails>(context);
    final theme = Theme.of(context);

    return Card(
      color: provider.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Electron Configuration", style: theme.textTheme.caption),
            Text(provider.electronConfiguration, style: theme.textTheme.subtitle1)
          ],
        ),
      )
    );
  }
}
import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:chemistry_calculator/util/element_color_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ElementAppBar extends StatelessWidget {

  final PeriodicElement element;

  const ElementAppBar(this.element);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(24)),
        side: BorderSide(
          color: kStatePalette[element.defaultState] ?? Colors.black,
          width: 2
        ),
      ),
      clipBehavior: Clip.antiAlias,
      color: theme.primaryColor,
      child: FractionallySizedBox(
        heightFactor: 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BackButton(color: theme.primaryColorDark),
            Text(element.name, style: theme.textTheme.headline6.copyWith(color: theme.primaryColorDark)),
            const SizedBox(width: 8),
            Icon(FontAwesomeIcons.atom, color: theme.primaryColorDark),
            const SizedBox(width: 16)
          ],
        ),
      ),
    );
  }
}
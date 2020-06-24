import 'package:chemistry_calculator/util/element_color_palettes.dart';
import 'package:chemistry_calculator/util/element_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ElementAppBar extends StatelessWidget {

  const ElementAppBar();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ElementDetails>(context);
    final theme = Theme.of(context);

    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(24)),
        side: BorderSide(
          color: kStatePalette[provider.element.defaultState] ?? Colors.black,
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
            Text(provider.element.name, style: theme.textTheme.headline6.copyWith(color: theme.primaryColorDark)),
            const SizedBox(width: 8),
            Icon(FontAwesomeIcons.atom, color: theme.primaryColorDark),
            const SizedBox(width: 16)
          ],
        ),
      ),
    );
  }
}
import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:chemistry_calculator/util/element_positions.dart';
import 'package:flutter/material.dart' show Color, Offset;

class PeriodicElement {
  int atomicNumber;
  String symbol;
  String name;
  double atomicMass;
  Color cpkHexColor;
  String electronConfiguration;
  double electronegativity;
  int atomicRadius;
  double ionizationEnergy;
  double electronAffinity;
  List<int> oxidationStates;
  ElementState defaultState;
  double meltingPoint;
  double boilingPoint;
  double density;
  ElementBlock groupBlock;
  int yearDiscovered;
  Offset position;

  PeriodicElement({
    this.atomicNumber,
    this.symbol,
    this.name,
    this.atomicMass,
    this.cpkHexColor,
    this.electronConfiguration,
    this.electronegativity,
    this.atomicRadius,
    this.ionizationEnergy,
    this.electronAffinity,
    this.oxidationStates,
    this.defaultState,
    this.meltingPoint,
    this.boilingPoint,
    this.density,
    this.groupBlock,
    this.yearDiscovered,
    this.position,
  });

  factory PeriodicElement.fromList(List<String> list) {
    return PeriodicElement(
      atomicNumber: int.parse(list.elementAt(0)),
      symbol: list.elementAt(1),
      name: list.elementAt(2),
      atomicMass: double.parse(list.elementAt(3).isEmpty ? "-1" : list.elementAt(3)),
      cpkHexColor: parseColor(list),
      electronConfiguration: list.elementAt(5),
      electronegativity: double.parse(list.elementAt(6).isEmpty ? "-1" : list.elementAt(6)),
      atomicRadius: int.parse(list.elementAt(7).isEmpty ? "-1" : list.elementAt(7)),
      ionizationEnergy: double.parse(list.elementAt(8).isEmpty ? "-1" : list.elementAt(8)),
      electronAffinity: double.parse(list.elementAt(9).isEmpty ? "-1" : list.elementAt(9)),
      oxidationStates: list.elementAt(10).split(",").map<int>((s) => int.parse(s.isEmpty ? "0" : s)).toList(),
      defaultState: ElementStateMethods.fromString(list.elementAt(11)),
      meltingPoint: double.parse(list.elementAt(12).isEmpty ? "-1" : list.elementAt(12)),
      boilingPoint: double.parse(list.elementAt(13).isEmpty ? "-1" : list.elementAt(13)),
      density: double.parse(list.elementAt(14).isEmpty ? "-1" : list.elementAt(14)),
      groupBlock: ElementBlockMethods.fromString(list.elementAt(15)),
      yearDiscovered: list.elementAt(16) == "Ancient" ? -1 : int.parse(list.elementAt(16)),
      position: elementPositions[list.elementAt(1)?.toLowerCase()],
    );
  }
}

Color parseColor(List<String> list) {
  if (list[0] == "68") return const Color(0xFF00e675);
  Color color = Color(int.parse("FF" + list[4], radix: 16));
  if (color.opacity == 0.0) return const Color(0xFFFFFFFF);
  return color;
}
import 'package:chemistry_calculator/services/periodic_elements/periodic_elements.dart';
import 'package:flutter/material.dart';

const Map<GroupBlock, Color> kBlockPalette = {
  GroupBlock.nonmetal: Colors.amberAccent,
  GroupBlock.alkaliMetal: Colors.orangeAccent,
  GroupBlock.alkalineEarthMetal: Colors.redAccent,
  GroupBlock.transitionMetal: Colors.lightBlueAccent,
  GroupBlock.postTransitionMetal: Colors.indigo,
  GroupBlock.metalloid: Colors.teal,
  GroupBlock.halogen: Colors.cyan,
  GroupBlock.nobleGas: Colors.lightGreen,
  GroupBlock.lanthanide: Colors.pink,
  GroupBlock.actinide: Colors.deepPurple,
};
const Map<MatterState, Color> kStatePalette = {
  MatterState.liquid: Colors.blue,
  MatterState.gas: Colors.red,
  MatterState.solid: Colors.black,
  MatterState.unknown: Colors.grey
};

Color getElectronegativityShade(double electronegativity) {
  if (electronegativity == null) return Colors.grey;
  return Color.lerp(Colors.white, Colors.indigoAccent, electronegativity / 3.98);
}
Color getIonizationEnergyShade(double ionizationEnergy) {
  if (ionizationEnergy == null) return Colors.grey;
  return Color.lerp(Colors.white, Colors.indigoAccent, ionizationEnergy / 24.587);
}
Color getAtomicMassShade(double atomicMass) {
  return Color.lerp(Colors.white, Colors.indigoAccent, atomicMass / 294.214);
}
Color getElectronAffinityShade(double electronAffinity) {
  if (electronAffinity == null) return Colors.grey;
  return Color.lerp(Colors.white, Colors.indigoAccent, electronAffinity / 3.617);
}
Color getMeltingPointShade(double meltingPoint) {
  if (meltingPoint == null) return Colors.grey;
  return Color.lerp(Colors.white, Colors.lightBlueAccent, meltingPoint / 4000);
}
Color getBoilingPointShade(double boilingPoint) {
  if (boilingPoint == null) return Colors.grey;
  return Color.lerp(Colors.white, Colors.lightBlueAccent, boilingPoint / 6000);
}
Color getDensityShade(double density) {
  if (density == null) return Colors.grey;
  return Color.lerp(Colors.white, Colors.indigoAccent, density / 25);
}
Color getElectronConfigurationColor(PeriodicElement element) {
  final position = Offset(element.period - 1.0, element.group - 1.0);
  
  if (position.dy > 6) {
    // F Block
    return Colors.greenAccent;
  } else if (position.dx < 12 && position.dx > 1) {
    // D Block
    return Colors.yellowAccent;
  } else if (position.dy == 0 || position.dx < 2) {
    // S Block
    return Colors.redAccent;
  } else {
    // P Block
    return Colors.lightBlueAccent;
  }
}

Color darken(Color color) => Color.lerp(color, Colors.black, 0.25);
Color lighten(Color color) => Color.lerp(color, Colors.white, 0.25);

enum ElementPalette {
  groupBlock,
  cpk,
  standardState,
  atomicMass,
  electronConfig,
  ionizationEnergy,
  electronAffinity,
  meltingPoint,
  boilingPoint,
  density,
  electronegativity,
  none,
}

extension ElementPaletteDecoratorMethods on ElementPalette {

  static const Map<ElementPalette, String> displayNames = {
    ElementPalette.cpk: "CPK",
    ElementPalette.groupBlock: "Group Block",
    ElementPalette.standardState: "Standard State",
    ElementPalette.atomicMass: "Atomic Mass",
    ElementPalette.electronConfig: "Electron Configuration",
    ElementPalette.ionizationEnergy: "Ionization Energy",
    ElementPalette.electronAffinity: "Electron Affinity",
    ElementPalette.meltingPoint: "Melting Point",
    ElementPalette.boilingPoint: "Boiling Point",
    ElementPalette.density: "Density",
    ElementPalette.electronegativity: "Electronegativity",
    ElementPalette.none: "None",
  };

  static const List<ElementPalette> values = [
    ElementPalette.cpk,
    ElementPalette.groupBlock,
    ElementPalette.standardState,
    ElementPalette.atomicMass,
    ElementPalette.electronConfig,
    ElementPalette.ionizationEnergy,
    ElementPalette.electronAffinity,
    ElementPalette.meltingPoint,
    ElementPalette.boilingPoint,
    ElementPalette.density,
    ElementPalette.electronegativity,
    ElementPalette.none
  ];

  int get index => values.indexOf(this);
  String get displayName => displayNames[this];
}
part of molkars_chemistry;

class Element {
  final String name;
  final String symbol;
  final List<int> charges;
  final int atomicNumber;
  final double atomicMass;
  final int group;
  final int period;
  final String electronConfiguration;
  final PhysicalState physicalState;
  final ElementType grouping;
  final bool diatomic;
  final bool radioactive;
  final bool synthetic;
  final double radius;
  final double electronegativity;
  final double firstIonization;

  const Element({
    @required this.name,
    @required this.symbol,
    @required this.atomicNumber,
    @required this.charges,
    @required this.atomicMass,
    @required this.group,
    @required this.period,
    @required this.electronConfiguration,
    @required this.physicalState,
    @required this.grouping,
    @required this.radius,
    @required this.radioactive,
    @required this.synthetic,
    @required this.electronegativity,
    @required this.firstIonization,
    this.diatomic = false,
  });
}
part of molkars_chemistry;

class PeriodicElement {
  final String name;
  final String symbol;
  final String electronConfiguration;
  final String discoveredBy;
  final String namedBy;

  final double atomicMass;
  final double boilingPoint;
  final double density;
  final double meltingPoint;
  final double molarHeat;
  final double electronAffinity;
  final double electronegativity;
  final int atomicNumber;
  final int period;
  final int group;

  final PhysicalState state;
  final SimpleElementType simpleType;
  final ElementType type;

  const PeriodicElement({
    @required this.name,
    @required this.atomicMass,
    @required this.meltingPoint,
    @required this.boilingPoint,
    @required this.electronConfiguration,
    @required this.symbol,
    @required this.atomicNumber,
    @required this.electronegativity,
    @required this.state,
    @required this.density,
    @required this.discoveredBy,
    @required this.electronAffinity,
    @required this.group,
    @required this.molarHeat,
    @required this.namedBy,
    @required this.period,
    @required this.type,
    @required this.simpleType
  });
}
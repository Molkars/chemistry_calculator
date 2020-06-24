part of periodic_elements;

class PeriodicElement {

  final String name, symbol, discoverer, electronConfiguration, summary, appearance;

  final double period, group, atomicMass, electronegativity, density, meltingPoint, boilingPoint, specificHeat, electronAffinity;
  final List<double> ionizationEnergies;

  final int atomicNumber, year, atomicRadius, numberOfIsotopes, numberOfShells, valenceElectrons;
  final List<int> oxidationStates;
  final bool isNatural;

  final bool radioactive;

  final GroupBlock groupBlock;
  final MatterState defaultState;
  final Color cpkHexColor;

  const PeriodicElement({
    this.atomicNumber,
    this.name,
    this.symbol,
    this.discoverer,
    this.year,
    this.electronConfiguration,
    this.summary,
    this.appearance,
    this.atomicMass,
    this.electronegativity,
    this.isNatural,
    this.density,
    this.meltingPoint,
    this.boilingPoint,
    this.specificHeat,
    this.electronAffinity,
    this.ionizationEnergies,
    this.period,
    this.group,
    this.atomicRadius,
    this.numberOfIsotopes,
    this.numberOfShells,
    this.valenceElectrons,
    this.oxidationStates,
    this.radioactive,
    this.groupBlock,
    this.defaultState,
    this.cpkHexColor
  });

  Offset get position => Offset(group, period);
}


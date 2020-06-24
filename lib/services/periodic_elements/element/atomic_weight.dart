part of periodic_elements;

class AtomicWeight {
  final double mass;
  final double constitution;

  const AtomicWeight({
    this.mass,
    this.constitution,
  });

  static double getMeanAtomicWeight(List<AtomicWeight> weights) {
    double mean = 0;
    for (final weight in weights) {
      mean += (weight.constitution * weight.mass);
    }
    return mean;
  }
}
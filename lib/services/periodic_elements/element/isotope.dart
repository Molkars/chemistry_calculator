part of periodic_elements;

abstract class Isotope<T extends PeriodicElement> {
  
  Duration get halfLife;
  int get isotope;
  double get atomicWeight;

  const Isotope();
}

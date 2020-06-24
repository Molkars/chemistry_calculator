part of periodic_elements;

class Temperature {
  final double celcius;
  final double fahrenheit;
  final double kelvin;

  /// A [Temperature] created from degrees kelvin
  Temperature.kelvin(this.kelvin)
      : assert(kelvin != null),
        celcius = Temperature.convert(kelvin, from: TemperatureUnit.kelvin, to: TemperatureUnit.celcius),
        fahrenheit = Temperature.convert(kelvin, from: TemperatureUnit.kelvin, to: TemperatureUnit.fahrenheit);

  /// A [Temperature] created from degrees celcius
  Temperature.celcius(this.celcius)
      : assert(celcius != null),
        kelvin = Temperature.convert(celcius),
        fahrenheit = Temperature.convert(celcius, to: TemperatureUnit.fahrenheit);

  /// A [Temperature] create from degrees fahrenheit
  Temperature.fahrenheit(this.fahrenheit)
      : assert(fahrenheit != null),
        kelvin = Temperature.convert(fahrenheit, from: TemperatureUnit.fahrenheit),
        celcius = Temperature.convert(fahrenheit, from: TemperatureUnit.fahrenheit, to: TemperatureUnit.celcius);


  /// Converts [input] to a different temperature unit of measurement
  ///
  /// Optional [to] and [from] parameters specify the type of the input
  /// and the expected output
  // ignore: missing_return
  static double convert(double input, {TemperatureUnit from = TemperatureUnit.celcius, TemperatureUnit to = TemperatureUnit.kelvin}) {
    assert(input != null);
    if (to == from) return input;

    if (from == TemperatureUnit.fahrenheit) {
      if (to == TemperatureUnit.celcius) {
        return (5.0 / 9.0) * (input - 32.0);
      } else {
        return (5.0 / 9.0) * (input - 32.0) + 273.0;
      }
    }

    if (from == TemperatureUnit.celcius) {
      if (to == TemperatureUnit.fahrenheit) {
        return (9.0 / 5.0) * input + 32.0;
      } else {
        return input + 273.0;
      }
    }

    if (from == TemperatureUnit.kelvin) {
      if (to == TemperatureUnit.celcius) {
        return input - 273;
      } else {
        return (9.0 / 5.0) * (input - 273.0) + 32.0;
      }
    }
  }
}

enum TemperatureUnit {
  fahrenheit,
  celcius,
  kelvin
}
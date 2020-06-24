library periodic_elements;

import 'dart:ui';

part 'chemistry/temperature.dart';

part 'element/periodic_element.dart';
part 'element/element_enums.dart';
part 'element/atomic_weight.dart';
part 'element/electron_configuration.dart';
part 'element/isotope.dart';
part 'util.dart';

part 'elements/hydrogen.dart';
part 'elements/helium.dart';
part 'elements/lithium.dart';
part 'elements/beryllium.dart';
part 'elements/boron.dart';
part 'elements/carbon.dart';
part 'elements/nitrogen.dart';
part 'elements/oxygen.dart';
part 'elements/fluorine.dart';
part 'elements/neon.dart';
part 'elements/sodium.dart';
part 'elements/magnesium.dart';
part 'elements/aluminum.dart';
part 'elements/silicon.dart';
part 'elements/phosphorus.dart';
part 'elements/sulfur.dart';
part 'elements/chlorine.dart';
part 'elements/argon.dart';
part 'elements/potassium.dart';
part 'elements/calcium.dart';
part 'elements/scandium.dart';
part 'elements/titanium.dart';
part 'elements/vanadium.dart';
part 'elements/chromium.dart';
part 'elements/manganese.dart';
part 'elements/iron.dart';
part 'elements/cobalt.dart';
part 'elements/nickel.dart';
part 'elements/copper.dart';
part 'elements/zinc.dart';
part 'elements/gallium.dart';
part 'elements/germanium.dart';
part 'elements/arsenic.dart';
part 'elements/selenium.dart';
part 'elements/bromine.dart';
part 'elements/krypton.dart';
part 'elements/rubidium.dart';
part 'elements/strontium.dart';
part 'elements/yttrium.dart';
part 'elements/zirconium.dart';
part 'elements/niobium.dart';
part 'elements/molybdenum.dart';
part 'elements/technetium.dart';
part 'elements/ruthenium.dart';
part 'elements/rhodium.dart';
part 'elements/palladium.dart';
part 'elements/silver.dart';
part 'elements/cadmium.dart';
part 'elements/indium.dart';
part 'elements/tin.dart';
part 'elements/antimony.dart';
part 'elements/tellurium.dart';
part 'elements/iodine.dart';
part 'elements/xenon.dart';
part 'elements/cesium.dart';
part 'elements/barium.dart';
part 'elements/lanthanum.dart';
part 'elements/cerium.dart';
part 'elements/praseodymium.dart';
part 'elements/neodymium.dart';
part 'elements/promethium.dart';
part 'elements/samarium.dart';
part 'elements/europium.dart';
part 'elements/gadolinium.dart';
part 'elements/terbium.dart';
part 'elements/dysprosium.dart';
part 'elements/holmium.dart';
part 'elements/erbium.dart';
part 'elements/thulium.dart';
part 'elements/ytterbium.dart';
part 'elements/lutetium.dart';
part 'elements/hafnium.dart';
part 'elements/tantalum.dart';
part 'elements/tungsten.dart';
part 'elements/rhenium.dart';
part 'elements/osmium.dart';
part 'elements/iridium.dart';
part 'elements/platinum.dart';
part 'elements/gold.dart';
part 'elements/mercury.dart';
part 'elements/thallium.dart';
part 'elements/lead.dart';
part 'elements/bismuth.dart';
part 'elements/polonium.dart';
part 'elements/astatine.dart';
part 'elements/radon.dart';
part 'elements/francium.dart';
part 'elements/radium.dart';
part 'elements/actinium.dart';
part 'elements/thorium.dart';
part 'elements/protactinium.dart';
part 'elements/uranium.dart';
part 'elements/neptunium.dart';
part 'elements/plutonium.dart';
part 'elements/americium.dart';
part 'elements/curium.dart';
part 'elements/berkelium.dart';
part 'elements/californium.dart';
part 'elements/einsteinium.dart';
part 'elements/fermium.dart';
part 'elements/mendelevium.dart';
part 'elements/nobelium.dart';
part 'elements/lawrencium.dart';
part 'elements/rutherfordium.dart';
part 'elements/dubnium.dart';
part 'elements/seaborgium.dart';
part 'elements/bohrium.dart';
part 'elements/hassium.dart';
part 'elements/meitnerium.dart';
part 'elements/darmstadtium.dart';
part 'elements/roentgenium.dart';
part 'elements/copernicium.dart';
part 'elements/nihonium.dart';
part 'elements/flerovium.dart';
part 'elements/moscovium.dart';
part 'elements/livermorium.dart';
part 'elements/tennessine.dart';
part 'elements/oganesson.dart';

class PeriodicElements {

  const PeriodicElements._();

  static const PeriodicElement hydrogen = _Hydrogen;
  static const PeriodicElement helium = _Helium;
  static const PeriodicElement lithium = _Lithium;
  static const PeriodicElement beryllium = _Beryllium;
  static const PeriodicElement boron = _Boron;
  static const PeriodicElement carbon = _Carbon;
  static const PeriodicElement nitrogen = _Nitrogen;
  static const PeriodicElement oxygen = _Oxygen;
  static const PeriodicElement fluorine = _Fluorine;
  static const PeriodicElement neon = _Neon;
  static const PeriodicElement sodium = _Sodium;
  static const PeriodicElement magnesium = _Magnesium;
  static const PeriodicElement aluminum = _Aluminum;
  static const PeriodicElement silicon = _Silicon;
  static const PeriodicElement phosphorus = _Phosphorus;
  static const PeriodicElement sulfur = _Sulfur;
  static const PeriodicElement chlorine = _Chlorine;
  static const PeriodicElement argon = _Argon;
  static const PeriodicElement potassium = _Potassium;
  static const PeriodicElement calcium = _Calcium;
  static const PeriodicElement scandium = _Scandium;
  static const PeriodicElement titanium = _Titanium;
  static const PeriodicElement vanadium = _Vanadium;
  static const PeriodicElement chromium = _Chromium;
  static const PeriodicElement manganese = _Manganese;
  static const PeriodicElement iron = _Iron;
  static const PeriodicElement cobalt = _Cobalt;
  static const PeriodicElement nickel = _Nickel;
  static const PeriodicElement copper = _Copper;
  static const PeriodicElement zinc = _Zinc;
  static const PeriodicElement gallium = _Gallium;
  static const PeriodicElement germanium = _Germanium;
  static const PeriodicElement arsenic = _Arsenic;
  static const PeriodicElement selenium = _Selenium;
  static const PeriodicElement bromine = _Bromine;
  static const PeriodicElement krypton = _Krypton;
  static const PeriodicElement rubidium = _Rubidium;
  static const PeriodicElement strontium = _Strontium;
  static const PeriodicElement yttrium = _Yttrium;
  static const PeriodicElement zirconium = _Zirconium;
  static const PeriodicElement niobium = _Niobium;
  static const PeriodicElement molybdenum = _Molybdenum;
  static const PeriodicElement technetium = _Technetium;
  static const PeriodicElement ruthenium = _Ruthenium;
  static const PeriodicElement rhodium = _Rhodium;
  static const PeriodicElement palladium = _Palladium;
  static const PeriodicElement silver = _Silver;
  static const PeriodicElement cadmium = _Cadmium;
  static const PeriodicElement indium = _Indium;
  static const PeriodicElement tin = _Tin;
  static const PeriodicElement antimony = _Antimony;
  static const PeriodicElement tellurium = _Tellurium;
  static const PeriodicElement iodine = _Iodine;
  static const PeriodicElement xenon = _Xenon;
  static const PeriodicElement cesium = _Cesium;
  static const PeriodicElement barium = _Barium;
  static const PeriodicElement lanthanum = _Lanthanum;
  static const PeriodicElement cerium = _Cerium;
  static const PeriodicElement praseodymium = _Praseodymium;
  static const PeriodicElement neodymium = _Neodymium;
  static const PeriodicElement promethium = _Promethium;
  static const PeriodicElement samarium = _Samarium;
  static const PeriodicElement europium = _Europium;
  static const PeriodicElement gadolinium = _Gadolinium;
  static const PeriodicElement terbium = _Terbium;
  static const PeriodicElement dysprosium = _Dysprosium;
  static const PeriodicElement holmium = _Holmium;
  static const PeriodicElement erbium = _Erbium;
  static const PeriodicElement thulium = _Thulium;
  static const PeriodicElement ytterbium = _Ytterbium;
  static const PeriodicElement lutetium = _Lutetium;
  static const PeriodicElement hafnium = _Hafnium;
  static const PeriodicElement tantalum = _Tantalum;
  static const PeriodicElement tungsten = _Tungsten;
  static const PeriodicElement rhenium = _Rhenium;
  static const PeriodicElement osmium = _Osmium;
  static const PeriodicElement iridium = _Iridium;
  static const PeriodicElement platinum = _Platinum;
  static const PeriodicElement gold = _Gold;
  static const PeriodicElement mercury = _Mercury;
  static const PeriodicElement thallium = _Thallium;
  static const PeriodicElement lead = _Lead;
  static const PeriodicElement bismuth = _Bismuth;
  static const PeriodicElement polonium = _Polonium;
  static const PeriodicElement astatine = _Astatine;
  static const PeriodicElement radon = _Radon;
  static const PeriodicElement francium = _Francium;
  static const PeriodicElement radium = _Radium;
  static const PeriodicElement actinium = _Actinium;
  static const PeriodicElement thorium = _Thorium;
  static const PeriodicElement protactinium = _Protactinium;
  static const PeriodicElement uranium = _Uranium;
  static const PeriodicElement neptunium = _Neptunium;
  static const PeriodicElement plutonium = _Plutonium;
  static const PeriodicElement americium = _Americium;
  static const PeriodicElement curium = _Curium;
  static const PeriodicElement berkelium = _Berkelium;
  static const PeriodicElement californium = _Californium;
  static const PeriodicElement einsteinium = _Einsteinium;
  static const PeriodicElement fermium = _Fermium;
  static const PeriodicElement mendelevium = _Mendelevium;
  static const PeriodicElement nobelium = _Nobelium;
  static const PeriodicElement lawrencium = _Lawrencium;
  static const PeriodicElement rutherfordium = _Rutherfordium;
  static const PeriodicElement dubnium = _Dubnium;
  static const PeriodicElement seaborgium = _Seaborgium;
  static const PeriodicElement bohrium = _Bohrium;
  static const PeriodicElement hassium = _Hassium;
  static const PeriodicElement meitnerium = _Meitnerium;
  static const PeriodicElement darmstadtium = _Darmstadtium;
  static const PeriodicElement roentgenium = _Roentgenium;
  static const PeriodicElement copernicium = _Copernicium;
  static const PeriodicElement nihonium = _Nihonium;
  static const PeriodicElement flerovium = _Flerovium;
  static const PeriodicElement moscovium = _Moscovium;
  static const PeriodicElement livermorium = _Livermorium;
  static const PeriodicElement tennessine = _Tennessine;
  static const PeriodicElement oganesson = _Oganesson;

  static const List<PeriodicElement> values = [
    hydrogen,
    helium,
    lithium,
    beryllium,
    boron,
    carbon,
    nitrogen,
    oxygen,
    fluorine,
    neon,
    sodium,
    magnesium,
    aluminum,
    silicon,
    phosphorus,
    sulfur,
    chlorine,
    argon,
    potassium,
    calcium,
    scandium,
    titanium,
    vanadium,
    chromium,
    manganese,
    iron,
    cobalt,
    nickel,
    copper,
    zinc,
    gallium,
    germanium,
    arsenic,
    selenium,
    bromine,
    krypton,
    rubidium,
    strontium,
    yttrium,
    zirconium,
    niobium,
    molybdenum,
    technetium,
    ruthenium,
    rhodium,
    palladium,
    silver,
    cadmium,
    indium,
    tin,
    antimony,
    tellurium,
    iodine,
    xenon,
    cesium,
    barium,
    lanthanum,
    cerium,
    praseodymium,
    neodymium,
    promethium,
    samarium,
    europium,
    gadolinium,
    terbium,
    dysprosium,
    holmium,
    erbium,
    thulium,
    ytterbium,
    lutetium,
    hafnium,
    tantalum,
    tungsten,
    rhenium,
    osmium,
    iridium,
    platinum,
    gold,
    mercury,
    thallium,
    lead,
    bismuth,
    polonium,
    astatine,
    radon,
    francium,
    radium,
    actinium,
    thorium,
    protactinium,
    uranium,
    neptunium,
    plutonium,
    americium,
    curium,
    berkelium,
    californium,
    einsteinium,
    fermium,
    mendelevium,
    nobelium,
    lawrencium,
    rutherfordium,
    dubnium,
    seaborgium,
    bohrium,
    hassium,
    meitnerium,
    darmstadtium,
    roentgenium,
    copernicium,
    nihonium,
    flerovium,
    moscovium,
    livermorium,
    tennessine,
    oganesson
  ];
}

extension PeriodicElementIndecies on PeriodicElement {
  int get index => PeriodicElements.values.indexOf(this);
}
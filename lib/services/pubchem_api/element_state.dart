import 'dart:collection';

enum ElementState {
  solid,
  liquid,
  gas,
}

extension ElementStateMethods on ElementState {
  static const Map<String, ElementState> keys = {
    "Solid": ElementState.solid,
    "Liquid": ElementState.liquid,
    "Gas": ElementState.gas,
  };

  static ElementState fromString(String key) => ElementStateMethods.keys[key];
}

enum ElementBlock {
  nonmetal,
  alkaliMetal,
  alkalineEarthMetal,
  transitionMetal,
  lanthanide,
  actinide,
  metalloid,
  postTransitionMetal,
  nobleGas,
  halogen,
}

extension ElementBlockMethods on ElementBlock {
  static final Map<ElementBlock, String> blocks = <ElementBlock, String>{
    ElementBlock.actinide: "Actinide",
    ElementBlock.alkaliMetal: "Alkali metal",
    ElementBlock.alkalineEarthMetal: "Alkaline earth metal",
    ElementBlock.halogen: "Halogen",
    ElementBlock.lanthanide: "Lanthanide",
    ElementBlock.metalloid: "Metalloid",
    ElementBlock.nobleGas: "Noble gas",
    ElementBlock.nonmetal: "Nonmetal",
    ElementBlock.postTransitionMetal: "Post-transition metal",
    ElementBlock.transitionMetal: "Transition metal",
  };

  String get name => blocks.values.elementAt(blocks.keys.toList().indexOf(this));
  static ElementBlock fromString(String value) => blocks.keys.elementAt(blocks.values.toList().indexOf(value));
}
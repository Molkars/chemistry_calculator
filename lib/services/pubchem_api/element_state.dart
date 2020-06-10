import 'dart:collection';

enum ElementState {
  Solid,
  Liquid,
  Gas,
}

extension ElementStateMethods on ElementState {
  static const Map<String, ElementState> keys = {
    "Solid": ElementState.Solid,
    "Liquid": ElementState.Liquid,
    "Gas": ElementState.Gas,
  };

  static ElementState fromString(String key) => ElementStateMethods.keys[key];
}

enum ElementBlock {
  Actinide,
  AlkaliMetal,
  AlkalineEarthMetal,
  Halogen,
  Lanthanide,
  Metalloid,
  NobleGas,
  Nonmetal,
  PostTransitionMetal,
  TransitionMetal,
}

extension ElementBlockMethods on ElementBlock {
  static final Map<ElementBlock, String> blocks = <ElementBlock, String>{
    ElementBlock.Actinide: "Actinide",
    ElementBlock.AlkaliMetal: "Alkali metal",
    ElementBlock.AlkalineEarthMetal: "Alkaline earth metal",
    ElementBlock.Halogen: "Halogen",
    ElementBlock.Lanthanide: "Lanthanide",
    ElementBlock.Metalloid: "Metalloid",
    ElementBlock.NobleGas: "Noble gas",
    ElementBlock.Nonmetal: "Nonmetal",
    ElementBlock.PostTransitionMetal: "Post-transition metal",
    ElementBlock.TransitionMetal: "Transition metal",
  };

  String get name => blocks.values.elementAt(blocks.keys.toList().indexOf(this));
  static ElementBlock fromString(String value) => blocks.keys.elementAt(blocks.values.toList().indexOf(value));
}
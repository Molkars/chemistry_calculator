part of periodic_elements;

enum MatterState {
  solid,
  liquid,
  gas,
  unknown
}

extension MatterStateMethods on MatterState {
  static const Map<String, MatterState> keys = {
    "Solid": MatterState.solid,
    "Liquid": MatterState.liquid,
    "Gas": MatterState.gas,
    "Unknown": MatterState.unknown
  };

  static const List<MatterState> values = [
    MatterState.solid,
    MatterState.liquid,
    MatterState.gas
  ];

  int get index => values.indexOf(this);

  static MatterState fromString(String key) => MatterStateMethods.keys[key];
}

enum GroupBlock {
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

extension GroupBlockMethods on GroupBlock {
  static final Map<GroupBlock, String> blocks = <GroupBlock, String>{
    GroupBlock.actinide: "Actinide",
    GroupBlock.alkaliMetal: "Alkali metal",
    GroupBlock.alkalineEarthMetal: "Alkaline earth metal",
    GroupBlock.halogen: "Halogen",
    GroupBlock.lanthanide: "Lanthanide",
    GroupBlock.metalloid: "Metalloid",
    GroupBlock.nobleGas: "Noble gas",
    GroupBlock.nonmetal: "Nonmetal",
    GroupBlock.postTransitionMetal: "Post-transition metal",
    GroupBlock.transitionMetal: "Transition metal",
  };

  static const List<GroupBlock> values = [
    GroupBlock.nonmetal,
    GroupBlock.alkaliMetal,
    GroupBlock.alkalineEarthMetal,
    GroupBlock.transitionMetal,
    GroupBlock.lanthanide,
    GroupBlock.actinide,
    GroupBlock.metalloid,
    GroupBlock.postTransitionMetal,
    GroupBlock.nobleGas,
    GroupBlock.halogen,
  ];

  int get index => values.indexOf(this);
  String get name => blocks.values.elementAt(blocks.keys.toList().indexOf(this));
  static GroupBlock fromString(String value) => blocks.keys.elementAt(blocks.values.toList().indexOf(value));
}
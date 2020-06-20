import 'package:chemistry_calculator/services/pubchem_api/pubchem_api.dart';
import 'package:flutter/material.dart';

const Map<ElementState, Color> kStatePalette = {
  ElementState.liquid: const Color(0xFF0014FF),
  ElementState.gas: const Color(0xFFFF2233),
  ElementState.solid: Colors.blueGrey
};

const Map<ElementBlock, Color> kBlockPalette = {
  ElementBlock.nonmetal: const Color(0xFFFFE494),
  ElementBlock.alkaliMetal: const Color(0xFFFFB185),
  ElementBlock.alkalineEarthMetal: const Color(0xFFFF8585),
  ElementBlock.transitionMetal: const Color(0xFFFFE985),
  ElementBlock.postTransitionMetal: const Color(0xFFFFCB2E),
  ElementBlock.metalloid: const Color(0xFFFFA82E),
  ElementBlock.halogen: const Color(0xFFF3FF94),
  ElementBlock.nobleGas: const Color(0xFF8CFF00),
  ElementBlock.lanthanide: const Color(0xFFBF0046),
  ElementBlock.actinide: const Color(0xFF4D00BF),
};



Color darken(Color color) => Color.lerp(color, Colors.black, 0.2);
Color lighten(Color color) => Color.lerp(color, Colors.white, 0.2);
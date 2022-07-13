import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#8e24a1');
  static Color secondary = HexColor.fromHex('#d61557');
  static Color blackText = HexColor.fromHex('#333333');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    String newHexColorString = hexColorString.toUpperCase().replaceAll('#', '');
    if (newHexColorString.length == 6) {
      newHexColorString = 'FF$newHexColorString';
    }
    return Color(int.parse(newHexColorString, radix: 16));
  }
}

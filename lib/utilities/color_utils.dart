// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

hexStringToColor(String HexColor) {
  HexColor = HexColor.toUpperCase().replaceAll('0', '');
  if (HexColor.length == 6) {
    HexColor = "FF" + HexColor;
  }
  return Color(int.parse(HexColor, radix: 16));
}

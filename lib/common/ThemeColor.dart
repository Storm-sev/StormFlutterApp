
import 'package:flutter/material.dart';


const custThemes = <Map<String,Color>>[
  normaTheme,
  darkTheme,
  normaTheme,
  darkTheme,
  darkTheme,
];

const normaTheme = <String, Color>{
  "titleColor": Colors.black,
  "buttonTextColor": Colors.black,
};
const darkTheme = <String, Color>{
  "titleColor": Colors.black,
  "buttonTextColor": Colors.white,
};

class LightTheme{
  static Color get titleColor => Colors.black;
  static Color get buttonBgColor => Colors.blue;
  static Color get buttonTextColor => Colors.white;
  static Color get listTitleColor => Colors.black87;
}

class YellowTheme{
  static Color get titleColor => Colors.white;
  static Color get buttonBgColor => Colors.yellow;
  static Color get buttonTextColor => Colors.white;
  static Color get listTitleColor => Colors.black87;
}
import 'package:flutter/material.dart';

final List<CustomTheme> custThemes = <CustomTheme>[
  lightTheme,
  darkTheme,
  tealTheme,
  greenTheme,
  redTheme,
];

class CustomTheme {
  Color? titleColor;
  Color? buttonBgColor;
  Color? buttonTextColor;
  Color? listTitleColor;

  CustomTheme(
      {this.titleColor,
      this.buttonBgColor,
      this.buttonTextColor,
      this.listTitleColor});
}

final CustomTheme lightTheme = CustomTheme(
  titleColor: Colors.black,
  buttonBgColor: Colors.blue,
  buttonTextColor: Colors.white,
  listTitleColor: Colors.black87,
);

final CustomTheme darkTheme = CustomTheme(
  titleColor: Colors.white,
  buttonBgColor: Colors.blue,
  buttonTextColor: Colors.white,
  listTitleColor: Colors.black87,
);
final CustomTheme greenTheme = CustomTheme(
  titleColor: Colors.white,
  buttonBgColor: Colors.green,
  buttonTextColor: Colors.white,
  listTitleColor: Colors.black87,
);
final CustomTheme tealTheme = CustomTheme(
  titleColor: Colors.white,
  buttonBgColor: Colors.teal,
  buttonTextColor: Colors.white,
  listTitleColor: Colors.black87,
);

final CustomTheme redTheme = CustomTheme(
  titleColor: Colors.white,
  buttonBgColor: Colors.red,
  buttonTextColor: Colors.white,
  listTitleColor: Colors.black87,
);





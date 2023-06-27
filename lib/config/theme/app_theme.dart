import 'package:flutter/material.dart';

const colorList = <Color>[
  Color.fromRGBO(84, 9, 11, 1),
  Color.fromRGBO(16, 150, 72, 1),
  Colors.teal,
  Colors.green,
  Colors.deepPurple,
  Colors.deepOrangeAccent,
  Colors.pinkAccent
];

class AppTheme {
  ThemeData getTheme(bool darkmode, int selectedColor) => ThemeData(
        brightness: darkmode ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
      );
}

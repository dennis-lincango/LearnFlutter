
import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 68, 189, 84);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.indigoAccent,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length-1,
   'Selected Color must be between 0 and ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
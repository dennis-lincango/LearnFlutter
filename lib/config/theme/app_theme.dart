
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

class MyColors{
  static final darkBlue = Color(0xFF1E1E2C);
  static final lightBlue = Color(0xFF2D2D44);
}

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyColors.lightBlue,
    brightness: Brightness.light,

  );

  static final darkTheme = ThemeData(
    primaryColor: MyColors.darkBlue,
    brightness: Brightness.dark,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.black,
    indicatorColor: Colors.white,
    canvasColor: Colors.black,
    colorSchemeSeed: Colors.black,
    scaffoldBackgroundColor: Colors.black,
  );

}

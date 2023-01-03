import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData? _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;

      case 2: //Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
        break;

      case 3: //Custom
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }

    notifyListeners();
  }

  bool get customTheme => _customTheme;

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        //colorScheme.secondary //accentColor
        //primaryColorLight
        //scaffoldBackgroundColor
        //textTheme.bodyText1!.color
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202B),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
        accentColor: const Color(0xff48A0EB),
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  ThemeData? get currentTheme => _currentTheme;
}

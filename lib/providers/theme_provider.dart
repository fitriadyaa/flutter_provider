import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isBlueColor = false;

  bool get getBlueColor => _isBlueColor;

  set setBoolColor(bool newValue) {
    _isBlueColor = newValue;
    notifyListeners();
  }

  Color get color => (_isBlueColor) ? Colors.amber : Colors.blue;
}

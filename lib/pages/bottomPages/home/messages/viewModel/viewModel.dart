import 'package:flutter/material.dart';

class VisibilityModel extends ChangeNotifier {
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void setVisible(bool visible) {
    _isVisible = visible;
    notifyListeners();
  }
}

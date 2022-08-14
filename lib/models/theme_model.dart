import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
	bool _isDarkMode;
	ThemeModel(this._isDarkMode);

	bool get isDarkMode => _isDarkMode;
	ThemeMode get mode => isDarkMode ? ThemeMode.dark  : ThemeMode.light;
	IconData  get icon => isDarkMode ? Icons.dark_mode : Icons.light_mode;

	void toggle() {
		_isDarkMode = !isDarkMode;
		notifyListeners();
	}
}
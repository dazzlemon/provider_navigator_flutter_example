import 'package:flutter/material.dart';

class VolumeModel extends ChangeNotifier {
	double _value;
	final double max;
	final double min;
	VolumeModel(this._value, this.min, this.max);

	double get value => _value;

	set value(double newValue) {
		if (newValue >= min && newValue <= max && newValue != _value) {
			_value = newValue;
			notifyListeners();
		}
	}
}
import 'package:bmi_calculator/res/strings.dart';

class BMICalculator {
  BMICalculator(double height, double mass)
      : _bmi = (100 * 100 * mass) / (height * height);
  double _bmi;

  String get bmi => _bmi.toStringAsFixed(1);

  String get status {
    if (_bmi < 18.5) return Strings.underweight;
    if (_bmi < 25) return Strings.normalWeight;
    return Strings.overweight;
  }

  String get message {
    if (_bmi < 18.5) return Strings.underweightMessage;
    if (_bmi < 25) return Strings.normalMessage;
    return Strings.overweightMessage;
  }
}

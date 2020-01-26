import 'dart:math';

import 'package:bmi_calculator/common/widgets/bmi_card.dart';
import 'package:bmi_calculator/common/widgets/bottom_button.dart';
import 'package:bmi_calculator/home/gender.dart';
import 'package:bmi_calculator/home/usecase/bmi_calculator.dart';
import 'package:bmi_calculator/home/widget/gender_selector.dart';
import 'package:bmi_calculator/res/app_colors.dart';
import 'package:bmi_calculator/res/routes.dart';
import 'package:bmi_calculator/res/strings.dart';
import 'package:bmi_calculator/res/text_themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _selectedGender;
  int _height = 120;
  int _weight = 65;
  int _age = 20;

  Color get _femaleBackgroundColor => _selectedGender == Gender.female
      ? AppColors.selectionColor
      : AppColors.cardColor;

  Color get _maleBackgroundColor => _selectedGender == Gender.male
      ? AppColors.selectionColor
      : AppColors.cardColor;

  void _selectGender(Gender gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appName,
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BMICard(
                  backgroundColor: _femaleBackgroundColor,
                  callback: () => _selectGender(Gender.female),
                  child: GenderSelector(Gender.female),
                ),
              ),
              Expanded(
                child: BMICard(
                  backgroundColor: _maleBackgroundColor,
                  callback: () => _selectGender(Gender.male),
                  child: GenderSelector(Gender.male),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: BMICard(child: _buildHeightCard())),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BMICard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.weight,
                        style: TextThemes.subtitleTheme,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        _weight.toString(),
                        style: TextThemes.measureTheme,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildRoundedButton(
                                Icons.remove,
                                () => setState(() {
                                      _weight = max(--_weight, 0);
                                    })),
                            SizedBox(
                              width: 15.0,
                            ),
                            _buildRoundedButton(
                                Icons.add,
                                () => setState(() {
                                      _weight = min(++_weight, 400);
                                    })),
                          ])
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: BMICard(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.age,
                        style: TextThemes.subtitleTheme,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        _age.toString(),
                        style: TextThemes.measureTheme,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildRoundedButton(
                                Icons.remove,
                                () => setState(() {
                                      _age = max(--_age, 1);
                                    })),
                            SizedBox(
                              width: 15.0,
                            ),
                            _buildRoundedButton(
                                Icons.add,
                                () => setState(() {
                                      _age = min(++_age, 120);
                                    })),
                          ])
                    ]),
              )),
            ],
          ),
        ),
        BottomButton(
          text: Strings.calculateBMI,
          onTap: () {
            final calculator =
                BMICalculator(_height.toDouble(), _weight.toDouble());
            Navigator.pushNamed(context, Routes.results, arguments: calculator);
          },
        ),
      ]),
    );
  }

  Widget _buildSlider() => SliderTheme(
        data: SliderThemeData().copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: AppColors.sliderInactiveTrackColor,
            thumbColor: AppColors.accentColor,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 15.0,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            overlayColor: AppColors.overlayColor),
        child: Slider(
          value: _height.toDouble(),
          min: 120.0,
          max: 220.0,
          onChanged: (newValue) => setState(() {
            _height = newValue.toInt();
          }),
        ),
      );

  Widget _buildHeightCard() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Strings.height,
            style: TextThemes.subtitleTheme,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _height.toString(),
                style: TextThemes.titleTheme,
              ),
              Text(
                Strings.measureCm,
                style: TextThemes.subtitleTheme,
              ),
            ],
          ),
          _buildSlider(),
        ],
      );

  Widget _buildRoundedButton(IconData icon, Function onTap) =>
      RawMaterialButton(
        child: Icon(
          icon,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 48.0,
          height: 48.0,
        ),
        onPressed: onTap,
        fillColor: AppColors.roundedButtonColor,
      );
}

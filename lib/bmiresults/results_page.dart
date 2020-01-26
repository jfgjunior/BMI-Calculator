import 'package:bmi_calculator/common/widgets/bmi_card.dart';
import 'package:bmi_calculator/common/widgets/bottom_button.dart';
import 'package:bmi_calculator/home/usecase/bmi_calculator.dart';
import 'package:bmi_calculator/res/strings.dart';
import 'package:bmi_calculator/res/text_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BMICalculator calculator = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: Text(
              Strings.yourResult,
              style: TextThemes.titleTheme,
            ),
          ),
          Expanded(
            child: BMICard(
              child: _buildResult(
                  calculator.status, calculator.bmi, calculator.message),
            ),
          ),
          BottomButton(
            text: Strings.reCalculate,
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget _buildResult(String status, String bmiResult, String message) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(status, style: TextThemes.subtitleTheme),
          Text(
            bmiResult,
            style: TextThemes.measureTheme.copyWith(fontSize: 60),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              message,
              style: TextThemes.contentTheme,
            ),
          )
        ],
      );
}

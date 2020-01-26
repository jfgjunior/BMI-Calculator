import 'package:bmi_calculator/res/app_colors.dart';
import 'package:bmi_calculator/res/strings.dart';
import 'package:bmi_calculator/res/text_themes.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.text});
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: TextThemes.titleTheme.copyWith(
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5,
                  fontSize: 20),
            ),
          ),
          width: double.infinity,
          height: 80.0,
        ),
      );
}

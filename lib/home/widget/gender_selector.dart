import 'package:bmi_calculator/home/gender.dart';
import 'package:bmi_calculator/res/app_colors.dart';
import 'package:bmi_calculator/res/strings.dart';
import 'package:bmi_calculator/res/text_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelector extends StatelessWidget {
  GenderSelector(this.gender);

  final Gender gender;

  IconData get _icon =>
      gender == Gender.male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus;

  String get _text => gender == Gender.male ? Strings.male : Strings.female;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _icon,
            color: AppColors.textTitleColor,
            size: 80.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(_text, style: TextThemes.subtitleTheme),
        ],
      );
}

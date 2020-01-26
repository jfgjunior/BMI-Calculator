import 'package:bmi_calculator/res/app_colors.dart';
import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  BMICard(
      {this.backgroundColor = AppColors.cardColor, this.child, this.callback});

  final Widget child;
  final Color backgroundColor;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}

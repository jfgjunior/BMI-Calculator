import 'package:bmi_calculator/home/home_page.dart';
import 'package:bmi_calculator/res/app_colors.dart';
import 'package:bmi_calculator/res/routes.dart';
import 'package:flutter/material.dart';

import 'bmiresults/results_page.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          accentColor: AppColors.accentColor,
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        routes: {
          Routes.home: (context) => HomePage(),
          Routes.results: (context) => ResultsPage(),
        },
        initialRoute: Routes.home);
  }
}

import 'package:daily_news/src/config/routes/app_routes.dart';
import 'package:daily_news/src/config/themes/app_theme.dart';
import 'package:daily_news/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}

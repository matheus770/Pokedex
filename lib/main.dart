import 'package:flutter/material.dart';
import 'package:pokedex_m/core/app_theme.dart';
import 'package:pokedex_m/pages/home_page.dart';
import 'core/app_const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: mAppTitle,
      theme: mAppTheme,
      home: HomePage(),
    );
  }
}

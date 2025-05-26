import 'package:flutter/material.dart';
import 'package:size_change/app_constants.dart';
import 'package:size_change/view/figure.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(colorScheme: AppConstants.colorScheme),
      home: const MyHomePage(title: AppConstants.appName),
    );
  }
}

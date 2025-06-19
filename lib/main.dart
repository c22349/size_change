import 'package:flutter/material.dart';
import '/app_constants.dart';
import '/view/figure.dart';
import '/view/settings_page.dart';

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
      routes: {'/settings': (context) => const SettingsPage()},
    );
  }
}

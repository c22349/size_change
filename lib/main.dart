import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import '/app_constants.dart';
import '/view/figure.dart';
import '/view/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 画面の向きを縦向きに固定
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // SettingModelの初期化
  final settingModel = SettingModel();
  await settingModel.init();

  runApp(MyApp(settingModel: settingModel));
}

class MyApp extends StatelessWidget {
  final SettingModel settingModel;  
  const MyApp({super.key, required this.settingModel});
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

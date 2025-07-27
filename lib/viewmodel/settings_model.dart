import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'dart:io';

class SettingModel with ChangeNotifier {
  bool _soundEnabled = true;
  Locale _currentLocale = const Locale('ja', '');

  // 初期化メソッド
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _soundEnabled = prefs.getBool('soundEnabled') ?? true;
    String? savedLanguageCode = prefs.getString('language');
    if (savedLanguageCode != null) {
      _currentLocale = Locale(savedLanguageCode, '');
    }
    notifyListeners();
  }

  // ゲッター
  bool get soundEnabled => _soundEnabled;
  Locale get currentLocale => _currentLocale;

  // サウンド設定の更新
  void updateSoundSetting(bool isEnabled) {
    _soundEnabled = isEnabled;
    notifyListeners();
  }

  // サウンド設定の保存
  Future<void> setSoundEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundEnabled', value);
    _soundEnabled = value;
    notifyListeners();
  }

  // 言語設定の保存
  Future<void> setLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    _currentLocale = Locale(languageCode, '');
    notifyListeners();
  }
}

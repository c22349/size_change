import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'dart:io';

class SettingModel with ChangeNotifier {
  // 初期値
  final _settingModel = SettingModel();

  // 設定の取得
  Future<SettingModel> getSetting() async {
    final prefs = await SharedPreferences.getInstance();
    final setting = SettingModel.fromJson(prefs.getString("setting") ?? "{}");
    return setting;
  }

  // アプリ起動時に呼び出すメソッド
  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString('language');
    Locale deviceLocale = getDeviceLocale();
    String defaultLanguageCode =
        deviceLocale.languageCode == 'ja' ? 'ja' : 'en';
    _currentLocale = Locale(savedLanguageCode ?? defaultLanguageCode, '');
    notifyListeners();
    _soundEnabled = prefs.getBool('soundEnabled') ?? true;
  }

  void updateSoundSetting(bool isEnabled) {
    _soundEnabled = isEnabled;
    notifyListeners();
  }

  void setSoundEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundEnabled', value);
    _soundEnabled = value;
    notifyListeners();
  }
}

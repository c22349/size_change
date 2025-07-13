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
}

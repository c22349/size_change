import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('設定'),
        centerTitle: true,
        backgroundColor: const Color(0xFFEEEDF3),
      ),
      body: const Center(child: Text('設定画面', style: TextStyle(fontSize: 24))),
      backgroundColor: const Color(0xFFEEEDF3),
    );
  }
}

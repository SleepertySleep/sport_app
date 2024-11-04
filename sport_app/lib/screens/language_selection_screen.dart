import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  LanguageSelectionScreen({required this.onLocaleChange});

  Future<Map<String, dynamic>> _loadLanguage(String code) async {
    final String response =
        await rootBundle.loadString('assets/languages/$code.json');
    return json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                onLocaleChange(Locale('en'));
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () async {
                onLocaleChange(Locale('ru'));
              },
              child: Text('Русский'),
            ),
          ],
        ),
      ),
    );
  }
}

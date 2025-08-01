import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _emailsKey = 'emails';
  static const String _rememberKey = 'is_remembered';

  static Future<void> saveEmails(Map<String, String> emails) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(emails);
    await prefs.setString(_emailsKey, jsonString);
  }

  static Future<Map<String, String>> loadEmails() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_emailsKey);
    if (jsonString == null) return {};
    Map<String, dynamic> map = jsonDecode(jsonString);
    return map.map((key, value) => MapEntry(key, value.toString()));
  }

  static Future<void> saveRemembered(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberKey, value);
  }

  static Future<bool> loadRemembered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberKey) ?? false;
  }
}

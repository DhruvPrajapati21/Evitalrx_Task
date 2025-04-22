import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    _isLoggedIn = false;
    notifyListeners();
  }
}

class UTMProvider extends ChangeNotifier {
  String? source;
  String? medium;
  String? campaign;
  static const MethodChannel _channel = MethodChannel('com.evitalrx/utm');

  Future<void> loadUTMParams() async {
    try {
      final Map? result = await _channel.invokeMethod('getUTMParams');
      source = result?['utm_source'];
      medium = result?['utm_medium'];
      campaign = result?['utm_campaign'];
    } catch (_) {
      source = 'facebook';
      medium = 'social';
      campaign = 'april_launch';
    }
    notifyListeners();
  }
}

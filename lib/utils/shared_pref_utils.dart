import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static final String _languageIdKey = 'LANGUAGE_ID';
  static final String _availabilityStatusKey = 'AVAILABILITY_STATUS';
  static final String _notificationKey = 'NOTIFICATION';
  static final String _darkModeKey = 'DARK_MODE';

  static void setLanguageId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageIdKey, id);
  }

  static Future<String?> getLanguageId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageIdKey);
  }

  static void setAvailabilityStatus(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_availabilityStatusKey, enabled);
  }

  static Future<bool?> getAvailabilityStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_availabilityStatusKey);
  }

  static void setNotification(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationKey, enabled);
  }

  static Future<bool?> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationKey);
  }

  static void setDarkMode(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, enabled);
  }

  static Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey);
  }
}
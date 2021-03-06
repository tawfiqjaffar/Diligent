import 'package:shared_preferences/shared_preferences.dart';

enum Storage {
  profileImage,
  isLoggedIn,
  userName,
}

extension StorageKeys on Storage {
  String get value {
    switch (this) {
      case Storage.profileImage:
        return 'PROFILE_IMAGE';
      case Storage.userName:
        return 'USER_NAME';
      case Storage.isLoggedIn:
        return 'IS_LOGGEd_IN';
      default:
        return 'UNKNOWN';
    }
  }
}

class UserDefaults {
  static SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  // setters
  static Future<bool> setString(Storage key, String value) async {
    return await _prefs.setString(key.value, value);
  }

  static Future<bool> setBool(Storage key, bool value) async {
    return await _prefs.setBool(key.value, value);
  }

  // getters
  static String getString(Storage key) {
    return _prefs.getString(key.value);
  }

  static bool getBool(Storage key) {
    return _prefs.getBool(key.value);
  }
}

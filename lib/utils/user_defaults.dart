import 'package:shared_preferences/shared_preferences.dart';

enum Storage {
  profileImage,
  isLoggedIn,
  userName,
  projects,
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
      case Storage.projects:
        return 'PROJECTS';
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

  static Future<bool> setStringList(Storage key, List<String> value) async {
    return await _prefs.setStringList(key.value, value);
  }

  // getters
  static String getString(Storage key) {
    return _prefs.getString(key.value);
  }

  static bool getBool(Storage key) {
    return _prefs.getBool(key.value);
  }

  static List<String> getStringList(Storage key) {
    var result = _prefs.getStringList(key.value);

    if (result == null) {
      return [];
    }

    return result;
  }

  // remove

  static Future<bool> remove(Storage key) {
    return _prefs.remove(key.value);
  }
}

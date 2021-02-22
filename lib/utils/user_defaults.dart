import 'package:shared_preferences/shared_preferences.dart';

enum Storage {
  profileImage,
}

extension StorageKeys on Storage {
  String get value {
    switch (this) {
      case Storage.profileImage:
        return 'PROFILE_IMAGE';
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

  // getters
  static String getString(Storage key) {
    return _prefs.getString(key.value);
  }
}

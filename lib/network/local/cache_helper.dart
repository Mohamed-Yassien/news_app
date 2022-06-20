import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setModeBoolean({
    required String key,
    required bool value ,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static getModeBoolean({required String key}) {
    return sharedPreferences.getBool(key) ?? false;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesRepository {
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);
}


class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;

  SharedPreferencesRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> saveString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return sharedPreferences.getString(key);
  }
}

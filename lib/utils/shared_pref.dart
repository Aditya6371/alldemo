import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  const SharedPref._();

  // Save Data
  Future<bool> setValue(dynamic value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (value.runtimeType) {
      case bool:
        return await prefs.setBool(key, value);
      case double:
        return await prefs.setDouble(key, value);
      case int:
        return await prefs.setInt(key, value);
      case String:
        return await prefs.setString(key, value);
      case const (List<String>):
        return await prefs.setStringList(key, value);
      default:
        throw ArgumentError("Invalid data type");
    }
  }

  // Read Data
  Future<bool> getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<int> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  Future<double> getDoubleValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  Future<String> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<List<String>> getStringListValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  // Delete Data
  Future<void> removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

import 'package:alldemo/Enum/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  const SharedPref._();

  // Save Data
  Future<bool> saveData(dynamic value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (value.type) {
      case DataType.boolType:
        return await prefs.setBool(key, value);
      case DataType.doubleType:
        return await prefs.setDouble(key, value);
      case DataType.intType:
        return await prefs.setInt(key, value);
      case DataType.stringType:
        return await prefs.setString(key, value);
      case DataType.listType:
        return await prefs.setStringList(key, value);
      default:
        throw ArgumentError("Invalid Error");
    }
  }

  // Read Data
  Future<bool> getUserBoolData(String prefkey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(prefkey) ?? false;
  }
  
  Future<int> getUserIntData(String prefkey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(prefkey) ?? 0;
  }

  Future<double> getUserDoubleData(String prefkey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(prefkey) ?? 0.0;
  }

  Future<String> getUserStringData(String prefkey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(prefkey) ?? "";
  }

  Future<List> getUserListData(String prefkey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(prefkey) ?? [];
  }

  //Delete Data
  Future<void> removeUserData(String prefKey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(prefKey);
  }
}

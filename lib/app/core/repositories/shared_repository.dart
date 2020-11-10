import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/shared_repository_interface.dart';

class SharedRepository implements ISharesRepositoryInterface {
  @override
  Future<dynamic> getValue<T>(String key) async {
    return await setInstance().then((sharesPreferences) {
      switch (T) {
        case double:
          return sharesPreferences.getDouble(key) ?? 0;
          break;
        case int:
          return sharesPreferences.getInt(key) ?? 0;
          break;
        case String:
          return sharesPreferences.getString(key) ?? '';
          break;
        case List:
          return sharesPreferences.getStringList(key) ?? [];
          break;
        case bool:
          return sharesPreferences.getBool(key) ?? false;
          break;
        default:
          return sharesPreferences.getString(key) ?? '';
      }
    });
  }

  @override
  Future<SharedPreferences> setInstance() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setValue<T>(String key, dynamic value) async {
    return await setInstance().then((sharesPreferences) {
      switch (T) {
        case double:
          return sharesPreferences.setDouble(key, value);
          break;
        case int:
          return sharesPreferences.setInt(key, value);
          break;
        case String:
          return sharesPreferences.setString(key, value);
          break;
        case List:
          return sharesPreferences.setStringList(key, value);
          break;
        case bool:
          return sharesPreferences.setBool(key, value);
          break;
        default:
          return sharesPreferences.setString(key, value);
      }
    });
  }
}

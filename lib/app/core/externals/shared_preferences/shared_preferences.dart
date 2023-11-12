import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPreferences {
  Future<SharedPreferences> initInstance();
  AsyncResult<bool, Exception> deleteAll();
  AsyncResult<bool, Exception> saveString(String key, String value);
  AsyncResult<String, Exception> getString(String key);
}

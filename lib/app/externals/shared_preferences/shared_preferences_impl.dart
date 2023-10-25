import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements ISharedPreferences {
  late SharedPreferences _sp;

  SharedPreferencesImpl() {
    initInstance();
  }

  @override
  Future<SharedPreferences> initInstance() async {
    final sp = await SharedPreferences.getInstance();
    _sp = sp;
    return sp;
  }

  @override
  AsyncResult<String, Exception> getString(String key) async {
    try {
      final response = _sp.getString(key);

      if (response == null) {
        return Exception('$runtimeType failed to get key: [$key]').toFailure();
      }

      return response.toSuccess();
    } catch (e) {
      return Exception('$runtimeType failed to get key: [$key]').toFailure();
    }
  }

  @override
  AsyncResult<bool, Exception> saveString(String key, String value) async {
    try {
      final response = await _sp.setString(key, value);

      return Success(response);
    } catch (e) {
      return Exception(
              '$runtimeType failed to save string and throws an error: $e')
          .toFailure();
    }
  }
}

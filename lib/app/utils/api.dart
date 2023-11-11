class Env {
  static const Map<String, String> _keys = {
    'BASE_API': String.fromEnvironment('BASE_API')
  };

  static String _getKey(String key) {
    final value = _keys[key] ?? '';

    if (value.isEmpty) {
      throw Exception('$key is not set in Env');
    }

    return value;
  }

  static String get apiEndpoint => _getKey('BASE_API');
  
}

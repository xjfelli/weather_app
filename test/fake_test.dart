import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be a valid fake test', () {
    const text = 'hello, im a text';

    expect(text, isA<String>());
  });
}

import 'package:test/test.dart';

const _kAnswer = 42;

void main() {
  group('A group of tests', () {
    late int universe;
    setUp(() {
      universe = 42;
    });
    test('best test ever', () {
      expect(universe, _kAnswer);
    });
  });
}

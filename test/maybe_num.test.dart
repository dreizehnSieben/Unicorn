import 'package:unicorn/maybe.dart';
import 'package:unicorn/num.dart';
import 'package:test/test.dart';

void main() {
  group('Setoid', () {
    test('reflexivity', () {
      final Maybe<num> a = Maybe.just(7);

      expect(a == a, isTrue);
      expect(a.equals(a), isTrue);
    });

    test('symmetry', () {
      final Maybe<num> a = Maybe.just(13);
      final Maybe<num> b = Maybe.just(13);

      expect(a == b, equals(b == a));
      expect(a.equals(b), equals(b.equals(a)));
    });

    test('transitivity', () {
      final Maybe<num> a = Maybe.just(7);
      final Maybe<num> b = Maybe.just(7);
      final Maybe<num> c = Maybe.just(7);

      expect((a == b) & (b == c), equals(a == c));
      expect(a.equals(b) & b.equals(c), equals(a.equals(c)));
    });
  });

  group('Ord', () {
    test('totality', () {
      final Maybe<num> a = Maybe.nothing();
      final Maybe<num> b = Maybe.just(13);

      expect((a <= b) | (b <= a), isTrue);
      expect(a.lte(b) | b.lte(a), isTrue);
    });

    test('antisymmetry', () {
      final Maybe<num> a = Maybe.just(7);
      final Maybe<num> b = Maybe.just(7);

      expect((a <= b) & (b <= a), equals(a == b));
      expect(a.lte(b) & b.lte(a), equals(a.equals(b)));
    });
  });
}

import 'package:unicorn/string.dart';
import 'package:test/test.dart';

void main() {
  group('Setoid', () {
    test('reflexivity', () {
      final a = 'hi';

      expect(a == a, isTrue);
      expect(a.equals(a), isTrue);
    });

    test('symmetry', () {
      final a = 'hi';
      final b = 'hi';

      expect(a == b, equals(b == a));
      expect(a.equals(b), equals(b.equals(a)));
    });

    test('transitivity', () {
      final a = 'wtf';
      final b = 'wtf';
      final c = 'wtf';

      expect((a == b) & (b == c), equals(a == c));
      expect(a.equals(b) & b.equals(c), equals(a.equals(c)));
    });
  });

  group('Ord', () {
    test('totality', () {
      final a = 'a';
      final b = 'b';

      expect((a <= b) | (b <= a), isTrue);
      expect(a.lte(b) | b.lte(a), isTrue);
    });

    test('antisymmetry', () {
      final a = 'a';
      final b = 'a';

      expect((a <= b) & (b <= a), equals(a == b));
      expect(a.lte(b) & b.lte(a), equals(a.equals(b)));
    });

    test('transitivity', () {
      final a = 'a';
      final b = 'b';
      final c = 'c';

      expect((a <= b) & (b <= c), equals(a <= c));
      expect(a.lte(b) & b.lte(c), equals(a.lte(c)));
    });

    test('compareTo()', () {
      final a = 'a';
      final b = 'b';

      expect(a.compareTo(a) == 0, isTrue);
      expect(a.compareTo(b) < 0, isTrue);
      expect(b.compareTo(a) > 0, isTrue);
    });
  });

  group('Semigroup', () {
    test('associativity', () {
      final a = 'a';
      final b = 'b';
      final c = 'c';

      final lhs1 = a + b + c;
      final rhs1 = a + (b + c);

      expect(lhs1, equals(rhs1));

      final lhs2 = a.concat(b).concat(c);
      final rhs2 = a.concat(b.concat(c));

      expect(lhs2, equals(rhs2));
    });
  });

  group('Monoid', () {
    test('right identity', () {
      expect('a'.concat(StringMonoid.empty), equals('a'));
    });

    test('left identity', () {
      expect(StringMonoid.empty.concat('a'), equals('a'));
    });
  });
}

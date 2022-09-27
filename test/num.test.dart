import 'package:unicorn/num.dart';
import 'package:test/test.dart';

void main() {
  group('Setoid', () {
    test('reflexivity', () {
      final a = 7;

      expect(a == a, isTrue);
      expect(a.equals(a), isTrue);
    });

    test('symmetry', () {
      final a = 7;
      final b = 7;

      expect(a == b, equals(b == a));
      expect(a.equals(b), equals(b.equals(a)));
    });

    test('transitivity', () {
      final a = 7.0;
      final b = 7.0;
      final c = 7.0;

      expect((a == b) & (b == c), equals(a == c));
      expect(a.equals(b) & b.equals(c), equals(a.equals(c)));
    });
  });

  group('Ord', () {
    test('totality', () {
      final a = 7;
      final b = 13;

      expect((a <= b) | (b <= a), isTrue);
      expect(a.lte(b) | b.lte(a), isTrue);
    });

    test('antisymmetry', () {
      final a = 7.0;
      final b = 7.0;

      expect((a <= b) & (b <= a), equals(a == b));
      expect(a.lte(b) & b.lte(a), equals(a.equals(b)));
    });

    test('transitivity', () {
      final a = 7;
      final b = 13;
      final c = 42.0;

      expect((a <= b) & (b <= c), equals(a <= c));
      expect(a.lte(b) & b.lte(c), equals(a.lte(c)));
    });

    test('compareTo()', () {
      final a = 7;
      final b = 13.5;

      expect(a.compareTo(a) == 0, isTrue);
      expect(a.compareTo(b) < 0, isTrue);
      expect(b.compareTo(a) > 0, isTrue);
    });
  });

  group('Semigroup', () {
    test('associativity', () {
      final a = 7;
      final b = 13;
      final c = 42;

      final lhs1 = a + b + c;
      final rhs1 = a + (b + c);

      expect(lhs1 == rhs1, isTrue);

      final lhs2 = a.concat(b).concat(c);
      final rhs2 = a.concat(b.concat(c));

      expect(lhs2, equals(rhs2));
    });
  });

  group('Monoid', () {
    test('right identity', () {
      expect(7.concat(NumMonoid.empty), equals(7));
    });

    test('left identity', () {
      expect(NumMonoid.empty.concat(7), equals(7));
    });
  });

  group('Group', () {
    test('right inverse', () {
      final n = 7;
      expect(n.concat(n.invert()), equals(NumMonoid.empty));
    });

    test('left inverse', () {
      final n = 42.5;
      expect(n.invert().concat(n), equals(NumMonoid.empty));
    });
  });
}

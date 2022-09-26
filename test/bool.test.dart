import 'package:unicorn/unicorn.dart';
import 'package:test/test.dart';

void main() {
  group('Setoid', () {
    test('reflexivity', () {
      const a = false;
      const b = true;

      expect(a == a, isTrue);
      expect(a.equals(a), isTrue);

      expect(b == b, isTrue);
      expect(b.equals(b), isTrue);
    });

    test('symmetry', () {
      const a = false;
      const b = false;

      expect(a == b, equals(b == a));
      expect(a.equals(b), equals(b.equals(a)));
    });

    test('transitivity', () {
      const a = false;
      const b = false;
      const c = false;

      expect((a == b) && (b == c), equals(a == c));
      expect(a.equals(b) && b.equals(c), equals(a.equals(c)));
    });
  });

  group('Ord', () {
    test('totality', () {
      const a = false;
      const b = true;

      expect((a <= b) || (b <= a), isTrue);
      expect(a.lte(b) || b.lte(a), isTrue);
    });

    test('antisymmetry', () {
      const a = false;
      const b = false;

      expect((a <= b) && (b <= a), equals(a == b));
      expect(a.lte(b) && b.lte(a), equals(a.equals(b)));
    });

    test('transitivity', () {
      const a = false;
      const b = false;
      const c = true;

      expect((a <= b) && (b <= c), equals(a <= c));
      expect(a.lte(b) && b.lte(c), equals(a.lte(c)));
    });
  });
}

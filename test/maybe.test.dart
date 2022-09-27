import 'package:unicorn/maybe.dart';
import 'package:test/test.dart';

void main() {
  test('type predicates', () {
    final Maybe<String> a = Maybe.just('a');
    final Maybe<String> b = Maybe.nothing();

    expect(a.isJust, isTrue);
    expect(a.isNothing, isFalse);

    expect(b.isJust, isFalse);
    expect(b.isNothing, isTrue);
  });

  test('pattern matching', () {
    final Maybe<num> n = Maybe.nothing();
    final Maybe<num> j = Maybe.just(13);

    num id(num value) => value;
    num empty() => 0;

    var result1 = n.match(onJust: id, onNothing: empty);
    var result2 = j.match(onJust: id, onNothing: empty);

    expect(result1, equals(0));
    expect(result2, equals(13));
  });
}

import './maybe.dart';

extension Setoid on num {
  bool equals(num other) => this == other;
}

extension Ord on num {
  bool lte(num other) => this <= other;
}

extension Semigroup on num {
  num concat(num other) => this + other;
}

extension Monoid on num {
  static num get empty => 0;
}

extension Group on num {
  num invert() => -this;
}

extension MaybeSetoid on Maybe<num> {
  bool equals(Maybe<num> other) => match(
        onJust: (value) => other.match(
          onJust: (otherValue) => value.equals(otherValue),
          onNothing: () => false,
        ),
        onNothing: () => other.isNothing,
      );
}

extension MaybeOrd on Maybe<num> {
  bool operator <=(Maybe<num> other) => match(
        onJust: (value) => other.match(
          onJust: (otherValue) => value <= otherValue,
          onNothing: () => false,
        ),
        onNothing: () => true,
      );

  bool lte(Maybe<num> other) => this <= other;

  int compareTo(Maybe<num> other) => match(
        onJust: (value) => other.match(
          onJust: (otherValue) => value.compareTo(otherValue),
          onNothing: () => 1,
        ),
        onNothing: () => other.isNothing ? 0 : -1,
      );
}

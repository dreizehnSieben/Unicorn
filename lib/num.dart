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

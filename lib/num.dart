extension NumSetoid on num {
  bool equals(num other) => this == other;
}

extension NumOrd on num {
  bool lte(num other) => this <= other;
}

extension NumSemigroup on num {
  num concat(num other) => this + other;
}

extension NumMonoid on num {
  static num get empty => 0;
}

extension NumGroup on num {
  num invert() => -this;
}

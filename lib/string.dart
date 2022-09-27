extension Setoid on String {
  bool equals(String other) => this == other;
}

extension Ord on String {
  bool operator <=(String other) => compareTo(other) <= 0;

  bool lte(String other) => this <= other;
}

extension Semigroup on String {
  String concat(String other) => this + other;
}

extension Monoid on String {
  static String get empty => '';
}

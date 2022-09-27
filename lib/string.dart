extension StringSetoid on String {
  bool equals(String other) => this == other;
}

extension StringOrd on String {
  bool operator <=(String other) => compareTo(other) <= 0;

  bool lte(String other) => this <= other;
}

extension StringSemigroup on String {
  String concat(String other) => this + other;
}

extension StringMonoid on String {
  static String get empty => '';
}

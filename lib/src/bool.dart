extension SetoidBool on bool {
  bool equals(bool other) => this == other;
}

extension OrdBool on bool {
  bool operator <=(bool other) => !this | other;

  bool lte(bool other) => this <= other;

  int compareTo(bool other) {
    if (equals(other)) return 0;
    if (lte(other)) return -1;
    return 1;
  }
}

extension SemigroupBool on bool {
  bool operator +(bool other) => this | other;

  bool concat(bool other) => this + other;
}

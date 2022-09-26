import './ordering.dart';

extension SetoidBool on bool {
  bool equals(bool other) => this == other;
}

extension OrdBool on bool {
  bool operator <=(bool other) => !this || other;

  bool lte(bool other) => this <= other;
}

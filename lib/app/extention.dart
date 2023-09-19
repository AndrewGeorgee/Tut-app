import 'constance.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constant.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constant.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double dorZero() {
    if (this == null) {
      return Constant.dzero;
    } else {
      return this!;
    }
  }
}

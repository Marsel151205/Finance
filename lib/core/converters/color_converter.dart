import 'dart:ui';

import 'package:drift/drift.dart';

class ColorConverter extends TypeConverter<Color, int> {
  @override
  Color fromSql(int fromDb) {
    return Color(fromDb);
  }

  @override
  int toSql(Color value) {
    return value.toARGB32();
  }
}

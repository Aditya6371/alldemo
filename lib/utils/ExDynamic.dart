import 'package:alldemo/Enum/enum.dart';

extension DynamicTypeExtension on dynamic {
  DataType get type {
    if (this is int) {
      return DataType.intType;
    } else if (this is bool) {
      return DataType.boolType;
    } else if (this is double) {
      return DataType.doubleType;
    } else if (this is String) {
      return DataType.stringType;
    } else {
      return DataType.listType;
    }
  }
}

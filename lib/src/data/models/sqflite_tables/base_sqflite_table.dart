import 'package:base_quick/src/common/sqflite_constants.dart';

class BaseSqfLiteTable {
  String id;

  BaseSqfLiteTable(this.id);

  BaseSqfLiteTable.fromJson(Map map) : id = map[SqfLiteConstants.id];

  Map<String, dynamic> toJson() {
    return {
      SqfLiteConstants.id: id,
    };
  }
}

import 'package:base_quick/src/data/models/sqflite_tables/base_sqflite_table.dart';

class ProvinceTable extends BaseSqfLiteTable {
  late String name;

  ProvinceTable(
    String id, {
    required this.name,
  }) : super(id);

  ProvinceTable.fromJson(Map json) : super.fromJson(json) {
    name = json["name"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['name'] = name;
    return data;
  }
}

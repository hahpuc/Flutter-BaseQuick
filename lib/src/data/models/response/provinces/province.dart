import 'package:base_quick/src/data/models/sqflite_tables/province_table.dart';

class Province {
  String? name;
  String? id;

  Province(
    String id, {
    required this.name,
  });

  Province.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Province.fromDb(ProvinceTable provinceTable) {
    name = provinceTable.name;
    id = provinceTable.id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  ProvinceTable mapToProvinceTable() {
    return ProvinceTable(
      id!,
      name: name!,
    );
  }
}

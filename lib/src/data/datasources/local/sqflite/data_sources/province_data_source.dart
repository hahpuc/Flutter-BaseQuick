import 'package:base_quick/src/common/sqflite_constants.dart';
import 'package:base_quick/src/data/datasources/local/sqflite/base_sqflite_data_source.dart';
import 'package:base_quick/src/data/models/sqflite_tables/province_table.dart';
import 'package:sqflite/sqflite.dart';

class ProvinceDataSource extends BaseSqfLiteDataSource<ProvinceTable> {
  final Database database;

  ProvinceDataSource(this.database)
      : super(
          db: database,
          tableName: SqfLiteConstants.provinceTable,
          fromSqfLite: (Map json) => ProvinceTable.fromJson(json),
        );
}

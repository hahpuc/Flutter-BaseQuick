import 'dart:developer';

import 'package:base_quick/src/common/sqflite_constants.dart';
import 'package:base_quick/src/data/models/sqflite_tables/base_sqflite_table.dart';
import 'package:sqflite/sqflite.dart';

typedef FromSqfLite<T> = T Function(
  Map data,
);

class BaseSqfLiteDataSource<T extends BaseSqfLiteTable> {
  final Database db;
  final String tableName;
  final FromSqfLite<T> fromSqfLite;

  BaseSqfLiteDataSource({
    required this.db,
    required this.tableName,
    required this.fromSqfLite,
  });

  Future<List<T>> getAll() async {
    log('---------> Get All from SQLite $tableName');
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return fromSqfLite(maps[i]);
    });
  }

  Future<T> add(T row) async {
    var result = await db.insert(tableName, row.toJson());
    log('---------> Add to SQLite $tableName Result: $result');
    return row;
  }

  Future<T?> getOne(String id) async {
    List<Map> maps = await db.query(
      tableName,
      where: '${SqfLiteConstants.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return fromSqfLite(maps.first);
    }
    return null;
  }

  Future<int> delete(String id) async {
    return await db.delete(
      tableName,
      where: '${SqfLiteConstants.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(T row) async {
    log('---------> Update Data of $tableName SQLite with data ${row.toJson()}');
    return await db.update(
      tableName,
      row.toJson(),
      where: '${SqfLiteConstants.id} = ?',
      whereArgs: [row.id],
    );
  }

  Future<List<Map>> deleteAll() async {
    log('---------> Delete All Data of $tableName SQLite');
    return await db.rawQuery('Delete from $tableName');
  }
}

import 'dart:developer';

import 'package:base_quick/src/common/sqflite_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataSourceInitializer {
  static final LocalDataSourceInitializer _singleton =
      LocalDataSourceInitializer._internal();

  factory LocalDataSourceInitializer() {
    return _singleton;
  }

  LocalDataSourceInitializer._internal();

  late final Database database;

  // MIGRATION Database
  createTable(Database db) async {
    await db
        .execute('DROP TABLE IF EXISTS `${SqfLiteConstants.provinceTable}`');
    await db.execute('''
		create table ${SqfLiteConstants.provinceTable} (
				${SqfLiteConstants.id} text primary key,
				name text not null);
	''');

    // await db.execute('DROP TABLE IF EXISTS `${SqfLiteConstants.outletTable}`');
    // await db.execute('''
    // 	create table ${SqfLiteConstants.outletTable} (
    // 			${SqfLiteConstants.id} text primary key,
    // 			name text not null);
    // ''');
  }

  Future<Database> openDatabaseConnection() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '${SqfLiteConstants.database}.db');

    // Open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);

      log('---------------------> On Created Database <---------------------');
    }, onUpgrade: (db, ___, __) async {
      log('---------------------> On Upgrade Database <---------------------');

      await createTable(db);
    });
    return database;
  }

  Future<void> closeDatabaseConnection() async {
    return database.close();
  }

  //------------------------- MIGRATION -------------------------//

  // Example Code for Migration Database
  // Maybe use for The Next Version

//   // Update Record Ver1 -> Ver2
//   Future<void> updateTableVersion2(Database db) async {
//     await db.execute(
//         'ALTER TABLE ${SqfLiteConstants.recordTable} ADD longtest TEXT');
//   }

//   // Create New Table version 2
//   Future<void> createNewTableVersion2(Database db) async {
//     await db.execute('DROP TABLE IF EXISTS Test');
//     await db.execute('''
// 		create table Test (
// 				${SqfLiteConstants.id} text primary key,
// 				description text not null);
// 	''');
//   }

//   Future<Database> openDatabaseConnection() async {
//     // Get a location using getDatabasesPath
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, '${SqfLiteConstants.database}.db');

//     // Open the database ver2
//     database = await openDatabase(path, version: 2,
//         onCreate: (Database db, int version) async {
//       // TODO: Update field Table of createTable() function
//       await createTable(db);

//       await createNewTableVersion2(db);

//       log('---------------------> On Created Database <---------------------');
//     }, onUpgrade: (db, oldVersion, newVersion) async {
//       log('---------------------> On Upgrade Database <---------------------');

//       if (oldVersion == 1) {
//         await updateTableVersion2(db);
//         await createNewTableVersion2(db);
//       }
//     });
//     return database;
//   }
}

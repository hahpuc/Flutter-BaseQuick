import 'package:base_quick/src/data/datasources/local/sqflite/local_data_source_initializer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalModule {
  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  static Database provideSqflite() {
    var localDB = LocalDataSourceInitializer();
    return localDB.database;
  }
}

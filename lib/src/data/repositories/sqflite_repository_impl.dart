import 'package:base_quick/src/data/datasources/local/sqflite/data_sources/province_data_source.dart';
import 'package:base_quick/src/data/models/response/provinces/province.dart';
import 'package:base_quick/src/domain/repositories/sqflite_repository.dart';

class SqfliteRepositoryImpl extends SqfliteRepository {
  final ProvinceDataSource _provinceDataSource;

  SqfliteRepositoryImpl(this._provinceDataSource);

  @override
  Future<List<Province>> getProvinces() async {
    var provinceDB = await _provinceDataSource.getAll();

    return provinceDB.map((e) => Province.fromDb(e)).toList();
  }

  @override
  Future saveProvinces(List<Province> provinces) async {
    for (var province in provinces) {
      await _provinceDataSource.add(province.mapToProvinceTable());
    }
  }
}

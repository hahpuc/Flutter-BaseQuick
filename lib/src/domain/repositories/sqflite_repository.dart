import 'package:base_quick/src/data/models/response/provinces/province.dart';

abstract class SqfliteRepository {
  Future saveProvinces(List<Province> provinces);
  Future<List<Province>> getProvinces();
}

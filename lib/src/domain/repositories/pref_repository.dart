abstract class PrefRepository {
  String? getLocale();
  Future<void> setStringLocale(String value);
}

import '../../domain/repositories/pref_repository.dart';

import '../datasources/local/pref/pref_helper.dart';

class PrefRepositoryImpl extends PrefRepository {
  final PrefHelper prefHelper;

  PrefRepositoryImpl(this.prefHelper);

  @override
  String? getLocale() {
    return prefHelper.getString(PrefKeys.locale);
  }

  @override
  Future<void> setStringLocale(String value) {
    return prefHelper.setString(PrefKeys.locale, value);
  }
}

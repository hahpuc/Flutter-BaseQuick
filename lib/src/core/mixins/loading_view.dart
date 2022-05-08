import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin LoadingViewMixin {
  void showLoading() {
    EasyLoading.show(maskType: EasyLoadingMaskType.custom);
  }

  void dismissLoading() {
    EasyLoading.dismiss();
  }

  void showError(String? message) {
    EasyLoading.showError(message ?? "Unexpected error occurred");
  }

  void showSuccess(String? message) {
    EasyLoading.showSuccess(message ?? "Success");
  }
}

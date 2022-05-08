import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  final Dio _dio;

  RefreshTokenInterceptor(this._dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // if (response.statusCode == 401) {

    // var refreshToken = injector.get<PrefRepository>().getToken();

    // }

    handler.next(response);
  }
}

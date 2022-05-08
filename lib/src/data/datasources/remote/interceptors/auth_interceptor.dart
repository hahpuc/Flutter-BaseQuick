import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //API KEY
    var token = 'Long Token';

    options.headers.putIfAbsent('Authorization', () => "Bearer " + token);

    return handler.next(options);
  }
}

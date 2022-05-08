import 'dart:developer';

import 'package:dio/dio.dart';

class AppLogInterceptor extends Interceptor {
  AppLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  void logPrint(Object object) {
    logData('$object');
  }

  // Blue text
  void logInfo(String msg) {
    log('\x1B[34m$msg\x1B[0m');
  }

  // Blue text
  void logSuccess(String msg) {
    log('\x1B[36m$msg\x1B[0m');
  }

  // Yellow text
  void logData(String msg) {
    log('\x1B[33m$msg\x1B[0m');
  }

  // Red text
  void logError(String msg) {
    log('\x1B[31m$msg\x1B[0m');
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logInfo('*** Request ***');
    _printKV('uri', options.uri);
    //options.headers;

    if (request) {
      _printKV('method', options.method);
      _printKV('responseType', options.responseType.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('connectTimeout', options.connectTimeout);
      _printKV('sendTimeout', options.sendTimeout);
      _printKV('receiveTimeout', options.receiveTimeout);
      _printKV(
          'receiveDataWhenStatusError', options.receiveDataWhenStatusError);
      _printKV('extra', options.extra);
    }
    if (requestHeader) {
      logInfo('headers:');
      options.headers.forEach((key, v) => _printKV(' $key', v));
    }
    if (requestBody) {
      logInfo('data:');
      _printAll(options.data);
    }
    logInfo('');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logInfo('*** Response ***');
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      logError('*** DioError ***:');
      logError('uri: ${err.requestOptions.uri}');
      logError('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logError('');
    }

    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      logSuccess('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    }
    if (responseBody) {
      logInfo('Response Text:');
      _printAll(response.toString());
    }
    logSuccess('');
  }

  void _printKV(String key, Object? v) {
    logSuccess('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}

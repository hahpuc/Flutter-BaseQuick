import 'dart:developer';
import '/src/data/datasources/remote/interceptors/refresh_token_interceptor.dart';
import '/src/injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../common/constants.dart';
import '../../../common/flavors.dart';
import '../../../core/exception/network_exception.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/log_interceptor.dart';

// Singleton instance of Dio
class DioHelper {
  final Dio _dio = Dio();

  DioHelper() {
    _dio
      ..options.baseUrl = FlavorConfig.instance.values.appUrl
      ..options.connectTimeout = AppConstants.timeOut
      ..options.receiveTimeout = AppConstants.timeOut
      ..options.headers = {
        'Content-Type': 'application/json',
      }
      //   ..interceptors.add(RefreshTokenInterceptor(_dio))
      ..interceptors.add(AuthInterceptor());

    //
    // => IF wanna parse data of error api response
    //
    //   ..options.validateStatus = (status) => true;

    if (kDebugMode) {
      _dio.interceptors.add(AppLogInterceptor());
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        // Handle Error
        String message = response.data['message'];
        String errorCode = response.data['errorCode'];
        throw NetworkException(message,
            errorCode: errorCode, statusCode: response.statusCode);
      }
    } catch (e) {
      // Log with Red text
      log('\x1B[31m${e.toString()}\x1B[0m');
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        // Handle Error
        String message = response.data['message'];
        String errorCode = response.data['errorCode'];
        throw NetworkException(message,
            errorCode: errorCode, statusCode: response.statusCode);
      }
    } catch (e) {
      // Log with Red text
      log('\x1B[31m${e.toString()}\x1B[0m');
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        // Handle Error
        String message = response.data['message'];
        String errorCode = response.data['errorCode'];
        throw NetworkException(message,
            errorCode: errorCode, statusCode: response.statusCode);
      }
    } catch (e) {
      // Log with Red text
      log('\x1B[31m${e.toString()}\x1B[0m');
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        // Handle Error
        String message = response.data['message'];
        String errorCode = response.data['errorCode'];
        throw NetworkException(message,
            errorCode: errorCode, statusCode: response.statusCode);
      }
    } catch (e) {
      // Log with Red text
      log('\x1B[31m${e.toString()}\x1B[0m');
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// DioClient class is used to make API calls using Dio package.
class DioClient {
  final Dio _dio = Dio();

  /// Constructor for the DioClient class.
  DioClient() {
    if (kDebugMode) {
      // print the api call log data
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }
  }

  /// This method is used to get the instance of Dio.
  Dio get instance => _dio;
}

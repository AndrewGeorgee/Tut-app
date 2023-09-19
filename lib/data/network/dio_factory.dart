// ignore_for_file: unused_local_variable, constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_api/app/app_prefs.dart';
import 'package:learn_api/app/constance.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 10000;

    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: language
    };
    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      headers: headers,
      connectTimeout: Duration(
        milliseconds: _timeOut,
      ),
      receiveTimeout: Duration(
        milliseconds: _timeOut,
      ),
      sendTimeout: Duration(milliseconds: _timeOut),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
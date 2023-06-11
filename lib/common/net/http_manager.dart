import 'package:dio/dio.dart';

import 'dart:collection';

import 'code.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';
import 'result_data.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static final Dio _dio = Dio(); // 使用默认配置

  final TokenInterceptors _tokenInterceptors = TokenInterceptors();

  HttpManager() {
    _dio.interceptors.add(HeaderInterceptors());

    _dio.interceptors.add(_tokenInterceptors);

    _dio.interceptors.add(LogsInterceptors());

    _dio.interceptors.add(ErrorInterceptors(_dio));

    _dio.interceptors.add(ResponseInterceptors());
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  netFetch(url, params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = HashMap();
    headers.addAll(header);

    // if (option != null) {
    option.headers = headers;
    // } else {
    //   option = Options(method: "get");
    //   option.headers = headers;
    // }

    resultError(DioException e) {
      Response? errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      }
      // else {
      // errorResponse = Response(statusCode: 666, requestOptions: _dio.RequestOptions.);
      // }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        errorResponse?.statusCode = Code.NETWORK_TIMEOUT;
      }
      return ResultData(
          Code.errorHandleFunction(errorResponse?.statusCode, e.message, noTip),
          false,
          errorResponse!.statusCode!.toInt());
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioException catch (e) {
      return resultError(e);
    }
    if (response.data is DioException) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }
}

final HttpManager httpManager = HttpManager();


import 'package:dio/dio.dart';

import '../../config/config.dart';

/**
 * Log 拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class LogsInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Config.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Config.DEBUG) {
      print('返回参数: ' + response.toString());
    }
    return handler.next(response); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (Config.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response!.toString() ?? "");
    }
    return handler.next(err);
  }
}

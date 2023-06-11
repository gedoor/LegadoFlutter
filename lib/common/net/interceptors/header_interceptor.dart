import 'package:dio/dio.dart';

/**
 * header拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ///超时
    options.connectTimeout = Duration(seconds: 15);

    return handler.next(options);
  }
}

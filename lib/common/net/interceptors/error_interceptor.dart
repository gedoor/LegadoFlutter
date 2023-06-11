
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/**
 * 错误拦截
 * Created by guoshuyu
 * on 2019/3/23.
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return Future.value(ResultData(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
          false,
          Code.NETWORK_ERROR));
    }
    return handler.next(options);
  }
}

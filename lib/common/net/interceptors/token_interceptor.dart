
import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../local/local_storage.dart';

/**
 * Token拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class TokenInterceptors extends InterceptorsWrapper {
  late String _token;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //授权码
    if (_token == "") {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = _token;
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        await LocalStorage.save(Config.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return handler.next(response);
  }

  ///清除授权
  clearAuthorization() {
    this._token = "";
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    if (token == "") {
      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if (basic == "") {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      this._token = token;
      return token;
    }
  }
}

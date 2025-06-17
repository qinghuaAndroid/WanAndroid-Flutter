import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';

import 'http_exception.dart';
import 'request_api.dart';

/// 连接超时时间
const Duration _connectTimeout = Duration(milliseconds: 10000);

/// 接收超时时间
const Duration _receiveTimeout = Duration(milliseconds: 10000);

/// 发送超时时间
const Duration _sendTimeout = Duration(milliseconds: 10000);

typedef Success<T> = Function(T data);

typedef Fail = Function(int code, String msg);

/// @class : HttpRequest
/// @name : jhf
/// @description :请求工具
class HttpRequest {
  ///全局Dio对象
  static Dio? _dio;

  /// 创建 dio 实例对象
  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        ///提交方式：1.表单提交 2.JSON方式提交
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        // 适用于post form表单提交
        // responseType: ResponseType.json,
        validateStatus: (status) {
          /// 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: RequestApi.baseurl,
        sendTimeout: _sendTimeout,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );
      _dio = Dio(options);
      var cookieJar = CookieJar();
      _dio?.interceptors.add(CookieManager(cookieJar));
      _dio?.interceptors.add(PrettyDioLogger());
      // 重试拦截器
      _dio?.interceptors.add(
        RetryInterceptor(
          dio: _dio!,
          logPrint: print,
          // specify log function (optional)
          retries: 3,
          // retry count (optional)
          retryDelays: const [
            // set delays between retries (optional)
            Duration(seconds: 1), // wait 1 sec before first retry
            Duration(seconds: 2), // wait 2 sec before second retry
            Duration(seconds: 3), // wait 3 sec before third retry
          ],
          retryableExtraStatuses: {401},
        ),
      );
    }
    _dio?.options.contentType = isJson
        ? Headers.jsonContentType
        : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  /// 请求，返回参数为 T
  /// [method]：请求方法，Method.POST等
  /// [path]：请求地址
  /// [params]：请求参数
  /// [success]：请求成功回调
  /// [error]：请求失败回调
  static Future request<T>(
    Method method,
    String path,
    dynamic params, {
    bool isJson = false,
    Success? success,
    required Fail? fail,
  }) async {
    try {
      ///请求前先检查网络连接
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        _onError(HttpException.netError, '网络异常，请检查你的网络！', fail);
        return;
      }
      Dio dio = createInstance(isJson);
      Response response = await dio.request(
        path,
        data: params,
        options: Options(
          method: _methodValues[method],
          headers: _headerToken(),
        ),
      );
      if (success != null) {
        success(response.data);
      }
    } on DioException catch (e) {
      final NetError netError = HttpException.handleException(e);
      _onError(netError.code, netError.msg, fail);
      debugPrint("异常=====>$e");
    }
  }
}

/// 请求时添加cookie
Map<String, dynamic>? _headerToken() {
  /// 自定义Header,如需要添加token信息请调用此参数
  UserEntity? info = SpUtil.getUserInfo();
  if (info == null) {
    return null;
  }
  Map<String, dynamic> httpHeaders = {
    'Cookie':
        'loginUserName=${info.username};loginUserPassword=${info.password}',
  };
  return httpHeaders;
}

/// 错误回调
/// [code] 错误代码
/// [msg] 错误信息
/// [fail] 错误回调
void _onError(int code, String msg, Fail? fail) {
  if (code == 0) {
    code = HttpException.unknownError;
    msg = '未知异常';
  }
  if (fail != null) {
    fail(code, msg);
  }
}

///请求类型枚举
enum Method { get, post, delete, put, patch, head }

///请求类型值
const _methodValues = {
  Method.get: "get",
  Method.post: "post",
  Method.delete: "delete",
  Method.put: "put",
  Method.patch: "patch",
  Method.head: "head",
};

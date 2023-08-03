import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan_android_flutter/http/http_exception.dart';
import 'package:wan_android_flutter/http/request_api.dart';

/// 连接超时时间
const Duration _connectTimeout = Duration(milliseconds: 10000);

/// 接收超时时间
const Duration _receiveTimeout = Duration(milliseconds: 10000);

/// 发送超时时间
const Duration _sendTimeout = Duration(milliseconds: 10000);

typedef Success<T> = Function(T data);

typedef Fail = Function(int code, String msg);

class HttpRequest {
  ///全局Dia对象
  static Dio? _dio;

  static PersistCookieJar? _cookieJar;

  /// 创建 dio 实例对象
  static Future<Dio> createInstance([bool isJson = false]) async {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        ///提交方式：1.表单提交 2.JSON方式提交
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        /// 适用于post form表单提交
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,

        /// 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        validateStatus: (status) => true,
        baseUrl: RequestApi.baseurl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
      );
      _dio = Dio(options);
      if (_cookieJar == null) {
        var directory = await getApplicationDocumentsDirectory();
        _cookieJar = PersistCookieJar(storage: FileStorage(directory.path));
      }
      _dio!.interceptors.add(CookieManager(_cookieJar!));
    }
    _dio!.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  /// 请求，返回参数为 T
  /// [method]：请求方法，Method.POST等
  /// [path]：请求地址
  /// [params]：请求参数
  /// [success]：请求成功回调
  /// [error]：请求失败回调
  static Future request<T>(Method method, String path, dynamic params,
      {bool isJson = false, Success? success, required Fail? fail}) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        _onError(HttpException.netError, '网络异常', fail);
        return;
      }
      var dio = await createInstance(isJson);
      var response = await dio.request(path,
          data: params, options: Options(method: _methodValues[method]));
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

///解析json数据
///[data] 数据
Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

///请求类型枚举
enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

///请求类型值
const _methodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};

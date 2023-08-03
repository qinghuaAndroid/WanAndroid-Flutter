


import 'package:dio/dio.dart';

class HttpException {
  static const int success = 200;
  static const int successNotContent = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;

  static const int netError = 1000;
  static const int parseError = 1001;
  static const int socketError = 1002;
  static const int httpError = 1003;
  static const int timeoutError = 1004;
  static const int cancelError = 1005;
  static const int unknownError = 9999;

  static NetError handleException(DioException error) {
      if(error.type == DioExceptionType.connectionError) {
        return NetError(socketError, '网络异常');
      } else if (error.type == DioExceptionType.connectionTimeout) {
        return NetError(timeoutError, '连接超时');
      } else if (error.type == DioExceptionType.receiveTimeout ) {
        return NetError(timeoutError, '接收超时');
      } else if (error.type == DioExceptionType.sendTimeout) {
        return NetError(timeoutError, '发送超时');
      } else if (error.type == DioExceptionType.cancel) {
        return NetError(cancelError, '取消请求');
      } else {
        return NetError(unknownError, '未知异常');
      }
    }
}


class NetError{
  int code;
  String msg;

  NetError(this.code, this.msg);
}
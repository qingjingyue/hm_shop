import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/stores/TokenManager.dart';

/// 基于Dio进行二次封装的请求类
class DioRequest {
  final Dio _dio = Dio();

  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 添加拦截器
    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 从本地存储中获取token
          String token = tokenManager.getToken();
          if (token.isNotEmpty) {
            // 携带token
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 处理错误响应
          if (response.statusCode! < 200 || response.statusCode! >= 300) {
            return handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
          // 处理成功响应
          return handler.next(response);
        },
        onError: (e, handler) {
          // 在发生错误之前做一些事情
          // return handler.reject(e);
          return handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              message: e.response?.data?["msg"] ?? "加载数据异常",
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> response = await task;
      Map<String, dynamic> data = response.data as Map<String, dynamic>;
      // 处理业务失败响应
      if (data["code"] != GlobalConstants.SUCCESS_CODE) {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data["msg"] ?? "加载数据异常",
        );
      }
      // 处理业务成功响应
      return data["result"];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }
}

/// DioRequest的单例对象
final DioRequest dioRequest = DioRequest();

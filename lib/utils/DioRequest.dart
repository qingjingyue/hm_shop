import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

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
          // 在发送请求之前做一些事情
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
          return handler.reject(e);
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
        throw Exception(data["msg"] ?? "加载数据异常");
      }
      // 处理业务成功响应
      return data["result"];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }
}

/// DioRequest的单例对象
final DioRequest dioRequest = DioRequest();

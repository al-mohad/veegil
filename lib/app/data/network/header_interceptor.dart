import 'package:dio/dio.dart';

import 'api_error.dart';

class HeaderInterceptors extends Interceptor {
  // final authService = get_x.Get.find<AuthService>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
    });

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {}
    print(response.data);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    DioExceptions.fromDioError(err);
    super.onError(err, handler);
  }
}

import 'package:dio/dio.dart';
import 'package:get/utils.dart';

class HeaderInterceptors extends Interceptor {
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
    if (response.statusCode == 200) {
      (response.data);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Get.log('DioError Occured');
    // if (err.response?.statusCode == 401 && Get.currentRoute != Routes.AUTH) {
    //   _clearToken();
    //   Get.offAllNamed(Routes.AUTH);
    // }
    return super.onError(err, handler);
  }
}

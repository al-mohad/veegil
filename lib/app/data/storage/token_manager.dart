import 'package:dio/dio.dart';

class TokenManager extends Interceptor {
  static final TokenManager _instance = TokenManager._internal();
  static TokenManager get instance => _instance;
  TokenManager._internal();

  String? _token;
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      var data = Map<String, dynamic>.from(response.data);
      if (data['token'] != null) {
      } else if (response.statusCode == 401) {}
    }
    super.onResponse(response, handler);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // if (_token != null) {
    //   options.headers['Authorization'] = 'Bearer $_token';
    // }
    options.headers['token'] = _token;
    return super.onRequest(options, handler);
  }

  Future<void> initToken() async {}
}

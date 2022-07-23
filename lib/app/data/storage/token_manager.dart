import 'package:dio/dio.dart';
import 'package:veegil/app/data/storage/storage_manager.dart';

class TokenManager extends Interceptor {
  static final TokenManager _instance = TokenManager._internal();
  static TokenManager get instance => _instance;
  TokenManager._internal();

  String? _token;
  StorageManager storageManager = StorageManager();
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      var data = Map<String, dynamic>.from(response.data);
      if (data['token'] != null) {
        storageManager.saveToken(token: data['token']);
      } else if (response.statusCode == 401) {
        storageManager.clearToken(token: data['token']);
      }
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

  Future<void> initToken() async {
    _token = await storageManager.getToken();
  }
}

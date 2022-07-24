import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        _saveToken(token: data['token']);
      } else if (response.statusCode == 401) {
        _clearToken();
      }
    }
    super.onResponse(response, handler);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['token'] = _token;
    return super.onRequest(options, handler);
  }

  Future<void> initToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  void _saveToken({required token}) async {
    if (_token != token) {
      _token = token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
    }
  }

  void _clearToken() async {
    _token = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}

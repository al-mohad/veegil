// import 'package:dio/dio.dart';
// import 'package:get/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CookieManager extends Interceptor {
//   static final CookieManager _instance = CookieManager._internal();

//   static CookieManager get instance => _instance;

//   CookieManager._internal();

//   String? _cookie;

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (response.statusCode == 200) {
//       if (response.headers.map['set-cookie'] != null) {
//         _saveCookie(newCookie: response.headers.map['set-cookie']!.first);
//       } else if (response.statusCode == 401) {
//         _clearCookie();
//       }
//     }
//     return super.onResponse(response, handler);
//   }

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     Get.log('Current cookie: $_cookie');
//     options.headers.addAll({"Cookie": _cookie});
//     return super.onRequest(options, handler);
//   }

//   ///Call this method before runApp to initialize the cookie manager.
//   Future<void> initCookie() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _cookie = prefs.getString('cookie') ?? '';
//   }

//   Future<void> _saveCookie({required String newCookie}) async {
//     Get.log('New cookie: $newCookie');
//     if (_cookie != newCookie) {
//       _cookie = newCookie;
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('cookie', newCookie);
//     }
//   }

//   Future _clearCookie() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('cookie');
//   }
// }

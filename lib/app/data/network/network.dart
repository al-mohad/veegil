import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:veegil/app/data/storage/token_manager.dart';

import 'apiClient.dart';
import 'header_interceptor.dart';

class NetworkProvider {
  static final NetworkProvider _instance = NetworkProvider._internal();

  static NetworkProvider get instance => _instance;

  late Dio dio;
  late ApiClient apiClient;
  var cookieJar;
  String? appDocPath;
  factory NetworkProvider() {
    return _instance;
  }

  initialize() async {
    Get.log('Initializing network provider');
    appDocPath = await getDocPath();
  }

  //create singleton
  NetworkProvider._internal() {
    dio = Dio();
    cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage('${appDocPath.toString()}/.cookies'),
    );
    dio.interceptors.add(HeaderInterceptors());
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(TokenManager.instance);
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    apiClient = ApiClient(dio, baseUrl: ApiClient.baseUrl);
  }

  Future downloadFile(String url, savePath, {VoidCallback? onCompleted}) async {
    CancelToken cancelToken = CancelToken();
    try {
      await dio.download(url, savePath,
          onReceiveProgress: showDownloadProgress, cancelToken: cancelToken);
      return Future.value();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  getDocPath() async {
    var appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir.path;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:veegil/app/data/storage/token_manager.dart';

import 'apiClient.dart';
import 'header_interceptor.dart';

class NetworkProvider {
  static final NetworkProvider _instance = NetworkProvider._internal();

  static NetworkProvider get instance => _instance;

  late Dio dio;
  late ApiClient apiClient;

  factory NetworkProvider() {
    return _instance;
  }

  //create singleton
  NetworkProvider._internal() {
    dio = Dio();

    dio.interceptors.add(HeaderInterceptors());
    dio.interceptors.add(TokenManager.instance);
    dio.options.connectTimeout = 50000;
    dio.options.receiveTimeout = 50000;
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
}

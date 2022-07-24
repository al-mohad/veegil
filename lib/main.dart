import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:veegil/app/data/network/network.dart';
import 'package:veegil/app/data/storage/token_manager.dart';
import 'package:veegil/app/modules/auth/controllers/auth_controller.dart';
import 'package:veegil/app/modules/users/controllers/users_controller.dart';

import 'app/modules/transactions/controllers/transactions_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TokenManager.instance.initToken();
  await setCookieManager();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey[900]),
    ),
  );
}

setCookieManager() async {
  var appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  PersistCookieJar cookieJar;
  Get.log('App doc path: $appDocPath');
  cookieJar = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage('$appDocPath/.cookies'),
  );
  NetworkProvider.instance.dio.interceptors.add(
    CookieManager(cookieJar),
  );
  //
  Get.lazyPut<TransactionsController>(() => TransactionsController(),
      fenix: true);
  Get.lazyPut<UsersController>(() => UsersController(), fenix: true);
  Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
}

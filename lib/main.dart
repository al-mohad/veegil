import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/data/storage/token_manager.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TokenManager.instance.initToken();
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

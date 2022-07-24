import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegil/app/data/models/sign_up_response.dart';

class StorageManager extends GetxService {
  late GetStorage _box;
  GetStorage get box => _box;
  late Dio apiClient;

  @override
  void onInit() async {
    _box = GetStorage();
    super.onInit();
  }

  Future<void> cacheUserDetails({required RegisterationResponse user}) async {
    print("saving ${user.toJson()}");
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("USER_DETAILS", jsonEncode(user.toJson()));
  }

  Future<RegisterationResponse?> getUserDetails() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString("USER_DETAILS");
    if (userData != null) {
      print(
          "This is the outcome:......... ${RegisterationResponse.fromJson(jsonDecode(userData))}");
      return RegisterationResponse.fromJson(jsonDecode(userData));
    } else {
      return null;
    }
  }
}

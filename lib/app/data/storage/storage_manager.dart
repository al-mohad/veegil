import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageManager extends GetxService {
  late GetStorage _box;
  GetStorage get box => _box;
  late Dio apiClient;

  @override
  void onInit() async {
    _box = GetStorage();
    super.onInit();
  }

  Future<void> saveToken({required String token}) async {
    await _box.write('token', token);
  }

  Future clearToken({required String token}) async {
    await _box.remove('token');
  }

  Future getToken() async {
    String token = '';
    if (_box.hasData('token')) {
      token = await _box.read('token');
    }
    return token;
  }
}

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
}

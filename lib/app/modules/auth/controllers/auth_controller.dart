import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/data/network/api_error.dart';
import 'package:veegil/app/routes/app_pages.dart';

import '../../../data/enums/view_state.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/auth/auth_repository.dart';

class AuthController extends GetxController {
  final viewState = ViewState.idle.obs;
  final obscureText = true.obs;
  late AuthRepository _authRepository;

  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  UserResponse? user;
  final tabIndex = 0.obs;
  toggleObscureText() => obscureText.value = !obscureText.value;
  @override
  void onInit() {
    _authRepository = AuthRepository();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  void signIn() async {
    if (loginFormKey.currentState!.validate()) {
      viewState.value = ViewState.busy;
      loginFormKey.currentState!.save();
      final data = {
        'phoneNumber': phoneNumberController.text.trim(),
        'password': passwordController.text.trim(),
      };
      await _authRepository.login(data).then((value) {
        print(value);
        Get.offAllNamed(Routes.HOME);
      }).catchError((onError) {
        final message = DioExceptions.fromDioError(onError).message;
        Get.snackbar(
          'Error',
          message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
        );
      });
    } else {
      return;
    }

    viewState.value = ViewState.idle;
    update();
  }

  void signUp() async {
    if (registerFormKey.currentState!.validate()) {
      viewState.value = ViewState.busy;
      registerFormKey.currentState!.save();
      final data = {
        'phoneNumber': phoneNumberController.text.trim(),
        'password': passwordController.text.trim()
      };
      await _authRepository.register(data).then((value) {
        print(value);
        Get.offAllNamed(Routes.HOME);
      }).catchError((onError) {
        final message = DioExceptions.fromDioError(onError).message;
        Get.snackbar(
          'Error',
          message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
        );
      });
    } else {
      return;
    }

    viewState.value = ViewState.idle;
    update();
  }
}

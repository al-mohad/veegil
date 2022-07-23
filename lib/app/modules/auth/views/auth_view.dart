import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/modules/auth/views/sign_in_view.dart';
import 'package:veegil/app/modules/auth/views/sign_up_view.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            SignInView(),
            SignUpView(),
          ],
        ),
      ),
    );
  }
}

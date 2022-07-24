import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veegil/app/data/models/account.dart';

import '../../../widgets/shimmers.dart';
import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (c, i) {
            Account a = state[i];
            return ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: Text(a.phoneNumber),
              subtitle: Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(a.created)),
              ),
              trailing: Text('\u20a6 ${a.balance}'),
            );
          },
        ),
        onLoading: ls(),
        onEmpty: const Center(
          child: Text(
            'You don\'t have any history',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onError: (e) => const Center(
          child: Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

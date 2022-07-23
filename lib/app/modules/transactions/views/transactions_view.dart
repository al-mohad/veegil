import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/widgets/shimmers.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (c, i) {
            return const ListTile();
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

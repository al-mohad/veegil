import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veegil/app/widgets/shimmers.dart';

import '../../../data/models/transaction.dart';
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
            Transaction t = state.transactions[i];
            return ListTile(
              leading: Icon(
                t.type == 'credit' ? Icons.arrow_upward : Icons.arrow_downward,
                color: t.type == 'credit' ? Colors.green : Colors.red,
              ),
              title: Text(t.phoneNumber),
              subtitle: Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(t.created)),
              ),
              trailing: Text('\u20a6 ${t.amount}'),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veegil/app/data/models/transaction.dart';
import 'package:veegil/app/modules/auth/controllers/auth_controller.dart';
import 'package:veegil/app/modules/home/controllers/home_controller.dart';
import 'package:veegil/app/widgets/shimmers.dart';

import '../../../widgets/custom_bottom_sheet.dart';
import '../../../widgets/custom_button.dart';

class DashboardView extends GetView<HomeController> {
  DashboardView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
                const Text(
                  '\u20a6 5,720.40',
                  style: TextStyle(
                    fontSize: 52,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Account Number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  authController.accountNumber.value,
                  style: const TextStyle(
                    // fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              CustomButton(
                text: 'Transfer',
                icon: Icons.arrow_upward_rounded,
                onTap: () => Get.bottomSheet(
                  const CustomButtomSheet(
                    text: 'Transfer Money',
                  ),
                ),
                color: Colors.green,
              ),
              CustomButton(
                text: 'Withdraw',
                icon: Icons.arrow_downward_rounded,
                onTap: () => Get.bottomSheet(
                  const CustomButtomSheet(
                    text: 'Withdraw Money',
                  ),
                ),
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) {
                return ListView.builder(
                  itemCount: state!.transactions.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Transaction t = state.transactions[index];
                    return ListTile(
                      leading: Icon(
                        t.type == 'credit'
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: t.type == 'credit' ? Colors.green : Colors.red,
                      ),
                      title: Text(t.phoneNumber),
                      subtitle: Text(
                        DateFormat.yMMMMEEEEd()
                            .format(DateTime.parse(t.created)),
                      ),
                      trailing: Text('\u20a6 ${t.amount}'),
                    );
                  },
                );
              },
              onLoading: ls(),
              onEmpty: const Center(
                child: Text(
                  'You don\'t have any transaction history',
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
          )
        ],
      ),
    );
  }
}

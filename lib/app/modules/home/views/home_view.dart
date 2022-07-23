import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/modules/account/views/account_view.dart';
import 'package:veegil/app/modules/home/views/dashboard_view.dart';
import 'package:veegil/app/modules/settings/views/settings_view.dart';
import 'package:veegil/app/modules/transactions/views/transactions_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300',
            ),
          ),
        ),
        title: const Text(
          'Veegil Bank',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Get.toNamed('/more');
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              DashboardView(),
              TransactionsView(),
              SettingsView(),
              AccountView(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey.shade700,
            selectedItemColor: Colors.white,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            elevation: 8,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_usage_rounded),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          )),
    );
  }
}

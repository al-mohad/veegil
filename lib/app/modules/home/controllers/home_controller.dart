import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/data/enums/view_state.dart';
import 'package:veegil/app/data/models/transactions_response.dart';
import 'package:veegil/app/data/repositories/transaction/transaction_repository.dart';

import '../../../data/network/api_error.dart';
import '../../auth/controllers/auth_controller.dart';

class HomeController extends GetxController
    with StateMixin<TransactionsResponse> {
  //TODO: Implement HomeController
  final viewState = ViewState.idle.obs;
  late TransactionRepository _transactionRepository;
  final tabIndex = 0.obs;
  GlobalKey<FormState> swformKey = GlobalKey<FormState>();
  late TextEditingController phoneNumberController;
  late TextEditingController amountController;

  final authController = Get.find<AuthController>();
  @override
  onInit() {
    _transactionRepository = TransactionRepository();
    fetchTransactions();
    phoneNumberController = TextEditingController();
    amountController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    phoneNumberController.text = authController.accountNumber.value;
    super.onReady();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  fetchTransactions() async {
    change(null, status: RxStatus.loading());
    try {
      await _transactionRepository.getTransactions().then((value) {
        if (value.transactions.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(value, status: RxStatus.empty());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  transfer() async {
    if (swformKey.currentState!.validate()) {
      viewState.value = ViewState.busy;
      swformKey.currentState!.save();
      final data = {
        'phoneNumber': phoneNumberController.text.trim(),
        'amount': amountController.text.trim()
      };
      await _transactionRepository.transfer(data).then((value) async {
        Get.back();
        Get.snackbar(
          'Transfer Successful',
          'Transfer successfully to ${phoneNumberController.text}',
          icon: const Icon(Icons.info),
          backgroundColor: Colors.green,
        );
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
    await fetchTransactions();

    viewState.value = ViewState.idle;
    update();
  }

  withdraw() async {
    if (swformKey.currentState!.validate()) {
      viewState.value = ViewState.busy;
      swformKey.currentState!.save();
      final data = {
        'phoneNumber': phoneNumberController.text.trim(),
        'amount': amountController.text.trim()
      };
      await _transactionRepository.withdraw(data).then((value) async {
        Get.back();
        Get.snackbar(
          'Withdrawal Successful',
          'Withdrawn successfully to ${phoneNumberController.text}',
          icon: const Icon(Icons.info),
          backgroundColor: Colors.blue,
        );
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
    await fetchTransactions();
    viewState.value = ViewState.idle;
    update();
  }
}

import 'package:get/get.dart';

import '../../../data/repositories/transaction/transaction_repository.dart';

class UsersController extends GetxController with StateMixin {
  //TODO: Implement UsersController

  late TransactionRepository _transactionRepository;
  @override
  void onInit() {
    _transactionRepository = TransactionRepository();
    fetchTransactions();
    super.onInit();
  }

  fetchTransactions() async {
    change(null, status: RxStatus.loading());
    try {
      await _transactionRepository.getAccounts().then((value) {
        if (value.data.isNotEmpty) {
          change(value.data, status: RxStatus.success());
        } else {
          change(value.data, status: RxStatus.empty());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

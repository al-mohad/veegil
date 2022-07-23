import 'package:get/get.dart';

import '../../../data/repositories/transaction/transaction_repository.dart';

class TransactionsController extends GetxController with StateMixin {
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
}

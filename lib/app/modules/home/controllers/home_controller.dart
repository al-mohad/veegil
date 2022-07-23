import 'package:get/get.dart';
import 'package:veegil/app/data/models/transactions_response.dart';
import 'package:veegil/app/data/repositories/transaction/transaction_repository.dart';

class HomeController extends GetxController
    with StateMixin<TransactionsResponse> {
  //TODO: Implement HomeController

  late TransactionRepository _transactionRepository;
  final tabIndex = 0.obs;

  @override
  onInit() {
    _transactionRepository = TransactionRepository();
    fetchTransactions();
    super.onInit();
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
}

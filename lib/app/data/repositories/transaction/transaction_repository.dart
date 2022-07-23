import 'package:veegil/app/data/models/accounts_response.dart';
import 'package:veegil/app/data/models/transactions_response.dart';
import 'package:veegil/app/data/models/transfer_response.dart';
import 'package:veegil/app/data/models/withdraw_response.dart';

import '../../network/network.dart';

class TransactionRepository {
  late NetworkProvider _networkProvider;

  TransactionRepository() {
    _networkProvider = NetworkProvider.instance;
  }

  Future<TransferResponse> transfer(Map<String, dynamic> transferData) {
    return _networkProvider.apiClient.transfer(transferData);
  }

  Future<WithdrawResponse> withdraw(Map<String, dynamic> withdrawData) {
    return _networkProvider.apiClient.withdraw(withdrawData);
  }

  Future<AccountsResponse> getAccounts() {
    return _networkProvider.apiClient.getAccounts();
  }

  Future<TransactionsResponse> getTransactions() {
    return _networkProvider.apiClient.getTransactions();
  }

  Future<AccountsResponse> getUsers() {
    return _networkProvider.apiClient.getUsers();
  }
}

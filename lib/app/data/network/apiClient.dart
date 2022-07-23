import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:veegil/app/data/models/accounts_response.dart';
import 'package:veegil/app/data/models/sign_in_response.dart';
import 'package:veegil/app/data/models/sign_up_response.dart';
import 'package:veegil/app/data/models/transactions_response.dart';
import 'package:veegil/app/data/models/withdraw_response.dart';

import '../models/transfer_response.dart';
import 'apis.dart';

part 'apiClient.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class ApiClient {
  static bool isLiveEnvironment = false;

  static String devUrl = "https://bank.veegil.com/";
  static String liveUrl = "https://bank.veegil.com/";

  static String baseUrl = isLiveEnvironment ? liveUrl : devUrl;

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /*Login*/
  @POST(Apis.login)
  Future<SignInResponse> login(
    @Body() Map<String, dynamic> loginData,
  );

  /*Registration*/
  @POST(Apis.register)
  Future<RegisterationResponse> register(
    @Body() Map<String, dynamic> registerationData,
  );

  /*Withdraw*/
  @POST(Apis.transfer)
  Future<TransferResponse> transfer(
    @Body() Map<String, dynamic> transferData,
  );

  /*Withdraw*/
  @POST(Apis.withdraw)
  Future<WithdrawResponse> withdraw(
    @Body() Map<String, dynamic> withdrawData,
  );

  /*Accounts*/
  @GET(Apis.accounts)
  Future<AccountsResponse> getAccounts();

  /*Transactions*/
  @GET(Apis.transactions)
  Future<TransactionsResponse> getTransactions();

  /*Users*/
  @GET(Apis.users)
  Future<AccountsResponse> getUsers();
}

// fvm flutter pub run build_runner build --delete-conflicting-outputs

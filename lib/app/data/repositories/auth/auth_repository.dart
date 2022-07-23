import 'package:veegil/app/data/models/sign_in_response.dart';

import '../../models/sign_up_response.dart';
import '../../network/network.dart';

class AuthRepository {
  late NetworkProvider _networkProvider;

  AuthRepository() {
    _networkProvider = NetworkProvider.instance;
  }

  Future<SignInResponse> login(Map<String, dynamic> loginData) {
    return _networkProvider.apiClient.login(loginData);
  }

  Future<RegisterationResponse> register(
      Map<String, dynamic> registrationData) {
    return _networkProvider.apiClient.register(registrationData);
  }
}

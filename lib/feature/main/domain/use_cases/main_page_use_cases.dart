import 'package:casino/feature/main/domain/repositories/user_balance_repository.dart';

class GetUserData {
  final UserBalanceRepository repository;

  GetUserData({required this.repository});

  call(String username, String password, String token) {
    return repository.getUserData(username, password, token);
  }
}

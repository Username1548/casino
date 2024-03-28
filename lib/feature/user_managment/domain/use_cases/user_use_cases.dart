import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/user_managment/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  final UserRepository repository;

  SignIn({required this.repository});

  Future<Either<Failure, String>> call(
      {required username, required password, required token}) async {
    return repository.signIn(username, password, token);
  }
}

class SignUp {
  final UserRepository repository;

  SignUp({required this.repository});

  Future<Either<Failure, String>> call(
      {required username, required password}) async {
    return repository.signUp(username, password);
  }
}

class GetUserToken {
  final UserRepository repository;

  GetUserToken({required this.repository});

  Future<Either<Failure, String>> call(
      {required username, required password}) async {
    return repository.getUserToken(username, password);
  }
}

class CashUserData {
  final UserRepository repository;

  CashUserData({required this.repository});

  Future<void> call(
      {required username, required password, required token}) async {
    return repository.cashUserData(username, password, token);
  }
}

class GetCashedData {
  final UserRepository repository;

  GetCashedData({required this.repository});

  Either<Failure, Map<String, String?>> call() {
    return repository.getCashedData();
  }
}

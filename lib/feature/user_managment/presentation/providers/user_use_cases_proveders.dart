import 'package:casino/feature/user_managment/data/repositories/user_repository_impl.dart';
import 'package:casino/feature/user_managment/domain/repositories/user_repository.dart';
import 'package:casino/feature/user_managment/domain/use_cases/user_use_cases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInProvider = Provider<SignIn>((ref) {
  final UserRepository repository = ref.read(userRepositoryProvider);
  return SignIn(repository: repository);
});

final signUpProvider = Provider<SignUp>((ref) {
  final UserRepository repository = ref.read(userRepositoryProvider);
  return SignUp(repository: repository);
});

final getUserTokenProvider = Provider<GetUserToken>((ref) {
  final UserRepository repository = ref.read(userRepositoryProvider);
  return GetUserToken(repository: repository);
});

final cashUserDataProvider = Provider<CashUserData>((ref) {
  final UserRepository repository = ref.read(userRepositoryProvider);
  return CashUserData(repository: repository);
});

final getCashedDataProvider = Provider<GetCashedData>((ref) {
  final UserRepository repository = ref.read(userRepositoryProvider);
  return GetCashedData(repository: repository);
});
import 'package:casino/core/error/failures.dart';
import 'package:casino/core/general_balance/data/repositories/user_data_repository_impl.dart';
import 'package:casino/core/general_balance/domain/entities/user_data_entity.dart';
import 'package:casino/core/general_balance/domain/repositories/user_balance_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserDataProvider = Provider<GetUserData>((ref) {
  final repository = ref.read(userDataRepositoryProvider);
  return GetUserData(repository: repository);
});

final cleanCashedDataProvider = Provider<CleanCashedData>((ref) {
  final repository = ref.read(userDataRepositoryProvider);
  return CleanCashedData(repository: repository);
});

class GetUserData {
  final UserBalanceRepository repository;

  GetUserData({required this.repository});

  Future<Either<Failure, UserDataEntity>> call(
      String username, String password, String token) async {
    return await repository.getUserData(username, password, token);
  }
}

class CleanCashedData {
  final UserBalanceRepository repository;

  CleanCashedData({required this.repository});

  Future<Either<Failure, bool>> call() async {
    return await repository.cleanCashedData();
  }
}

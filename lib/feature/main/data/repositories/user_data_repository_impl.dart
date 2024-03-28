

import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/main/domain/entities/user_data_entity.dart';
import 'package:casino/feature/main/domain/repositories/user_balance_repository.dart';
import 'package:dartz/dartz.dart';

class UserDataRepositoryImpl implements UserBalanceRepository {
  @override
  Future<Either<Failure, UserDataEntity>> getUserData(String username, String password, String token) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

}
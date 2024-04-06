import 'package:casino/core/error/failures.dart';
import 'package:casino/core/general_balance/domain/entities/user_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserBalanceRepository {
  Future<Either<Failure, UserDataEntity>> getUserData(
      String username, String password, String token);
}

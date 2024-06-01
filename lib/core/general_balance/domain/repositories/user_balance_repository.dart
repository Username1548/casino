import '../../../error/failures.dart';
import '../entities/user_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserBalanceRepository {
  Future<Either<Failure, UserDataEntity>> getUserData(
      String username, String password, String token);

  Future<Either<Failure, bool>> cleanCashedData();
}

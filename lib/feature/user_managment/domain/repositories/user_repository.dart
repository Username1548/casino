import 'package:casino/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> signIn(String username, String password, String token);

  Future<Either<Failure, String>> signUp(String username, String password);

  Future<Either<Failure, String>> getUserToken(
      String username, String password);

  Future<void> cashUserData(
      String username, String password, String token);

  Either<Failure, Map<String, String?>> getCashedData();

}

import 'package:casino/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> signIn(String username, String password);

  Future<Either<Failure, void>> signUp(String username, String password);

  Future<Either<Failure, String>> getUserToken(
      String username, String password);

  Future<Either<Failure, void>> cashUserData(
      String username, String password, String token);

  Future<Either<Failure, Map<String, dynamic>>> getCashedData();
  
  Future<void> signOut();
}

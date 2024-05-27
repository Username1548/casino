

import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/blackjack/data/models/table_model.dart';
import 'package:dartz/dartz.dart';




abstract class BjRepository {
  Future<Either<Failure, BjTable>> createTable(int bet, String token, String username, String password);

  Future<Either<Failure, BjTable>> addCard(String token, String username, String password);

  Future<Either<Failure, BjTable>> stand(String token, String username, String password);

  Future<Either<Failure, BjTable>> double(String token, String username, String password);

  Future<Either<Failure, BjTable>> getTable(String token, String username, String password);

  Future<Either<Failure, String>> delete(String token, String username, String password);

  Future<String> reloadToken(String username, String password);
}

import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/roulette/domain/entities/bet_entity.dart';
import 'package:casino/feature/roulette/domain/entities/roulette_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RouletteRepository {
  Future<Either<Failure, RouletteEntity>> play(
      String username, String password, String token, BetEntity userBet);
}

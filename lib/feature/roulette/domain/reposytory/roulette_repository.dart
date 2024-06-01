import '../../../../core/error/failures.dart';
import '../entities/bet_entity.dart';
import '../entities/roulette_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RouletteRepository {
  Future<Either<Failure, RouletteEntity>> play(
      String username, String password, String token, BetEntity userBet);
}

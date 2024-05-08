import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/roulette/data/repositories/roulette_repository_impl.dart';
import 'package:casino/feature/roulette/domain/entities/bet_entity.dart';
import 'package:casino/feature/roulette/domain/entities/roulette_entity.dart';
import 'package:casino/feature/roulette/domain/reposytory/roulette_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playProvider = Provider((ref) {
  final repository = ref.read(rouletteRepositoryProvider);
  return Play(repository: repository);
});

class Play {
  final RouletteRepository repository;

  Play({required this.repository});

  Future<Either<Failure, RouletteEntity>> call(
      String username, String password, String token, BetEntity userBet) async {
    final response = await repository.play(username, password, token, userBet);
    return response;
  }
}

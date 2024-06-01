import '../../../../core/error/failures.dart';
import '../../data/repositories/roulette_repository_impl.dart';
import '../entities/bet_entity.dart';
import '../entities/roulette_entity.dart';
import '../reposytory/roulette_repository.dart';
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

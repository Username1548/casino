import '../../../../core/error/failures.dart';
import '../data_sources/remote_data_sourses/roulette_remote_data_source.dart';
import '../../domain/entities/bet_entity.dart';
import '../../domain/entities/roulette_entity.dart';
import '../../domain/reposytory/roulette_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rouletteRepositoryProvider = Provider((ref) {
  final dataSource = ref.read(rouletteRemoteSourceProvider);
  return RouletteRepositoryImpl(dataSource: dataSource);
});

class RouletteRepositoryImpl implements RouletteRepository {
  final RouletteRemoteDataSource dataSource;

  RouletteRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, RouletteEntity>> play(
      String username, String password, String token, BetEntity userBet) async {
    final response =
        await dataSource.play(username, password, token, userBet.toModel());
    return response.fold((l) => Left(l), (r) => Right(r.toEntity()));
  }
}

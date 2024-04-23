import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/roulette/data/data_sources/remote_data_sourses/roulette_remote_data_source.dart';
import 'package:casino/feature/roulette/domain/entities/bet_entity.dart';
import 'package:casino/feature/roulette/domain/entities/roulette_entity.dart';
import 'package:casino/feature/roulette/domain/reposytory/roulette_repository.dart';
import 'package:dartz/dartz.dart';

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

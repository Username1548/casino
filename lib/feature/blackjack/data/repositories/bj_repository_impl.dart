import 'package:casino/feature/blackjack/data/models/table_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casino/feature/blackjack/domain/repositories/bj_repository.dart';

import '../../../../core/error/failures.dart';
import '../data_sources/bj_remote_data_source.dart';

final bjRepositoryProvider = Provider<BjRepository>((ref) {
  final remoteDataSource = ref.read(remoteBjDataSourceProvider);
  return BjRepositoryImpl(
      remoteDataSource: remoteDataSource);
});


class BjRepositoryImpl implements BjRepository{ //todo maybe should use Right()??


  final BjRemoteDataSource remoteDataSource;

  BjRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, BjTable>> createTable(int bet, String token) async {

    final response = await remoteDataSource.createTable(bet, token);

    if (response.isLeft()){
      await delete(token);
      final trueResponse = await remoteDataSource.createTable(bet, token); // todo murder for this?
      return trueResponse;
    }

    return response;
  }

  @override
  Future<Either<Failure, BjTable>> addCard(String token) async {
    final response = await remoteDataSource.addCard(token);
    return response;
  }

  @override
  Future<Either<Failure, BjTable>> stand(String token) async {
    final response = await remoteDataSource.stand(token);
    return response;
  }

  @override
  Future<Either<Failure, BjTable>> double(String token) async {
    final response = await remoteDataSource.double(token);
    return response;
  }

  @override
  Future<Either<Failure, BjTable>> getTable(String token) async {
    final response = await remoteDataSource.getTable(token);
    return response;
  }

  @override
  Future<Either<Failure, String>> delete(String token) async {
    final response = await remoteDataSource.delete(token);
    return response;
  }

}
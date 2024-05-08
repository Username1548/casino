import 'package:casino/feature/blackjack/data/models/table_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casino/feature/blackjack/domain/repositories/bj_repository.dart';

import '../../../../core/error/failures.dart';
import '../data_sources/bj_remote_data_source.dart';
import '../models/hand_model.dart';

final bjRepositoryProvider = Provider<BjRepository>((ref) {
  final remoteDataSource = ref.read(remoteBjDataSourceProvider);
  return BjRepositoryImpl(
      remoteDataSource: remoteDataSource);
});


class BjRepositoryImpl implements BjRepository{ //todo maybe should use Right()??


  final BjRemoteDataSource remoteDataSource;

  BjRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, BjTable>> createTable(int bet, String token, String username, String password) async {

    final response = await remoteDataSource.getTable(token, username, password);

    if (response.isRight()){
      BjTable table = response.getOrElse(
              () => BjTable(const BjHand([]), const BjHand([]), 0, false)
      );

      if (table.dealerHand.cards.length > 1){
        await delete(token, username, password);
        final trueResponse = await remoteDataSource.createTable(bet, token, username, password);
        return trueResponse;
      }
    }

    if (response.isLeft()){
      final trueResponse = await remoteDataSource.createTable(bet, token, username, password);
      return trueResponse;
    }

    return response;
  }

  @override
  Future<Either<Failure, BjTable>> addCard(String token, String username, String password) async {
    final response = await remoteDataSource.addCard(token, username, password);
    return response;
  }

  @override
  Future<Either<Failure, BjTable>> stand(String token, String username, String password) async {
    final response = await remoteDataSource.stand(token, username, password);
    return response;
  }

  @override
  Future<Either<Failure, BjTable>> double(String token, String username, String password) async {
    final response = await remoteDataSource.double(token, username, password);
    return response;
  }

  @override
  Future<Either<Failure, BjTable>> getTable(String token, String username, String password) async {
    final response = await remoteDataSource.getTable(token, username, password);
    return response;
  }

  @override
  Future<Either<Failure, String>> delete(String token, String username, String password) async {
    final response = await remoteDataSource.delete(token, username, password);
    return response;
  }

}
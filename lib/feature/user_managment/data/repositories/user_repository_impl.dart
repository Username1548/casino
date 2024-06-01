import '../../../../core/error/failures.dart';
import '../data_sources/user_local_data_source.dart';
import '../data_sources/user_remote_data_source.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  final remoteDataSource = ref.read(remoteDataSourceProvider);
  return UserRepositoryImpl(
      localDataSource: localDataSource, remoteDataSource: remoteDataSource);
});

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<void> cashUserData(
      String username, String password, String token) async {
    await localDataSource.cashUserData(username, password, token);
  }

  @override
  Either<Failure, Map<String, String?>> getCashedData() {
    final cashedData = localDataSource.getCashedData();
    for (var element in cashedData.values) {
      if (element == null) {
        return Left(CashedDataHasNullError());
      }
    }
    return Right(cashedData);
  }

  @override
  Future<Either<Failure, String>> getUserToken(
      String username, String password) async {
    final response = await remoteDataSource.generateToken(username, password);
    return response;
  }

  @override
  Future<Either<Failure, String>> signIn(
      String username, String password, String token) async {
    final response = await remoteDataSource.signIn(username, password, token);
    return response;
  }

  @override
  Future<Either<Failure, String>> signUp(
      String username, String password) async {
    final response = await remoteDataSource.signUp(username, password);
    return response;
  }
}

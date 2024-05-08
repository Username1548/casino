import 'package:casino/core/error/failures.dart';
import 'package:casino/core/general_balance/data/data_sources/user_data_local_datasource.dart';
import 'package:casino/core/general_balance/data/data_sources/user_data_remote_data_source.dart';
import 'package:casino/core/general_balance/domain/entities/user_data_entity.dart';
import 'package:casino/core/general_balance/domain/repositories/user_balance_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataRepositoryProvider = Provider<UserDataRepositoryImpl>((ref) {
  final userDataRemote = ref.read(remoteDataSourceProvider);
  final userDataLocal = ref.read(localDataSourceProvider);
  return UserDataRepositoryImpl(
      userDataRemote: userDataRemote, userDataLocal: userDataLocal);
});

class UserDataRepositoryImpl implements UserBalanceRepository {
  final UserDataRemote userDataRemote;
  final UserDataLocalSource userDataLocal;

  UserDataRepositoryImpl(
      {required this.userDataRemote, required this.userDataLocal});

  @override
  Future<Either<Failure, UserDataEntity>> getUserData(
      String username, String password, String token) async {
    final userData =
        await userDataRemote.getUserData(username, password, token);

    return userData.fold((l) => Left(l), (r) => Right(r.toEntity()));
  }

  @override
  Future<Either<Failure, bool>> cleanCashedData() async {
    final isSucces = await userDataLocal.cleanCashedData();
    return isSucces;
  }
}

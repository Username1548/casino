import 'package:casino/core/error/failures.dart';
import 'package:casino/core/general_balance/data/data_sources/user_data_remote_data_source.dart';
import 'package:casino/core/general_balance/domain/entities/user_data_entity.dart';
import 'package:casino/core/general_balance/domain/repositories/user_balance_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataRepositoryProvider = Provider<UserDataRepositoryImpl>((ref) {
  final userDataRemote = ref.read(remoteDataSourceProvider);
  return UserDataRepositoryImpl(userDataRemote: userDataRemote);
});

class UserDataRepositoryImpl implements UserBalanceRepository {
  final UserDataRemote userDataRemote;

  UserDataRepositoryImpl({required this.userDataRemote});

  @override
  Future<Either<Failure, UserDataEntity>> getUserData(
      String username, String password, String token) async {
    final userData =
        await userDataRemote.getUserData(username, password, token);

    return userData.fold((l) => Left(l), (r) => Right(r.toEntity()));
  }
}

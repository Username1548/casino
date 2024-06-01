import '../../../error/failures.dart';
import '../../../shared_preferences_singletone.dart';
import '../../../user_token.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDataSourceProvider =
    Provider<UserDataLocalSource>((ref) => UserDataLocalSource());

class UserDataLocalSource {
  Future<Either<Failure, bool>> cleanCashedData() async {
    final isSecces = await pref.clear();
    userToken = '';
    if (isSecces == true) {
      return Right(isSecces);
    }
    return Left(UnknowError());
  }
}

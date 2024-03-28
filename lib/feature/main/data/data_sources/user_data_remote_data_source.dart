import 'package:casino/core/constants/constants.dart';
import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/main/data/models/user_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteDataSourceProvider = Provider<UserDataRemote>((ref) {
  final dio = Dio();
  return UserDataRemote(dio: dio);
});

class UserDataRemote {
  final Dio dio;

  UserDataRemote({required this.dio});

  get baseMainURl => null;
  Future<Either<Failure, UserDataModel>> getUserData(
      String username, String password, String token) async {
    try {
      final response = await dio.get('$baseMainURL?access_token=$token');
      if (response.statusCode == 200) {
        return Right(UserDataModel.fromMap(response.data));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UnvalidTokenError());
        }
      }
    }
    return Left(UnknowError());
  }
}

import '../../../constants/constants.dart';
import '../../../error/failures.dart';
import '../models/user_data_model.dart';
import '../../../providers/providers.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final remoteDataSourceProvider = Provider<UserDataRemote>((ref) {
  final dio = ref.read(dioProvider);
  return UserDataRemote(dio: dio);
});

class UserDataRemote {
  final Dio dio;

  UserDataRemote({required this.dio});

  Future<Either<Failure, UserDataModel>> getUserData(
      String username, String password, String token) async {
    try {
      final response =
          await dio.get('${baseMainURL}get_data?access_token=$token');

      if (response.statusCode == 200) {
        final userModel = UserDataModel.fromMap(response.data);
        return Right(userModel);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          final newToken = await _generateToken(username, password);
          final response = newToken.fold((l) => null, (r) async {
            final response = await getUserData(username, password, r);
            return response;
          });
          if (response != null) {
            return response;
          }
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, String>> _generateToken(
      String username, String password) async {
    try {
      final response = await dio.post('${baseAuthURL}generate_token',
          data: {'username': username, 'password': password});
      if (response.statusCode == 201) {
        final token = response.data['access_token'] as String;
        return Right(token);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(IncorrectUserDataTokenError());
        }
      }
    }
    return Left(UnknowError());
  }
}

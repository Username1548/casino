import 'package:casino/core/constants/constants.dart';
import 'package:casino/core/error/failures.dart';
import 'package:casino/core/providers/providers.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return UserRemoteDataSource(dio: dio);
});

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});
  Future<Either<Failure, String>> signUp(
      String username, String password) async {
    try {
      final response = await dio.post('${baseAuthURL}register',
          data: {'username': username, 'password': password});
      if (response.statusCode == 201) {
        return const Right('user is created');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UserExistsError());
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, String>> signIn(
      String username, String password, String token) async {
    try {
      Response tokenResponse =
          await dio.get('${baseAuthURL}check_token_valid?access_token=$token');
      if (tokenResponse.statusCode == 200) {
        final token = tokenResponse.data['access_token'] as String;
        return Right(token);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return await generateToken(username, password);
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, String>> generateToken(
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

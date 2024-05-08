import 'package:casino/core/constants/constants.dart';
import 'package:casino/core/error/failures.dart';
import 'package:casino/core/providers/providers.dart';
import 'package:casino/feature/money_wheel/data/models/wheel_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wheelRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return WheelRemoteDataSource(dio: dio);
});

class WheelRemoteDataSource {
  final Dio dio;

  WheelRemoteDataSource({required this.dio});

  Future<Either<Failure, WheelModel>> spin(
      String username, String password, String token) async {
    try {
      final response =
          await dio.post('${baseWheelURL}spin?access_token=$token');
      if (response.statusCode == 200) {
        return Right(WheelModel.fromMap(response.data));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400 &&
            e.response!.data['detail'] ==
                "Token isn't valid!") {
          final newToken = await _generateToken(username, password);
          final response = newToken.fold((l) => null, (r) async {
            final response = await spin(username, password, r);
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

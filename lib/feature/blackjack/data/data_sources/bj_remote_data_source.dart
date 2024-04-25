import 'package:casino/core/constants/constants.dart';
import 'package:casino/core/error/failures.dart';
import 'package:casino/core/providers/providers.dart';
import 'package:casino/feature/blackjack/data/models/table_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteBjDataSourceProvider = Provider<BjRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return BjRemoteDataSource(dio: dio);
});

class BjRemoteDataSource {
  final Dio dio;

  BjRemoteDataSource({required this.dio});

  Future<Either<Failure, BjTable>> createTable(
      int bet, String token) async {


    try {

      final response = await dio.post(
        '${baseBJURL}create_table?bet=$bet&access_token=$token'
          );

      final BjTable result = BjTable.fromMap(response.data);
      if (response.statusCode == 200) {
        return Right(
          result
        );
      }

    } on DioException catch (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {

          return Left(UnknowError()); // todo change
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> addCard(String token) async {
    try {
      final response = await dio.post('${baseBJURL}add_card?access_token=$token');

      final BjTable result = BjTable.fromMap(response.data);

      if (response.statusCode == 200) {
        return Right(
            result
        );
      }

    } on DioException catch (e) {
      print(e.message);
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UnknowError());
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> stand(String token) async {
    try {
      final response = await dio.post('${baseBJURL}stand?access_token=$token');
      final BjTable result = BjTable.fromMap(response.data);

      if (response.statusCode == 200) {
        return Right(
            result
        );
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UnknowError());
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> double(String token) async {
    try {
      final response = await dio.post('${baseBJURL}double?access_token=$token');

      final BjTable result = BjTable.fromMap(response.data);

      if (response.statusCode == 200) {
        return Right(
            result
        );
      }

    } on DioException catch (e) {
      print(e.message);
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UnknowError());
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> getTable(String token) async {
    try {
      final response = await dio.get('${baseBJURL}get_table',
          data: {'token': token});
      final BjTable result = BjTable.fromMap(response.data);

      if (response.statusCode == 200) {
        return Right(
            result
        );
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UnknowError());
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, String>> delete(String token) async {
    try {
      final response = await dio.post('${baseBJURL}delete?access_token=$token');
      if (response.statusCode == 200) {
        return const Right(
            "Success"
        );
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Left(UnknowError());
        }
      }
    }
    return Left(UnknowError());
  }


}

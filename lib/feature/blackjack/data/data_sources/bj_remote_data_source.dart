import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/providers/providers.dart';
import '../models/table_model.dart';
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

  Future<Either<Failure, BjTable>> createTable(
      int bet, String token, String username, String password) async {


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
          if (e.response!.statusCode == 400 &&
              e.response!.data['detail'] ==
                  "Token isn't valid!") {
            final newToken = await generateToken(username, password);
            final response = newToken.fold((l) => null, (r) async {
              final response = await createTable(bet, r, username, password);
              return response;
            });
            if (response != null) {
              return response;
            }
            return Left(UnknowError()); // todo change
          }
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> addCard(String token, String username, String password) async {
    try {
      final response = await dio.post('${baseBJURL}add_card?access_token=$token');

      final BjTable result = BjTable.fromMap(response.data);

      if (response.statusCode == 200) {
        return Right(
            result
        );
      }

    } on DioException catch (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          if (e.response!.statusCode == 400 &&
              e.response!.data['detail'] ==
                  "Token isn't valid!") {
            final newToken = await generateToken(username, password);
            final response = newToken.fold((l) => null, (r) async {
              final response = await addCard(r, username, password);
              return response;
            });
            if (response != null) {
              return response;
            }
            return Left(UnknowError()); // todo change
          }
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> stand(String token, String username, String password) async {
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
          if (e.response!.statusCode == 400 &&
              e.response!.data['detail'] ==
                  "Token isn't valid!") {
            final newToken = await generateToken(username, password);
            final response = newToken.fold((l) => null, (r) async {
              final response = await stand(r, username, password);
              return response;
            });
            if (response != null) {
              return response;
            }
            return Left(UnknowError());
          }
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> double(String token, String username, String password) async {
    try {
      final response = await dio.post('${baseBJURL}double?access_token=$token');

      final BjTable result = BjTable.fromMap(response.data);

      if (response.statusCode == 200) {
        return Right(
            result
        );
      }

    } on DioException catch (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          if (e.response!.statusCode == 400 &&
              e.response!.data['detail'] ==
                  "Token isn't valid!") {
            final newToken = await generateToken(username, password);
            final response = newToken.fold((l) => null, (r) async {
              final response = await double(r, username, password);
              return response;
            });
            if (response != null) {
              return response;
            }
            return Left(UnknowError()); // todo change
          }
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, BjTable>> getTable(String token, String username, String password) async {
    try {
      final response = await dio.get('${baseBJURL}get_table?access_token=$token');

      if (response.statusCode == 200) {
        final BjTable result = BjTable.fromMap(response.data);
        return Right(
            result
        );
      }

    } on DioException catch (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          if (e.response!.statusCode == 400 &&
              e.response!.data['detail'] ==
                  "Token isn't valid!") {
            final newToken = await generateToken(username, password);
            final response = newToken.fold((l) => null, (r) async {
              final response = await getTable(r, username, password);
              return response;
            });
            if (response != null) {
              return response;
            }
            return Left(UnknowError()); // todo change
          }
        }
      }
    }
    return Left(UnknowError());
  }

  Future<Either<Failure, String>> delete(String token, String username, String password) async {
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
          if (e.response!.statusCode == 400 &&
              e.response!.data['detail'] ==
                  "Token isn't valid!") {
            final newToken = await generateToken(username, password);
            final response = newToken.fold((l) => null, (r) async {
              final response = await delete(r, username, password);
              return response;
            });
            if (response != null) {
              return response;
            }
            return Left(UnknowError()); // todo change
          }
        }
      }
    }
    return Left(UnknowError());
  }


}

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/providers/providers.dart';
import '../../models/bet_model.dart';
import '../../models/roulette_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rouletteRemoteSourceProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return RouletteRemoteDataSource(dio: dio);
});

class RouletteRemoteDataSource {
  final Dio dio;

  RouletteRemoteDataSource({required this.dio});

  Future<Either<Failure, RouletteModel>> play(
      String username, String password, String token, BetModel userBet) async {
    try {
      final response = await dio.post(
          '${baseRouletteURL}play?access_token=$token&bet=${userBet.toJson()}');
      if (response.statusCode == 200) {
        return Right(RouletteModel.fromMap(response.data));
      }
    } on DioException catch (e) {
      // print(e);
      if (e.response != null) {
        if (e.response!.statusCode == 400 &&
            e.response!.data['detail'] == "Token isn't valid!") {
          final newToken = await _generateToken(username, password);
          final response = newToken.fold((l) => null, (r) async {
            final response = await play(username, password, r, userBet);
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

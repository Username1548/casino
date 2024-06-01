import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/providers/providers.dart';
import '../models/leader_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leaderRemoteDataSourceProvider = Provider<LeaderRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return LeaderRemoteDataSource(dio);
});

class LeaderRemoteDataSource {
  final Dio dio;

  LeaderRemoteDataSource(this.dio);

  Future<Either<Failure, List<LeaderModel>>> getLeaders() async {
    try {
      final response = await dio.get('${baseMainURL}ladder?num=5');
      if (response.statusCode == 200) {
        final jsonList = response.data as List;
        final result = jsonList.map((e) => LeaderModel.fromMap(e)).toList();
        
        return Right(result);
      }
    } catch (e) {
      return Left(UnknowError());
    }
    return Left(UnknowError());
  }
}

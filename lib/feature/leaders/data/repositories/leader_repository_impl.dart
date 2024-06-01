import '../../../../core/error/failures.dart';
import '../data_sources/leader_remote_data_source.dart';
import '../../domain/entities/leader_entities.dart';
import '../../domain/repositories/leaders_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leaderRepositoryProvider = Provider<LeaderRepository>((ref) {
  final remoteDataSource = ref.read(leaderRemoteDataSourceProvider);
  return LeaderRepositoryImpl(remoteDataSource: remoteDataSource);
});

class LeaderRepositoryImpl implements LeaderRepository {
  final LeaderRemoteDataSource remoteDataSource;

  LeaderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LeaderEntity>>> getLeaders() async {
    final response = await remoteDataSource.getLeaders();
    return response.fold((l) => Left(UnknowError()), (r) {
      final List<LeaderEntity> result = r.map((e) => e.toEntity()).toList();
      return Right(result);
    });
  }
}

import '../../../../core/error/failures.dart';
import '../data_soureces/wheel_remote_data_source.dart';
import '../../domain/entities/wheel_entity.dart';
import '../../domain/repositories/wheel_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wheelRepositoryProvider = Provider<WheelRepository>((ref) {
  final wheelRemoteDataSource = ref.read(wheelRemoteDataSourceProvider);

  return WheelRepositoryImpl(wheelRemoteDataSource: wheelRemoteDataSource);
});

class WheelRepositoryImpl implements WheelRepository {
  final WheelRemoteDataSource wheelRemoteDataSource;

  WheelRepositoryImpl({required this.wheelRemoteDataSource});

  @override
  Future<Either<Failure, WheelEntity>> spin(
      String username, String password, String token) async {
    final result = await wheelRemoteDataSource.spin(username, password, token);
    return result.fold((l) => Left(l), (r) => Right(r.toEntity()));
  }
}

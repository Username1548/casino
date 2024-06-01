import '../../../../core/error/failures.dart';
import '../../data/repositories/wheel_repository_impl.dart';
import '../entities/wheel_entity.dart';
import '../repositories/wheel_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spinProvider = Provider<Spin>((ref) {
  final repository = ref.read(wheelRepositoryProvider);
  return Spin(repository: repository);
});

class Spin {
  final WheelRepository repository;

  Spin({required this.repository});

  Future<Either<Failure, WheelEntity>> call(
      {required username, required password, required token}) async {
    return repository.spin(username, password, token);
  }
}

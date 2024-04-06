import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/leaders/domain/entities/leader_entities.dart';
import 'package:dartz/dartz.dart';

abstract class LeaderRepository {
  Future<Either<Failure, List<LeaderEntity>>> getLeaders();
}

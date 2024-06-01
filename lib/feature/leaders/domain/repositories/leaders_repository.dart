import '../../../../core/error/failures.dart';
import '../entities/leader_entities.dart';
import 'package:dartz/dartz.dart';

abstract class LeaderRepository {
  Future<Either<Failure, List<LeaderEntity>>> getLeaders();
}

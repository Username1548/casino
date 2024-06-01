import '../../../../core/error/failures.dart';
import '../entities/wheel_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WheelRepository {
  Future<Either<Failure, WheelEntity>> spin(
      String username, String password, String token);
}

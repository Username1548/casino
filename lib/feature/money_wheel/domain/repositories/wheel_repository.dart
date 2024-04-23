import 'package:casino/core/error/failures.dart';
import 'package:casino/feature/money_wheel/domain/entities/wheel_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WheelRepository {
  Future<Either<Failure, WheelEntity>> spin(
      String username, String password, String token);
}

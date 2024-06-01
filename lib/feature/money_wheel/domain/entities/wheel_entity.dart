import '../../data/models/wheel_model.dart';
import 'package:equatable/equatable.dart';

class WheelEntity extends Equatable {
  final int moneyDelta;
  final int angleDelta;

  const WheelEntity({
    required this.moneyDelta,
    required this.angleDelta,
  });

  WheelEntity copyWith({
    int? moneyDelta,
    int? angleDelta,
  }) {
    return WheelEntity(
      moneyDelta: moneyDelta ?? this.moneyDelta,
      angleDelta: angleDelta ?? this.angleDelta,
    );
  }

  factory WheelEntity.fromMode(WheelModel entity) =>
      WheelEntity(moneyDelta: entity.moneyDelta, angleDelta: entity.angleDelta);

  WheelModel toModel() =>
      WheelModel(moneyDelta: moneyDelta, angleDelta: angleDelta);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [moneyDelta, angleDelta];
}

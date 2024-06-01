import 'package:equatable/equatable.dart';
import '../../domain/entities/wheel_entity.dart';

class WheelModel extends Equatable {
  final int moneyDelta;
  final int angleDelta;

  const WheelModel({required this.moneyDelta, required this.angleDelta});

  WheelModel copyWith({
    int? moneyDelta,
    int? angleDelta,
  }) {
    return WheelModel(
      moneyDelta: moneyDelta ?? this.moneyDelta,
      angleDelta: angleDelta ?? this.angleDelta,
    );
  }

  factory WheelModel.fromEntity(WheelEntity entity) =>
      WheelModel(moneyDelta: entity.moneyDelta, angleDelta: entity.angleDelta);

  WheelEntity toEntity() =>
      WheelEntity(moneyDelta: moneyDelta, angleDelta: angleDelta);

  @override
  List<Object> get props => [moneyDelta, angleDelta];

  factory WheelModel.fromMap(Map<String, dynamic> map) {
    return WheelModel(
      moneyDelta: map['money_delta'] as int,
      angleDelta: map['angle_delta'] as int,
    );
  }

  @override
  bool get stringify => true;
}

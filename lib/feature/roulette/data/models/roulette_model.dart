import 'package:equatable/equatable.dart';
import '../../domain/entities/roulette_entity.dart';

class RouletteModel extends Equatable {
  final int winNumber;
  final int moneyDelta;

  const RouletteModel({
    required this.winNumber,
    required this.moneyDelta,
  });

  RouletteEntity toEntity() =>
      RouletteEntity(winNumber: winNumber, moneyDelta: moneyDelta);

  RouletteModel copyWith({
    int? winNumber,
    int? moneyDelta,
  }) {
    return RouletteModel(
      winNumber: winNumber ?? this.winNumber,
      moneyDelta: moneyDelta ?? this.moneyDelta,
    );
  }

  factory RouletteModel.fromMap(Map<String, dynamic> map) {
    return RouletteModel(
      winNumber: map['win_number'] as int,
      moneyDelta: map['money_delta'] as int,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [winNumber, moneyDelta];
}
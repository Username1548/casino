import 'package:equatable/equatable.dart';

class RouletteEntity extends Equatable {
  final int winNumber;
  final int moneyDelta;
  const RouletteEntity({
    required this.winNumber,
    required this.moneyDelta,
  });

  RouletteEntity copyWith({
    int? winNumber,
    int? moneyDelta,
  }) {
    return RouletteEntity(
      winNumber: winNumber ?? this.winNumber,
      moneyDelta: moneyDelta ?? this.moneyDelta,
    );
  }

  @override
  List<Object> get props => [winNumber, moneyDelta];
}

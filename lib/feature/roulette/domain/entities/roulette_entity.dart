import 'package:equatable/equatable.dart';

import 'package:casino/feature/roulette/domain/entities/bet_entity.dart';

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
    BetEntity? bet,
  }) {
    return RouletteEntity(
      winNumber: winNumber ?? this.winNumber,
      moneyDelta: moneyDelta ?? this.moneyDelta,
      
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [winNumber, moneyDelta];
}

import 'package:flutter/material.dart';

enum BoardColor {
  red,
  black,
  selectedRed,
  selectedBlack,
  zero,
  selectedZero;

  Color get getColor {
    switch (this) {
      case BoardColor.red:
        return Colors.red;
      case BoardColor.black:
        return Colors.black;
      case BoardColor.selectedRed:
        return const Color.fromARGB(255, 255, 189, 185);
      case BoardColor.selectedBlack:
        return const Color.fromARGB(255, 107, 107, 107);
      case BoardColor.zero:
        return Colors.transparent;
      case BoardColor.selectedZero:
        return const Color.fromARGB(219, 255, 255, 255);
    }
  }
}

class BoardEntity {
  final int number;
  final BoardColor color;
  final int? bet;

  BoardEntity({required this.number, required this.color, required this.bet});

  BoardEntity copyWith({int? number, BoardColor? color, int? bet}) {
    return BoardEntity(
        number: number ?? this.number,
        color: color ?? this.color,
        bet: bet );
  }
}

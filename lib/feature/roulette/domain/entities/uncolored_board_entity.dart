import 'package:flutter/material.dart';

enum UncoloredBoardColor {
  unselected,
  selected;

  Color get getColor {
    switch (this) {
      case UncoloredBoardColor.selected:
        return const Color.fromARGB(219, 255, 255, 255);
      case UncoloredBoardColor.unselected:
        return Colors.transparent;
    }
  }
}

class UncoloredBoardEntity {
  final String text;
  final UncoloredBoardColor color;
  final int? bet;

  UncoloredBoardEntity(
      {required this.text, required this.color, required this.bet});

  UncoloredBoardEntity copyWith(
      {String? text, UncoloredBoardColor? color, int? bet}) {
    return UncoloredBoardEntity(
        text: text ?? this.text,
        color: color ?? this.color,
        bet: bet);
  }
}

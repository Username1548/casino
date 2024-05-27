import 'package:casino/feature/roulette/domain/entities/board_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardStateProvider =
    StateNotifierProvider<BoardNotfier, List<BoardEntity>>(
        (ref) => BoardNotfier());

class BoardNotfier extends StateNotifier<List<BoardEntity>> {
  BoardNotfier()
      : super([
      BoardEntity(number: 3, color: BoardColor.red, bet: null),
      BoardEntity(number: 6, color: BoardColor.black, bet: null),
      BoardEntity(number: 9, color: BoardColor.red, bet: null),
      BoardEntity(number: 12, color: BoardColor.red, bet: null),
      BoardEntity(number: 15, color: BoardColor.black, bet: null),
      BoardEntity(number: 18, color: BoardColor.red, bet: null),
      BoardEntity(number: 21, color: BoardColor.red, bet: null),
      BoardEntity(number: 24, color: BoardColor.black, bet: null),
      BoardEntity(number: 27, color: BoardColor.red, bet: null),
      BoardEntity(number: 30, color: BoardColor.red, bet: null),
      BoardEntity(number: 33, color: BoardColor.black, bet: null),
      BoardEntity(number: 36, color: BoardColor.red, bet: null),
      BoardEntity(number: 2, color: BoardColor.black, bet: null),
      BoardEntity(number: 5, color: BoardColor.red, bet: null),
      BoardEntity(number: 8, color: BoardColor.black, bet: null),
      BoardEntity(number: 11, color: BoardColor.black, bet: null),
      BoardEntity(number: 14, color: BoardColor.red, bet: null),
      BoardEntity(number: 17, color: BoardColor.black, bet: null),
      BoardEntity(number: 20, color: BoardColor.black, bet: null),
      BoardEntity(number: 23, color: BoardColor.red, bet: null),
      BoardEntity(number: 26, color: BoardColor.black, bet: null),
      BoardEntity(number: 29, color: BoardColor.black, bet: null),
      BoardEntity(number: 32, color: BoardColor.red, bet: null),
      BoardEntity(number: 35, color: BoardColor.black, bet: null),
      BoardEntity(number: 1, color: BoardColor.red, bet: null),
      BoardEntity(number: 4, color: BoardColor.black, bet: null),
      BoardEntity(number: 7, color: BoardColor.red, bet: null),
      BoardEntity(number: 10, color: BoardColor.black, bet: null),
      BoardEntity(number: 13, color: BoardColor.black, bet: null),
      BoardEntity(number: 16, color: BoardColor.red, bet: null),
      BoardEntity(number: 19, color: BoardColor.red, bet: null),
      BoardEntity(number: 22, color: BoardColor.black, bet: null),
      BoardEntity(number: 25, color: BoardColor.red, bet: null),
      BoardEntity(number: 28, color: BoardColor.black, bet: null),
      BoardEntity(number: 31, color: BoardColor.black, bet: null),
      BoardEntity(number: 34, color: BoardColor.red, bet: null),
      BoardEntity(number: 0, color: BoardColor.zero, bet: null),
    ]);
  selectNumber(int number) {
    state = [
      for (BoardEntity item in state)
        if (item.number == number)
          if (item.color == BoardColor.red)
            item.copyWith(color: BoardColor.selectedRed)
          else if (item.color == BoardColor.black)
            item.copyWith(color: BoardColor.selectedBlack)
          else if (item.color == BoardColor.selectedRed)
            item.copyWith(color: BoardColor.red)
          else if (item.color == BoardColor.selectedBlack)
            item.copyWith(color: BoardColor.black)
          else if (item.color == BoardColor.zero)
            item.copyWith(color: BoardColor.selectedZero)
          else
            item.copyWith(color: BoardColor.zero)
        else
          item
    ];
  }

  cleanState() {
    state = [
      BoardEntity(number: 3, color: BoardColor.red, bet: null),
      BoardEntity(number: 6, color: BoardColor.black, bet: null),
      BoardEntity(number: 9, color: BoardColor.red, bet: null),
      BoardEntity(number: 12, color: BoardColor.red, bet: null),
      BoardEntity(number: 15, color: BoardColor.black, bet: null),
      BoardEntity(number: 18, color: BoardColor.red, bet: null),
      BoardEntity(number: 21, color: BoardColor.red, bet: null),
      BoardEntity(number: 24, color: BoardColor.black, bet: null),
      BoardEntity(number: 27, color: BoardColor.red, bet: null),
      BoardEntity(number: 30, color: BoardColor.red, bet: null),
      BoardEntity(number: 33, color: BoardColor.black, bet: null),
      BoardEntity(number: 36, color: BoardColor.red, bet: null),
      BoardEntity(number: 2, color: BoardColor.black, bet: null),
      BoardEntity(number: 5, color: BoardColor.red, bet: null),
      BoardEntity(number: 8, color: BoardColor.black, bet: null),
      BoardEntity(number: 11, color: BoardColor.black, bet: null),
      BoardEntity(number: 14, color: BoardColor.red, bet: null),
      BoardEntity(number: 17, color: BoardColor.black, bet: null),
      BoardEntity(number: 20, color: BoardColor.black, bet: null),
      BoardEntity(number: 23, color: BoardColor.red, bet: null),
      BoardEntity(number: 26, color: BoardColor.black, bet: null),
      BoardEntity(number: 29, color: BoardColor.black, bet: null),
      BoardEntity(number: 32, color: BoardColor.red, bet: null),
      BoardEntity(number: 35, color: BoardColor.black, bet: null),
      BoardEntity(number: 1, color: BoardColor.red, bet: null),
      BoardEntity(number: 4, color: BoardColor.black, bet: null),
      BoardEntity(number: 7, color: BoardColor.red, bet: null),
      BoardEntity(number: 10, color: BoardColor.black, bet: null),
      BoardEntity(number: 13, color: BoardColor.black, bet: null),
      BoardEntity(number: 16, color: BoardColor.red, bet: null),
      BoardEntity(number: 19, color: BoardColor.red, bet: null),
      BoardEntity(number: 22, color: BoardColor.black, bet: null),
      BoardEntity(number: 25, color: BoardColor.red, bet: null),
      BoardEntity(number: 28, color: BoardColor.black, bet: null),
      BoardEntity(number: 31, color: BoardColor.black, bet: null),
      BoardEntity(number: 34, color: BoardColor.red, bet: null),
      BoardEntity(number: 0, color: BoardColor.zero, bet: null),
    ];
  }

  setBet(int number ,int? betValue) {
   state = [
      for (BoardEntity item in state)
        if (item.number == number)
            item.copyWith(bet: betValue)
        else
          item
    ];
  }
}

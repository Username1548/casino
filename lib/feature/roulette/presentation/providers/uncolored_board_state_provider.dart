import 'package:casino/feature/roulette/domain/entities/uncolored_board_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uncoloredBoardStateProvider =
    StateNotifierProvider<UncoloredBoardNotfier, List<UncoloredBoardEntity>>(
        (ref) => UncoloredBoardNotfier());

class UncoloredBoardNotfier extends StateNotifier<List<UncoloredBoardEntity>> {
  UncoloredBoardNotfier()
      : super([
          UncoloredBoardEntity(
              text: '1-12', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: '13-24', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: '25-36', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: '1-18', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: 'EVEN', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: 'RED', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: 'BLACK', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: 'ODD', color: UncoloredBoardColor.unselected, bet: null),
          UncoloredBoardEntity(
              text: '19-36', color: UncoloredBoardColor.unselected, bet: null)
        ]);
  selectField(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          if (state[index].color == UncoloredBoardColor.selected)
            state[index].copyWith(color: UncoloredBoardColor.unselected)
          else
            state[index].copyWith(color: UncoloredBoardColor.selected)
        else
          state[i]
    ];
  }

  cleanState() {
    state = [
      UncoloredBoardEntity(
          text: '1-12', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: '13-24', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: '25-36', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: '1-18', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: 'EVEN', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: 'RED', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: 'BLACK', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: 'ODD', color: UncoloredBoardColor.unselected, bet: null),
      UncoloredBoardEntity(
          text: '19-36', color: UncoloredBoardColor.unselected, bet: null)
    ];
  }

  setBet(int index, int? betValue) {
    
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[index].copyWith(bet: betValue) else state[i]
    ];

  }
}

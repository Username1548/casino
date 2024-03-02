import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/hand.dart';
import '../domain/models/table.dart';
import 'methods.dart';


class TableBjNotifier extends StateNotifier<TableBj>{
  TableBjNotifier(super.state);

  void changeBet(newBet){
    state = state.copyWith(
      deck: state.deck,
      bet: newBet,
      mainHand: state.mainHand,
      dealerHand: state.dealerHand,
      isDouble: state.isDouble
    );
  }

  void addCard(){
    state.mainHand.addCardBj();
    state = state.copyWith(
      deck: state.mainHand.deck,
      bet: state.bet,
      mainHand: state.mainHand,
      dealerHand: state.dealerHand,
      isDouble: state.isDouble
    );


  }

  void stand(){
    state.dealerTurn();
  }

  void double(){
    addCard();
    stand();
    state.isDouble = true;
  }

  void refresh(){
    state = state.copyWith(
      deck: getFullDeck(),
      bet: state.bet,
      mainHand: Hand([], state.deck, state.bet),
      dealerHand: Hand([], state.deck, state.bet),
      isDouble: false
    );
  }
}

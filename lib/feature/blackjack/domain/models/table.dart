import 'card.dart';
import 'hand.dart';

class TableBj {
  late Hand dealerHand;
  late Hand mainHand;

  bool isDouble = false;
  late List<CardBj> deck;
  late int bet;

  TableBj(this.deck, this.bet, this.mainHand, this.dealerHand, this.isDouble);

  TableBj copyWith({deck, bet, mainHand, dealerHand, isDouble}) {
    return TableBj(deck, bet, mainHand, dealerHand, isDouble);
  }

  void dealerTurn() {
    mainHand.canAdd = false;
    mainHand.canDouble = false;
    while (dealerHand.calculateAmount() < 17) {
      dealerHand.addCardBj();
    }
  }

  String checkWin(Hand hand) {
    int playerAmount = hand.calculateAmount();
    int dealerAmount = dealerHand.calculateAmount();
    if (playerAmount <= 21 &&
        (playerAmount > dealerAmount || dealerAmount > 21)) {
      return "win";
    }
    if (dealerAmount == playerAmount) {
      return "push";
    }
    return "lose";
  }

  int result() {
    double totalBet = 0;

    mainHand.bet = bet;

    String res = checkWin(mainHand);

    if (checkBj(mainHand)) {
      totalBet += mainHand.bet * 2.5;
    } else if (res == "win") {
      totalBet += mainHand.bet;
    } else if (res == "lose") {
      totalBet -= mainHand.bet;
    }

    if (isDouble) {
      totalBet *= 2;
    }

    return totalBet.round();
  }

  bool checkBj(Hand hand) {
    if (hand.cards.length == 2 && hand.calculateAmount() == 21) {
      return true;
    }
    return false;
  }
}

import 'dart:math';
import 'card.dart';

class Hand {
  late List<CardBj> deck;
  late List<CardBj> cards;
  late int bet;
  late bool double;

  bool canAdd = true;
  bool canDouble = true;

  Hand(this.cards, this.deck, this.bet);

  Hand copyWith({cards, deck, bet}) {
    return Hand(cards, deck, bet);
  }

  void addCardBj() {
    if (cards.length == 2) {
      canDouble = false;
    }

    if (canAdd) {
      CardBj card = deck[Random().nextInt(deck.length)];
      deck.remove(card);
      cards.add(card);
    }

    if (calculateAmount() > 21) {
      canAdd = false;
    }
  }

  int calculateAmount() {
    int amount = 0;
    int acesNum = 0;

    for (var element in cards) {
      amount += element.value;
      if (element.value == 11) {
        acesNum += 1;
      }
    }

    while (amount > 21 && acesNum > 0) {
      amount -= 10;
      acesNum -= 1;
    }

    return amount;
  }
}

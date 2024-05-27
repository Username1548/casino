import 'card_model.dart';


class BjHand {
  final List<CardBj> cards;

  const BjHand(this.cards);

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

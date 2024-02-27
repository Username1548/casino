import 'dart:math';





class CardBj {
  final String name;
  final int value;
  final String imagePath;

  const CardBj(this.name, this.value, this.imagePath);
}

class Hand {
  late List<CardBj> deck;
  late List<CardBj> cards;
  late int bet;
  late bool double;

  bool canAdd = true;
  bool canDouble = true;

  Hand(this.cards, this.deck, this.bet);

  void addCardBj() {
    if (cards.length == 1) {
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

  void doubleBet() {
    if (canDouble) {
      bet += bet;
      addCardBj();
    }
  }

  void split(Hand secondHand) {
    //сплит можно сделать 3 раза. надо добавить ограничение.
    if (cards.length == 2) {
      secondHand = Hand([cards[0]], deck, bet);
      cards.removeAt(0);
    }
  }
}

class TableBj {
  late Hand dealerHand;
  late Hand mainHand;
  late Hand? splittedHand;

  late List<CardBj> deck;
  late int bet;

  TableBj(this.deck, this.bet) {
    dealerHand = Hand([], deck, bet);
    mainHand = Hand([], deck, bet);
    splittedHand = null;
  }

  int dealerTurn() {
    mainHand.canAdd = false;
    mainHand.canDouble = false;
    while (dealerHand.calculateAmount() < 17) {
      dealerHand.addCardBj();
    }
    return dealerHand.calculateAmount();
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
    int totalBet = 0;
    if (splittedHand != null) {
      String res = checkWin(splittedHand!);
      if (res == "win") {
        totalBet += splittedHand!.bet;
      } else if (res == "lose") {
        totalBet -= splittedHand!.bet;
      }
    }

    String res = checkWin(mainHand);
    if (res == "win") {
      totalBet += mainHand.bet;
    } else if (res == "lose") {
      totalBet -= mainHand.bet;
    }

    return totalBet;
  }

  void reset(bool newDeck){
    if (newDeck){
      deck = getFullDeck();
    }
    mainHand = Hand([], deck, bet);
    dealerHand = Hand([], deck, bet);
    splittedHand = null;
  }
}

List<CardBj> getFullDeck() {
  List<CardBj> fullDeck = [];
  for (var nominal in [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]) {
    for (var suit in ["C", "D", "H", "S"]) {
      int amount = 10;
      if (nominal is int) {
        amount = nominal;
      }

      if (nominal == "A"){
        amount = 11;
      }

      fullDeck.add(CardBj("$nominal$suit", amount, "assets/images/cards/standard/$nominal$suit.png"));
    }
  }
  return fullDeck;
}

main(){

  TableBj t = TableBj(getFullDeck(), 1);
  t.mainHand.cards = [
    const CardBj("", 10, ""),
    const CardBj("", 11, "")
  ];
  print(t.mainHand.calculateAmount());

}

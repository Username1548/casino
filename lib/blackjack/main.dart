import 'dart:math';

class Card{
  late String name;
  late int value;
  late String imagePath;

  Card(this.name, this.value, this.imagePath){}

}


class Hand{
  late List<Card> deck;
  late List<Card> cards;
  late int bet;
  late bool double;

  bool canAdd = true;
  bool canDouble = true;

  Hand(this.cards, this.deck, this.bet){}

  void addCard(){
    if (cards.length == 1){
      canDouble = false;
    }

    if (canAdd){
      Card card = deck[Random().nextInt(deck.length)];
      deck.remove(card);
      cards.add(card);
    }

    if (this.calculateAmount() > 21){
      canAdd = false;
    }
  }

  int calculateAmount(){
    int amount = 0;
    int acesNum = 0;

    for (var element in cards){
      amount += element.value;
      if (element.value == 11){
        acesNum += 1;
      }
    }

    while (amount > 21 && acesNum > 0){
      amount -= 10;
      acesNum -= 1;
    }

    return amount;
  }

  void doubleBet(){
    if (canDouble){
      bet += bet;
      addCard();
    }
  }

  void split(Hand secondHand){
    //сплит можно сделать 3 раза. надо добавить ограничение.
    if (cards.length == 2){
      secondHand = Hand([cards[0]], deck, bet);
      cards.removeAt(0);
    }
  }

}


class Table{
  late Hand dealerHand;
  late Hand mainHand;
  late Hand? splittedHand;


  late List<Card> deck;
  late int bet;

  Table(this.deck, this.bet){
    dealerHand = Hand([], deck, bet);
    mainHand = Hand([], deck, bet);
    splittedHand = null;
  }

  int dealerTurn(){
    while (dealerHand.calculateAmount() < 17){
      dealerHand.addCard();
    }
    return dealerHand.calculateAmount();
  }

  String checkWin(Hand hand){
    int player_amount = hand.calculateAmount();
    int dealer_amount = dealerHand.calculateAmount();
    if (player_amount <= 21 &&
        (player_amount > dealer_amount || dealer_amount > 21)){
      return "win";
    }
    if (dealer_amount == player_amount){
      return "push";
    }
    return "lose";
  }

  int result(){
    int totalBet = 0;
    if (splittedHand != null){
      String res = checkWin(splittedHand!);
      if (res == "win"){
        totalBet += splittedHand!.bet;
      }else if(res == "lose"){
        totalBet -= splittedHand!.bet;
      }
    }

    String res = checkWin(mainHand);
    if (res == "win"){
      totalBet += mainHand.bet;
    }else if (res == "lose"){
      totalBet -= mainHand.bet;
    }


    return totalBet;
  }



}


main(){
  //Трефы — clubs Бубны — diamonds Червы — hearts Пики — spades
  //A - Ace == Туз
  List<Card> testCards = [
    Card("8H",8, ""),
    Card("AH", 11, ""),

  ];
  List<Card> full_deck = [];
  for (var nominal in [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]){
    for (var suit in ["C", "D", "H", "S"]){
      int amount = 10;
      if (nominal is int){
        amount = nominal;
      }
      full_deck.add(Card("$nominal$suit", amount, ""));
    }
  }

  Hand h = Hand(testCards, full_deck, 1);
  Table t = Table(full_deck, 1);

  t.mainHand = h;
  t.dealerTurn();
  print(h.calculateAmount());
  print(t.dealerHand.calculateAmount());
  print(t.result());
}
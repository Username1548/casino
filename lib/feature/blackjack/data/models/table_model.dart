import 'package:casino/feature/blackjack/data/models/card_model.dart';
import 'package:casino/feature/blackjack/data/models/hand_model.dart';

class BjTable{
  final BjHand playerHand;
  final BjHand dealerHand;
  int bet = 1;
  bool isDouble = false;

  BjTable(this.playerHand, this.dealerHand, this.bet, this.isDouble);

  factory BjTable.fromMap(Map<String, dynamic> map){
    List<CardBj> playerCards = [];
    List<CardBj> dealerCards = [];
    int bet = 0;
    if (map.containsKey("bet")){
      bet = map["bet"];
    }
    Map<String, List<String>> mapFix = {};
    mapFix["playerHand"] = map["player_cards"]!.split(" ");
    mapFix["dealerHand"] = map["dealer_cards"]!.split(" ");

    for (String element in mapFix["playerHand"]!){
      playerCards.add(CardBj.fromString(element));
    }

    for (String element in mapFix["dealerHand"]!){
      dealerCards.add(CardBj.fromString(element));
    }

    return BjTable(
        BjHand(playerCards),
        BjHand(dealerCards),
        bet, // todo add check,
        false //todo fix
    );
  }

  BjTable copyWith({
    BjHand? playerHand,
    BjHand? dealerHand,
    int? bet,
    bool? isDouble
  }) {
    return BjTable(
        playerHand ?? this.playerHand,
        dealerHand ?? this.dealerHand,
        bet ?? this.bet,
        isDouble ?? this.isDouble
    );
  }

  int result() {
    int playerScore = playerHand.calculateAmount();
    int dealerScore = dealerHand.calculateAmount();

    int multiplier = 1;

    if (isDouble){
      multiplier = 2;
    }

    if (playerScore == 21 && playerHand.cards.length == 2){
      return (bet*1.5).round();
    }


    if ((playerScore < dealerScore && dealerScore <= 21) || playerScore > 21){
      return bet * -1 * multiplier;
    }else if(playerScore == dealerScore){
      return 0;
    }else{
      return bet * multiplier;
    }

  }

}
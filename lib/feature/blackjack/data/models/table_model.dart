import 'package:casino/feature/blackjack/data/models/card_model.dart';
import 'package:casino/feature/blackjack/data/models/hand_model.dart';

class BjTable{
  final BjHand playerHand;
  final BjHand dealerHand;
  int bet = 1;

  BjTable(this.playerHand, this.dealerHand, this.bet);

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
        bet // todo add check
    );
  }

  BjTable copyWith({
    BjHand? playerHand,
    BjHand? dealerHand,
    int? bet
  }) {
    return BjTable(
        playerHand ?? this.playerHand,
        dealerHand ?? this.dealerHand,
        bet ?? 1
    );
  }

}
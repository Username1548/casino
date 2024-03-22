import 'package:flutter/material.dart';
import '../domain/models/card.dart';

List<Image> getImages(List<CardBj> list){
  //Генерация изображений из массива карт. Нужно для отображения карт на столе.

  List<Image> imageList = [];
  for (var element in list){
    imageList.add(Image.asset(element.imagePath, width: 100));
  }

  return imageList;
}

List<CardBj> getFullDeck() {
  //Генерация полной колоды карт.
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

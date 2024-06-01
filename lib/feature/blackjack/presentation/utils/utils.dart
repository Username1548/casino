import 'package:flutter/material.dart';
import '../../data/models/card_model.dart';

List<Image> getImages(List<CardBj> list){
  //Генерация изображений из массива карт. Нужно для отображения карт на столе.

  List<Image> imageList = [];
  for (var element in list){
    imageList.add(Image.asset(element.imagePath, width: 100));
  }

  return imageList;
}
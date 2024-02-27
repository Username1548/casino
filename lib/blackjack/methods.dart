import 'dart:ui';

import 'package:flutter/cupertino.dart';

List<Widget> getImages(List list){
  List<Widget> imageList = [];
  for (var element in list){
    imageList.add(Image.asset(element.imagePath, width: 100));
  }

  return imageList;
}
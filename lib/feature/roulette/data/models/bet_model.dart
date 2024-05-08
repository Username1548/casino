// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BetModel extends Equatable {
  final int? red;
  final int? black;
  final int? odd;
  final int? even;
  final int? firstEighteen;
  final int? secondEighteen;
  final int? firstTwelve;
  final int? secondTwelve;
  final int? thirdTwelve;
  final List<int?> numbers;
  const BetModel({
    required this.red,
    required this.black,
    required this.odd,
    required this.even,
    required this.firstEighteen,
    required this.secondEighteen,
    required this.firstTwelve,
    required this.secondTwelve,
    required this.thirdTwelve,
    required this.numbers,
  });

  BetModel copyWith({
    int? red,
    int? black,
    int? odd,
    int? even,
    int? firstEighteen,
    int? secondEighteen,
    int? firstTwelve,
    int? secondTwelve,
    int? thirdTwelve,
    List<int?>? numbers,
  }) {
    return BetModel(
      red: red ?? this.red,
      black: black ?? this.black,
      odd: odd ?? this.odd,
      even: even ?? this.even,
      firstEighteen: firstEighteen ?? this.firstEighteen,
      secondEighteen: secondEighteen ?? this.secondEighteen,
      firstTwelve: firstTwelve ?? this.firstTwelve,
      secondTwelve: secondTwelve ?? this.secondTwelve,
      thirdTwelve: thirdTwelve ?? this.thirdTwelve,
      numbers: numbers ?? this.numbers,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> betMap = {};
    if (red != 0) {
      betMap.addAll({'red': red});
    }
    if (black != 0) {
      betMap.addAll({'black': black});
    }
    if (odd != 0) {
      betMap.addAll({'odd': odd});
    }
    if (even != 0) {
      betMap.addAll({'even': even});
    }
    if (firstEighteen != 0) {
      betMap.addAll({'1-18': firstEighteen});
    }
    if (secondEighteen != 0) {
      betMap.addAll({'19-36': secondEighteen});
    }
    if (firstTwelve != 0) {
      betMap.addAll({'1-12': firstTwelve});
    }
    if (secondTwelve != 0) {
      betMap.addAll({'13-24': secondTwelve});
    }
    if (thirdTwelve != 0) {
      betMap.addAll({'25-36': thirdTwelve});
    }

    for (var i = 0; i < numbers.length; i++) {
      if (numbers[i] != null) {
        betMap.addAll({'$i': numbers[i]});
      }
    }
    return betMap;
  }

  String toJson() => json.encode(toMap());


  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      red,
      black,
      odd,
      even,
      firstEighteen,
      secondEighteen,
      firstTwelve,
      secondTwelve,
      thirdTwelve,
      numbers,
    ];
  }
}

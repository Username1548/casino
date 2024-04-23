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
    List<int>? numbers,
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
    if (red != null) {
      betMap.addAll({'red': red});
    }
    if (black != null) {
      betMap.addAll({'black': black});
    }
    if (odd != null) {
      betMap.addAll({'odd': odd});
    }
    if (even != null) {
      betMap.addAll({'even': even});
    }
    if (firstEighteen != null) {
      betMap.addAll({'1-18': firstEighteen});
    }
    if (secondEighteen != null) {
      betMap.addAll({'19-36': secondEighteen});
    }
    if (firstTwelve != null) {
      betMap.addAll({'1-12': firstTwelve});
    }
    if (secondTwelve != null) {
      betMap.addAll({'13-26': secondTwelve});
    }
    if (thirdTwelve != null) {
      betMap.addAll({'27-36': thirdTwelve});
    }

    for (var i = 0; i < numbers.length; i++) {
      if (numbers[i] != null) {
        betMap.addAll({'$i': numbers[i]});
      }
    }
    return betMap;
  }

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

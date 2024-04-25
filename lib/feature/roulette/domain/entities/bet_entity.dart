import 'package:casino/feature/roulette/data/models/bet_model.dart';
import 'package:equatable/equatable.dart';

class BetEntity extends Equatable {
  final int red;
  final int black;
  final int odd;
  final int even;
  final int firstEighteen;
  final int secondEighteen;
  final int firstTwelve;
  final int secondTwelve;
  final int thirdTwelve;
  final List<int?> numbers;
  const BetEntity({
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

  BetModel toModel() => BetModel(
      red: red,
      black: black,
      odd: odd,
      even: even,
      firstEighteen: firstEighteen,
      secondEighteen: secondEighteen,
      firstTwelve: firstTwelve,
      secondTwelve: secondTwelve,
      thirdTwelve: thirdTwelve,
      numbers: numbers);
  BetEntity copyWith({
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
    return BetEntity(
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

  bool isAnyBets() {
    bool result = false;
    if (red != 0 ||
        black != 0 ||
        odd != 0 ||
        even != 0 ||
        firstTwelve != 0 ||
        secondTwelve != 0 ||
        thirdTwelve != 0 ||
        firstEighteen != 0 ||
        secondEighteen != 0) {
      result = true;
    }

    for (var element in numbers) {
      if (element != null) {
        result = true;
        break;
      }
    }
    return result;
  }
}

import '../../domain/entities/bet_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rouletteStateProvider =
    StateNotifierProvider<RouletteStateNotifier, BetEntity>(
        (ref) => RouletteStateNotifier());

class RouletteStateNotifier extends StateNotifier<BetEntity> {
  RouletteStateNotifier()
      : super(BetEntity(
            red: 0,
            black: 0,
            odd: 0,
            even: 0,
            firstEighteen: 0,
            secondEighteen: 0,
            firstTwelve: 0,
            secondTwelve: 0,
            thirdTwelve: 0,
            numbers: List.generate(37, (index) => null)));

  red(int? betValue) {
    state = state.copyWith(red: betValue);
  }

  black(int? betValue) {
    state = state.copyWith(black: betValue);
  }

  odd(int? betValue) {
    state = state.copyWith(odd: betValue);
  }

  even(int? betValue) {
    state = state.copyWith(even: betValue);
  }

  firstEighteen(int? betValue) {
    state = state.copyWith(firstEighteen: betValue);
  }

  secondEighteen(int? betValue) {
    state = state.copyWith(secondEighteen: betValue);
  }

  firstTwelve(int? betValue) {
    state = state.copyWith(firstTwelve: betValue);
  }

  secondTwelve(int? betValue) {
    state = state.copyWith(secondTwelve: betValue);
  }

  thirdTwelve(int? betValue) {
    state = state.copyWith(thirdTwelve: betValue);
  }

  number(int number, int? betValue) {
    final numbersState = state.numbers;
    numbersState[number] = betValue;

    state = state.copyWith(numbers: numbersState);
  }

  cleanState() {
    state = BetEntity(
        red: 0,
        black: 0,
        odd: 0,
        even: 0,
        firstEighteen: 0,
        secondEighteen: 0,
        firstTwelve: 0,
        secondTwelve: 0,
        thirdTwelve: 0,
        numbers: List.generate(37, (index) => null));
  }
}

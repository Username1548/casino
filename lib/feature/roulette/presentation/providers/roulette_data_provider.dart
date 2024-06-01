import '../../../../core/general_balance/providers/balance_state_provider.dart';
import '../../domain/entities/bet_entity.dart';
import '../../domain/entities/roulette_entity.dart';
import '../../domain/use_cases/roulette_usecases.dart';
import '../../../user_managment/domain/entities/user_entity.dart';
import '../../../user_managment/presentation/providers/user_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rouletteDataProvider =
    StateNotifierProvider<RouletteNotifier, AsyncValue<RouletteEntity>>((ref) {
  final play = ref.read(playProvider);
  final userData = ref.watch(userNotifierProvider);
  final changeUserBalance = ref.read(userDataNotifierStateProvider.notifier);
  return RouletteNotifier(play, userData, changeUserBalance);
});

class RouletteNotifier extends StateNotifier<AsyncValue<RouletteEntity>> {
  final Play _play;
  final UserEntity userData;
  final UserDataNotifier userDataNotifier;

  RouletteNotifier(this._play, this.userData, this.userDataNotifier)
      : super(const AsyncLoading());

  play(BetEntity bet) async {
    state = const AsyncLoading();
    if (bet.isAnyBets()) {
      final result = await _play(
          userData.username, userData.password, userData.token, bet);

      state =
          result.fold((l) => AsyncError(l.message, StackTrace.current), (r) {
        userDataNotifier.chageUserBalanse(r.moneyDelta);
        return AsyncData(r);
      });
    }
  }
}

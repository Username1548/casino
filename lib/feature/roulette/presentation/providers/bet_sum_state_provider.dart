import 'package:casino/core/general_balance/domain/entities/user_data_entity.dart';
import 'package:casino/core/general_balance/providers/balance_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final betSumStateProvider =
    StateNotifierProvider<BetSumStateNotifier, int>((ref) {
  final userData = ref.read(userDataNotifierStateProvider);
  return BetSumStateNotifier(userData);
});

class BetSumStateNotifier extends StateNotifier<int> {
  BetSumStateNotifier(this.userData) : super(0);
  final UserDataEntity? userData;

  changeSum(int betValue) {
    if (state + betValue < userData!.balance) {
      state = state + betValue;
    }
  }

  cleanState() {
    state = 0;
  }
}

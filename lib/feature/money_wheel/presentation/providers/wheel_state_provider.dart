import 'package:casino/core/general_balance/providers/balance_state_provider.dart';
import 'package:casino/feature/money_wheel/domain/entities/wheel_entity.dart';
import 'package:casino/feature/money_wheel/domain/use_cases/wheel_use_cases.dart';
import 'package:casino/feature/user_managment/domain/entities/user_entity.dart';
import 'package:casino/feature/user_managment/presentation/providers/user_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wheelDataProvider =
    StateNotifierProvider<WheelDataNotifier, AsyncValue<WheelEntity>>((ref) {
  final spin = ref.read(spinProvider);
  final userData = ref.watch(userNotifierProvider);
  final changeUserBalance = ref.read(userDataNotifierStateProvider.notifier);
  return WheelDataNotifier(spin, userData, changeUserBalance);
});

class WheelDataNotifier extends StateNotifier<AsyncValue<WheelEntity>> {
  final Spin _spin;
  final UserEntity userData;
  final UserDataNotifier userDataNotifier;

  WheelDataNotifier(this._spin, this.userData, this.userDataNotifier)
      : super(const AsyncLoading());

  spin() async {
    state = const AsyncLoading();
    final result = await _spin(
        username: userData.username,
        password: userData.password,
        token: userData.token);
    state = result.fold((l) => AsyncError(l.message, StackTrace.current), (r) {
      userDataNotifier.chageUserBalanse(r.moneyDelta);
      return AsyncData(r);
    });
  }

  cleanState() {
    state = const AsyncLoading();
  }
}

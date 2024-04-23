import 'package:casino/feature/user_managment/domain/entities/user_entity.dart';
import 'package:casino/feature/user_managment/domain/use_cases/user_use_cases.dart';
import 'package:casino/feature/user_managment/presentation/providers/user_state_provider.dart';
import 'package:casino/feature/user_managment/presentation/providers/user_use_cases_proveders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casino/core/general_balance/domain/entities/user_data_entity.dart';
import 'package:casino/core/general_balance/domain/use_cases/main_page_use_cases.dart';

final userDataNotifierStateProvider =
    StateNotifierProvider<UserDataNotifier, UserDataEntity?>((ref) {
  final user = ref.watch(userNotifierProvider);
  final getUserData = ref.read(getUserDataProvider);
  final cashUserData = ref.read(cashUserDataProvider);
  return UserDataNotifier(user, getUserData, cashUserData);
});

class UserDataNotifier extends StateNotifier<UserDataEntity?> {
  final GetUserData _getUserData;
  final UserEntity _user;
  final CashUserData _cashUserData;
  UserDataNotifier(this._user, this._getUserData, this._cashUserData)
      : super(null);

  getUserData() async {
    final userData =
        await _getUserData(_user.username, _user.password, _user.token);
    state = userData.fold(
        (l) =>
            UserDataEntity(username: l.message, balance: 0, message: l.message),
        (r) {
      _cashUserData.call(
          username: r.username, password: _user.password, token: _user.token);
      return UserDataEntity(username: r.username, balance: r.balance);
    });
  }

  changeUserBalance(int changeValue) {
    if (state != null) {
      state = state!.copyWith(balance: state!.balance + changeValue);
    }
  }
}

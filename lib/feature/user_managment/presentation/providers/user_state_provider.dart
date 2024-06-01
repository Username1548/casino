import '../../../../core/user_token.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/user_use_cases.dart';
import 'user_use_cases_proveders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserEntity>((ref) {
  final signIn = ref.read(signInProvider);
  final signUp = ref.read(signUpProvider);
  final getUserToken = ref.read(getUserTokenProvider);
  final cashUserData = ref.read(cashUserDataProvider);
  final getCashedData = ref.read(getCashedDataProvider);
  return UserNotifier(
      signIn, signUp, getUserToken, cashUserData, getCashedData);
});

class UserNotifier extends StateNotifier<UserEntity> {
  final SignIn _signIn;
  final SignUp _signUp;
  final GetUserToken _getUserToken;
  final CashUserData _cashUserData;
  final GetCashedData _getCashedData;

  UserNotifier(this._signIn, this._signUp, this._getUserToken,
      this._cashUserData, this._getCashedData)
      : super(UserEntity('', '', userToken, false, ''));

  signIn(String username, String password, String token) async {
    final tokenOrFailure =
        await _signIn(password: password, username: username, token: token);
    state = tokenOrFailure.fold<UserEntity>(
        (l) => state.copyWith(
            username: '',
            password: '',
            token: userToken,
            isRegistred: false,
            messege: l.message), (validToken) {
      userToken = validToken;
      return state.copyWith(
          username: username,
          password: password,
          token: validToken,
          isRegistred: true,
          messege: '');
    });
  }

  signUp(String username, String password) async {
    final result = await _signUp(username: username, password: password);
    state = result.fold<UserEntity>(
        (l) => state.copyWith(
            token: userToken,
            isRegistred: false,
            messege: l.message), (validToken) {
      userToken = validToken;
      return state.copyWith(
          username: username,
          password: password,
          token: validToken,
          isRegistred: true,
          messege: '');
    });
  }

  getUserToken(String username, String password) async {
    final tokenOrFailure =
        await _getUserToken(password: password, username: username);
    state = tokenOrFailure.fold<UserEntity>(
        (l) => state.copyWith(
            username: username,
            password: password,
            token: userToken,
            isRegistred: false,
            messege: l.message), (validToken) {
      userToken = validToken;
      return state.copyWith(
          username: username,
          password: password,
          token: userToken,
          isRegistred: true,
          messege: '');
    });
  }

  cashUserData(String username, String password, String token) async {
    await _cashUserData.call(
        username: username, password: password, token: token);
  }

  getCashedData() {
    final result = _getCashedData();
    state = result.fold<UserEntity>((l) {
      return state.copyWith(isRegistred: false, messege: l.message);
    }, (r) {
      userToken = r['token'] ?? '';
      return state.copyWith(
          username: r['username'],
          password: r['password'],
          token: userToken,
          isRegistred: true);
    });
  }
}

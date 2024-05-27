import 'package:casino/core/shared_preferences_singletone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSource(pref: pref);
});

class UserLocalDataSource {
  final SharedPreferences pref;

  UserLocalDataSource({required this.pref});

  Future<void> cashUserData(
      String username, String password, String token) async {
    await pref.setString('username', username);
    await pref.setString('password', password);
    await pref.setString('token', token);
  }

  Map<String, String?> getCashedData() {
    Map<String, String?> userData = {};
    userData.addAll({
      'username': pref.getString('username'),
      'password': pref.getString('password'),
      'token': pref.getString('token')
    });
    
    return userData;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String password;
  final String token;
  final bool isRegistred;
  final String messege;

  const UserEntity(this.username, this.password, this.token, this.isRegistred, this.messege);

  UserEntity copyWith({
    String? username,
    String? password,
    String? token,
    bool? isRegistred,
    String? messege
  }) {
    return UserEntity(
      username ?? this.username,
      password ?? this.password,
      token ?? this.token,
      isRegistred ?? this.isRegistred,
      messege ?? this.messege
    );
  }

  @override
  List<Object> get props => [username, password, token, isRegistred, messege];
}

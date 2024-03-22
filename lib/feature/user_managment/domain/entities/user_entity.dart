import 'package:casino/feature/user_managment/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String password;

  const UserEntity({
    required this.username,
    required this.password,
  });

  factory UserEntity.fromEntity(UserModel userEntity) =>
      UserEntity(username: userEntity.username, password: userEntity.password);

  UserModel toEntity() => UserModel(username: username, password: password);

  UserEntity copyWith({
    String? username,
    String? password,
  }) {
    return UserEntity(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, password];
}

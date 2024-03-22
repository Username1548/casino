import 'package:equatable/equatable.dart';

import 'package:casino/feature/user_managment/domain/entities/user_entity.dart';

class UserModel extends Equatable {
  final String username;
  final String password;

  const UserModel({
    required this.username,
    required this.password,
  });

  factory UserModel.fromEntity(UserEntity userEntity) =>
      UserModel(username: userEntity.username, password: userEntity.password);

  UserEntity toEntity() => UserEntity(username: username, password: password);

  UserModel copyWith({
    String? username,
    String? password,
  }) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }


  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, password];
}

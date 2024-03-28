// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:casino/feature/main/data/models/user_data_model.dart';
import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final String username;
  final double balance;

  const UserDataEntity({required this.username, required this.balance});

  factory UserDataEntity.fromModel(UserDataEntity dataEntity) =>
      UserDataEntity(username: dataEntity.username, balance: dataEntity.balance);

  UserDataModel toModel() =>
      UserDataModel(username: username, balance: balance);

  @override
  List<Object> get props => [username, balance];

  UserDataEntity copyWith({
    String? username,
    double? balance,
  }) {
    return UserDataEntity(
      username: username ?? this.username,
      balance: balance ?? this.balance,
    );
  }
}

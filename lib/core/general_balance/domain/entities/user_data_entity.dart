// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:casino/core/general_balance/data/models/user_data_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserDataEntity extends Equatable {
  final String username;
  final int balance;
  String? message;

  UserDataEntity({required this.username, required this.balance, this.message});

  factory UserDataEntity.fromModel(UserDataEntity dataEntity) => UserDataEntity(
      username: dataEntity.username, balance: dataEntity.balance);

  UserDataModel toModel() =>
      UserDataModel(username: username, balance: balance);

  @override
  List<Object> get props => [username, balance];

  UserDataEntity copyWith({
    String? username,
    int? balance,
    String? message
  }) {
    return UserDataEntity(
      username: username ?? this.username,
      balance: balance ?? this.balance,
      message: message ?? this.message
    );
  }
}

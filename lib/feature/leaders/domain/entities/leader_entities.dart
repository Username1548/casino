import 'package:casino/feature/leaders/data/models/leader_model.dart';
import 'package:equatable/equatable.dart';

class LeaderEntity extends Equatable {
  final String username;
  final int balance;

  const LeaderEntity({
    required this.username,
    required this.balance,
  });

  factory LeaderEntity.fromModel(LeaderModel leaderModel) => LeaderEntity(
      username: leaderModel.username, balance: leaderModel.balance);

  LeaderModel toModel() => LeaderModel(username: username, balance: balance);

  LeaderEntity copyWith({
    String? username,
    int? balance,
  }) {
    return LeaderEntity(
      username: username ?? this.username,
      balance: balance ?? this.balance,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, balance];
}

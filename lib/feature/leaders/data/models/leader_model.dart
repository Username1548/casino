import 'package:casino/feature/leaders/domain/entities/leader_entities.dart';
import 'package:equatable/equatable.dart';

class LeaderModel extends Equatable {
  final String username;
  final int balance;

  const LeaderModel({
    required this.username,
    required this.balance,
  });

  factory LeaderModel.fromEntity(LeaderEntity leaderEntity) => LeaderModel(
      username: leaderEntity.username, balance: leaderEntity.balance);

  LeaderEntity toEntity() => LeaderEntity(username: username, balance: balance);

  LeaderModel copyWith({
    String? username,
    int? balance,
  }) {
    return LeaderModel(
      username: username ?? this.username,
      balance: balance ?? this.balance,
    );
  }

  factory LeaderModel.fromMap(Map<String, dynamic> map) {
    return LeaderModel(
      username: map['username'] as String,
      balance: map['balance'] as int,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, balance];
}

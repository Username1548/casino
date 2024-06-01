import '../../../../core/error/failures.dart';
import '../../data/repositories/leader_repository_impl.dart';
import '../entities/leader_entities.dart';
import '../repositories/leaders_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getLeadersProvider = Provider<GetLeaders>(
    (ref) => GetLeaders(leaderRepository: ref.read(leaderRepositoryProvider)));

class GetLeaders {
  final LeaderRepository leaderRepository;

  GetLeaders({required this.leaderRepository});

  Future<Either<Failure, List<LeaderEntity>>> call() async {
    final result = await leaderRepository.getLeaders();
    return result;
  }
}

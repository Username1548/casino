import '../../../../core/error/failures.dart';
import '../../domain/entities/leader_entities.dart';
import '../../domain/use_cases/leader_use_cases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leadersStateProvider =
    StateNotifierProvider<LeadersNotifier, AsyncValue<List<LeaderEntity>>>(
        (ref) {
  final getLeaders = ref.read(getLeadersProvider);
  return LeadersNotifier(getLeaders);
});

class LeadersNotifier extends StateNotifier<AsyncValue<List<LeaderEntity>>> {
  final GetLeaders _getLeaders;

  LeadersNotifier(this._getLeaders) : super(const AsyncValue.loading());

  getLeaders() async {
    final leaders = await _getLeaders();
    state = leaders.fold(
        (l) => AsyncValue.error(UnknowError(), StackTrace.current),
        (r) => AsyncValue.data(r));
  }
}

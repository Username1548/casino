import 'package:casino/feature/blackjack/data/models/hand_model.dart';
import 'package:casino/feature/blackjack/data/models/table_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/general_balance/providers/balance_state_provider.dart';
import '../../../user_managment/domain/entities/user_entity.dart';
import '../../../user_managment/presentation/providers/user_state_provider.dart';
import '../../data/repositories/bj_repository_impl.dart';
import '../repositories/bj_repository.dart';

final tableBjProvider = StateNotifierProvider<TableBjProviderClass, BjTable>
  (
        (ref) => TableBjProviderClass(
          BjTable(const BjHand([]), const BjHand([]), 1, false),
          remoteRepository: ref.read(bjRepositoryProvider),
          userData: ref.watch(userNotifierProvider),
          userDataNotifier: ref.read(userDataNotifierStateProvider.notifier)

        )
);


class TableBjProviderClass extends StateNotifier<BjTable>{
  final BjRepository remoteRepository;
  late UserEntity userData;
  final UserDataNotifier userDataNotifier;
  bool isWork = false;



  TableBjProviderClass(
      super.state,
      {
        required this.remoteRepository,
        required this.userData,
        required this.userDataNotifier
      }

      );

  void changeBet(int newBet){
    state = state.copyWith(
      playerHand: state.playerHand,
      dealerHand: state.dealerHand,
      bet: newBet
    );
  }

  Future<void> create() async {
    if (userData.exp == null || DateTime.now().isBefore(userData.exp!)) {
      String token = await remoteRepository.reloadToken(
          userData.username, userData.password);
      userData = userData.copyWith(
          username: userData.username,
          password: userData.password,
          token: token,
          isRegistred: userData.isRegistred,
          messege: userData.messege,
      exp: DateTime.now().add(const Duration(days: 1)));
    }
    final response = await remoteRepository.createTable(state.bet, userData.token, userData.username, userData.password);

    BjTable table = response.getOrElse(  // todo isRight()?
            () => BjTable(BjHand([]), BjHand([]), 0, false)
    );

      state = state.copyWith(
        playerHand: table.playerHand,
        dealerHand: table.dealerHand,
        bet: table.bet,
        isDouble: false
      );

    }

  Future<void> add() async {
    final response = await remoteRepository.addCard(userData.token, userData.username, userData.password);
    BjTable table = response.getOrElse(  // todo isRight()?
            () => BjTable(BjHand([]), BjHand([]), 0, false)
    );

    int bet = state.bet;
    if (table.bet != 0){
      bet = table.bet;
    }

    state = state.copyWith(
        playerHand: table.playerHand,
        dealerHand: table.dealerHand,
        bet: bet
    );
  }

  Future<void> stand() async {
    final response = await remoteRepository.stand(userData.token, userData.username, userData.password);

    //int result = response[1];



    BjTable table = response.getOrElse(  // todo isRight()?
            () => BjTable(BjHand([]), BjHand([]), 0, false)
    );
    int bet = state.bet;
    if (table.bet != 0){
        bet = table.bet;
    }

    state = state.copyWith(
        playerHand: table.playerHand,
        dealerHand: table.dealerHand,
        bet: bet
    );

    userDataNotifier.chageUserBalanse(state.result());

  }

  Future<void> double() async {
    if (userDataNotifier.state!.balance < state.bet * 2 ){
      return;
    }

    if (state.playerHand.cards.length != 2){
      return;
    }

    final response = await remoteRepository.double(userData.token, userData.username, userData.password);

    BjTable table = response.getOrElse(  // todo isRight()?
            () => BjTable(BjHand([]), BjHand([]), 0, false)
    );

    int bet = state.bet;
    if (table.bet != 0){
      bet = table.bet;
    }

    state = state.copyWith(
        playerHand: table.playerHand,
        dealerHand: table.dealerHand,
        bet: bet,
        isDouble: true
    );

    userDataNotifier.chageUserBalanse(state.result());

  }
}



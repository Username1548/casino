import 'package:casino/core/general_balance/providers/balance_state_provider.dart';
import 'package:casino/feature/main/wdgets/nav_panel_wodget.dart';
import 'package:casino/feature/main/wdgets/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    ref.read(userDataNotifierStateProvider.notifier).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataNotifierStateProvider);
    return Scaffold(
      body: userData == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(160, 255, 255, 255),
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: UserInfo(userData.username, userData.balance),
                  ),
                  const NavPanel()
                ],
              ),
            ),
    );
  }
}

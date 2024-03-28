import 'package:casino/feature/main/presentation/pages/main_page.dart';
import 'package:casino/feature/roulette/presentation/pages/roulette.dart';
import 'package:casino/feature/user_managment/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../feature/blackjack/presentation/screens/bj_bet.dart';
import '../feature/blackjack/presentation/screens/bj_game.dart';
import '../feature/blackjack/presentation/screens/bj_result.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
              selectionColor: Colors.grey,
              selectionHandleColor: Colors.grey),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white, background: Colors.green.shade900)),
      routes: {
        // Не забыть вернуть путь /
        "/": (context) => const WelcomePage(),
        "/BJGame": (context) => const BlackjackGameScreen(),
        "/BJResult": (context) => const BlackJackResultScreen(),
        "/Main/Roulette": (context) => const RoulettePage(),
        "/Main/BJBet": (context) => const BlackJackBetScreen(),
        "/Main": (context) => const MainPage()
      },
    );
  }
}

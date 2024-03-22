import 'package:casino/feature/roulette/presentation/pages/roulette.dart';
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
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, background: Colors.green.shade900)),
      routes: {
        // Не забыть вернуть путь /
        "/": (context) => const RoulettePage(),
        "/BJGame": (context) => const BlackjackGameScreen(),
        "/BJResult": (context) => const BlackJackResultScreen(),
        "/Roulette": (context) => const BlackJackBetScreen()
      },
    );
  }
}

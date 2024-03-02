import 'package:flutter/material.dart';

import '../feature/blackjack/presentation/screens/bj_bet.dart';
import '../feature/blackjack/presentation/screens/bj_game.dart';
import '../feature/blackjack/presentation/screens/bj_result.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          useMaterial3: true, colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple).
      copyWith(background: Colors.green.shade900)
      ),
      routes: {
        "/": (context) => const BlackJackBetScreen(),
        "/BJGame": (context) =>  const BlackjackGameScreen(),
        "/BJResult": (context) =>  const BlackJackResultScreen()
      },
    );
  }
}

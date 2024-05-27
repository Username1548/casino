import 'package:casino/feature/leaders/presentation/pages/leaders_page.dart';
import 'package:casino/feature/main/pages/main_page.dart';
import 'package:casino/feature/money_wheel/presentation/pages/money_wheel_page.dart';
import 'package:casino/feature/roulette/presentation/pages/roulette_page.dart';
import 'package:casino/feature/rules/presentation/pages/rules_page.dart';
import 'package:casino/feature/user_managment/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../feature/blackjack/presentation/screens/bj_bet.dart';
import '../feature/blackjack/presentation/screens/bj_game.dart';
import '../feature/blackjack/presentation/screens/bj_result.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
              selectionColor: Colors.grey,
              selectionHandleColor: Colors.grey),
          fontFamily: GoogleFonts.sourceSerif4(
                  fontWeight: FontWeight.bold, color: Colors.white)
              .fontFamily,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white, background: Colors.green.shade900)),
      routes: {
        "/": (context) => const WelcomePage(),
        "/Main/BJBet": (context) => BlackJackBetScreen(),
        "/BJGame": (context) => const BlackjackGameScreen(),
        "/BJResult": (context) => const BlackJackResultScreen(),
        "/Main/Roulette": (context) => const RoulettePage(),

        "/Main": (context) => const MainPage(),
        "/Main/Rules": (context) =>  const RulesPage(),
        "/Main/Leaders": (context) => const LeaderBoardPage(),
        "/Main/MoneyWheel":(context) => const MoneyWheelPage()
      },
    );
  }
}

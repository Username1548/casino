import 'package:casino/blackjack/provider.dart';
import 'package:flutter/material.dart';
import 'package:casino/blackjack/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'blackjack/methods.dart';



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const BlackJackBetScreen(),
        "/BJGame": (context) =>  BlackjackGameScreen(),
        "/BJResult": (context) => const BlackJackResultScreen()
      },
    );
  }
}


class BlackjackGameScreen extends StatefulWidget {
  const BlackjackGameScreen({super.key});

  @override
  State<BlackjackGameScreen> createState() => _BlackjackGameScreenState();
}




class _BlackjackGameScreenState extends State<BlackjackGameScreen> {
  List<CardBj> deck = getFullDeck();
  late TableBj table;

  @override
  void initState() {
    //инициализация данных
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    initPlatformState();
    table = TableBj(deck, 0); //todo change bet
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    if (table.mainHand.cards.isEmpty) {
      table.mainHand.addCardBj();
      table.mainHand.addCardBj();

      table.dealerHand.addCardBj();
    }

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 350,
                    height: 300,
                    child: Column(
                      children: [
                        const ListTile(title: Text("Ваши карты:")),
                        SizedBox(
                            width: 300,
                            height: 130,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: getImages(table.mainHand.cards))),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            table.mainHand.addCardBj();
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                        color: Colors.green),
                                    const Text("Hit")
                                  ])),
                              SizedBox(
                                  child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            table.dealerTurn();
                                          });
                                        },
                                        icon: const Icon(Icons.stop),
                                        color: Colors.red),
                                    const Text("Stand")
                                  ])),
                              SizedBox(
                                  child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            table.dealerTurn();
                                          });
                                        },
                                        icon: const Icon(Icons.looks_two_rounded),
                                        color: Colors.amber),
                                    const Text("x2")
                                  ]))
                            ])
                      ],
                    )),
                SizedBox(
                    width: 350,
                    height: 300,
                    child: Column(
                      children: [
                        const ListTile(title: Text("Карты дилера:")),
                        SizedBox(
                            width: 300,
                            height: 130,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: getImages(table.dealerHand.cards)))
                      ],
                    ))
              ],
            )));
  }
}


class BlackJackBetScreen extends StatefulWidget {
  const BlackJackBetScreen({super.key});

  @override
  State<BlackJackBetScreen> createState() => _BlackJackBetScreenState();
}

class _BlackJackBetScreenState extends State<BlackJackBetScreen> {
  int bet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Blackjack"), backgroundColor: Colors.lightGreen),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (bet > 1) {
                      bet -= 1;
                    }
                  });
                },
                icon: const Icon(Icons.remove)),
            Title(color: Colors.black, child: Text("Ставка: $bet")),
            IconButton(
                onPressed: () {
                  setState(() {
                    bet += 1;
                  });
                },
                icon: const Icon(Icons.add))
          ]),
          FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, "/BJGame");
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Играть"))
        ],
      ),
    );
  }
}


class BlackJackResultScreen extends StatelessWidget {
  const BlackJackResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}


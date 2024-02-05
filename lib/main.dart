import 'package:flutter/material.dart';
import 'package:casino/blackjack/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BlackjackGameScreen(),
    );
  }
}

class BlackjackGameScreen extends StatefulWidget {
  const BlackjackGameScreen({super.key});

  @override
  State<BlackjackGameScreen> createState() => _BlackjackGameScreenState();
}

class _BlackjackGameScreenState extends State<BlackjackGameScreen> {

  @override
  Widget build(BuildContext context) {

    List<CardBj> deck = getFullDeck();
    TableBj table = TableBj(deck, 0);


    return Scaffold(
      appBar: AppBar(title: const Text("Blackjack"), backgroundColor: Colors.lightGreen),
      body: Column(
        children: [
          Text("${table.mainHand.getImages()}"),
          SizedBox(
              width: 90*5,
              height: 250,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: table.mainHand.getImages(),
          )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      table.mainHand.addCardBj();
                    });
                  }, icon: const Icon(Icons.add), color: Colors.green),
                  const Text("Hit")
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.stop), color: Colors.red),
                  const Text("Stand")
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}



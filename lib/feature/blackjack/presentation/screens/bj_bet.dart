import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../internal/provider.dart';


class BlackJackBetScreen extends ConsumerWidget {
  const BlackJackBetScreen({super.key});

  static const chipsValue = [1, 5, 10, 25, 100, 250, 1000];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final table = ref.watch(tableBjProvider);

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [

              Center(child: Container(
                  width: 220, height: 50,
                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)), color: Colors.red.shade900),
                  //padding: const EdgeInsets.all(10),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: "Ставка: ${table.bet}", border: InputBorder.none,
                        hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        suffixIcon: IconButton(color: Colors.white, icon: const Icon(Icons.close), onPressed: (){ref.read(tableBjProvider.notifier).changeBet(1);})
                    ),
                    textAlign: TextAlign.center,

                  )
              )),

              const SizedBox(height: 40),
              SizedBox(
                  width: double.maxFinite, height: 70,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 35);
                    },
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {

                      return IconButton(
                        icon: Image.asset(
                            'assets/images/chips/standard/${chipsValue[index]}.png'
                        ),
                        onPressed: () {
                          int start = table.bet;
                          if (table.bet == 1){
                            start = 0;
                          }
                          ref.read(tableBjProvider.notifier).
                          changeBet(start + chipsValue[index]);
                        },
                      );
                    },



                  )),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width:200, child:FilledButton(
                      onPressed: () {
                      },
                      style: FilledButton.styleFrom(backgroundColor: Colors.red.shade900),
                      child: const Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), "Главное меню"))),
                  SizedBox(width:200, child:FilledButton(
                      onPressed: () {
                        table.mainHand.addCardBj();
                        table.mainHand.addCardBj();
                        table.dealerHand.addCardBj();

                        if (table.checkBj(table.mainHand)){
                          ref.read(tableBjProvider.notifier).stand();
                          Navigator.pushNamed(context, "/BJResult");
                        } else {
                          Navigator.pushNamed(context, "/BJGame");
                        }

                      },
                      style: FilledButton.styleFrom(backgroundColor: Colors.red.shade900),
                      child: const Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), "Играть")))
                ],)
            ],
          )),
    );
  }
}

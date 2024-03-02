import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/main.dart';
import '../../internal/methods.dart';

class BlackjackGameScreen extends ConsumerWidget {
  const BlackjackGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final table = ref.watch(tableBjProvider);




    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 400,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        const ListTile(title: Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), "Ваши карты:")),
                        SizedBox(
                            width: 400,
                            height: 130,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: getImages(table.mainHand.cards))),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            width: 400,
                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      child: Row(children: [
                                        IconButton(
                                            onPressed: () {
                                              ref.read(tableBjProvider.notifier).addCard();
                                            },
                                            icon: const Icon(Icons.add),
                                            color: Colors.green),
                                        const Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), "Hit")
                                      ])),
                                  SizedBox(
                                      child: Row(children: [
                                        IconButton(
                                            onPressed: () {
                                              ref.read(tableBjProvider.notifier).stand();
                                              Navigator.pushNamed(context, "/BJResult");
                                            },
                                            icon: const Icon(Icons.stop),
                                            color: Colors.red),
                                        const Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), "Stand")
                                      ])),
                                  if (table.mainHand.canDouble)
                                    SizedBox(
                                        child: Row(children: [
                                          IconButton(
                                              onPressed: () {
                                                if (table.mainHand.canDouble) {
                                                  ref.read(tableBjProvider.notifier)
                                                      .double();
                                                  Navigator.pushNamed(context, "/BJResult");
                                                }
                                              },
                                              icon: const Icon(Icons.looks_two_rounded),
                                              color: Colors.amber),
                                          const Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), "Double")
                                        ]))
                                ]))
                      ],
                    )),
                SizedBox(
                    width: 300,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        const ListTile(title: Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), "Карты дилера:")),
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